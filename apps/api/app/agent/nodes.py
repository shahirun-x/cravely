"""
LangGraph agent nodes — the 4 processing steps of the Cravely agent.
"""

import json
import logging
import os
import uuid
from typing import Any

from google import genai
from upstash_redis import Redis

from app.agent.prompts import INTENT_CLASSIFIER_PROMPT, RESPONSE_FORMATTER_PROMPT
from app.agent.state import AgentState
from app.db.connection import get_db
from app.tools.search import (
    filter_search,
    get_restaurant_detail,
    get_user_preferences,
    save_to_favorites,
    semantic_search,
)

logger = logging.getLogger(__name__)

# ── Module-level Gemini client (set during app startup) ──

_gemini_client: genai.Client | None = None


def set_gemini_client(client: genai.Client) -> None:
    """Called from app startup to inject the Gemini client."""
    global _gemini_client
    _gemini_client = client


# ── Redis client (Upstash HTTP) ──

_redis: Redis | None = None


def _get_redis() -> Redis | None:
    global _redis
    if _redis is None:
        url = os.getenv("UPSTASH_REDIS_REST_URL")
        token = os.getenv("UPSTASH_REDIS_REST_TOKEN")
        if url and token:
            _redis = Redis(url=url, token=token)
    return _redis


# ── Gemini helper ──

def _call_gemini(system_prompt: str, user_message: str) -> str:
    """Call Gemini 2.5 Flash via the new google-genai SDK and return the text."""
    if _gemini_client is None:
        raise RuntimeError("Gemini client not initialized. Call set_gemini_client() first.")

    response = _gemini_client.models.generate_content(
        model="gemini-2.5-flash",
        contents=user_message,
        config=genai.types.GenerateContentConfig(
            system_instruction=system_prompt,
        ),
    )
    return response.text.strip()


# ── Conversation history helpers ──

def _get_conversation_history(session_id: str, count: int = 6) -> list[dict]:
    """Fetch last N messages from Redis for this session."""
    redis = _get_redis()
    if not redis:
        return []
    try:
        key = f"cravely:chat:{session_id}"
        messages = redis.lrange(key, -count, -1)
        if not messages:
            return []
        return [json.loads(m) if isinstance(m, str) else m for m in messages]
    except Exception as e:
        logger.warning(f"Redis read error: {e}")
        return []


def _save_message(session_id: str, role: str, content: str) -> None:
    """Append a message to the Redis conversation history."""
    redis = _get_redis()
    if not redis:
        return
    try:
        key = f"cravely:chat:{session_id}"
        msg = json.dumps({"role": role, "content": content})
        redis.rpush(key, msg)
        redis.ltrim(key, -10, -1)  # keep last 10 messages
        redis.expire(key, 86400)   # 24h TTL
    except Exception as e:
        logger.warning(f"Redis write error: {e}")


# ═══════════════════════════════════════════════════════════════════
# Node 1: Intent Classifier
# ═══════════════════════════════════════════════════════════════════

async def intent_classifier_node(state: AgentState) -> dict[str, Any]:
    """Classify user intent and extract structured params using Gemini."""

    session_id = state.get("session_id") or str(uuid.uuid4())
    history = _get_conversation_history(session_id)

    # Build context for Gemini
    history_text = ""
    if history:
        history_text = "\n\nConversation history:\n"
        for msg in history:
            role = msg.get("role", "user")
            content = msg.get("content", "")
            history_text += f"{role}: {content}\n"

    user_input = f"{history_text}\nCurrent user message: {state['message']}"

    try:
        raw = _call_gemini(INTENT_CLASSIFIER_PROMPT, user_input)

        # Strip markdown code blocks if Gemini wraps the JSON
        if raw.startswith("```"):
            raw = raw.split("\n", 1)[1] if "\n" in raw else raw[3:]
            if raw.endswith("```"):
                raw = raw[:-3]
            raw = raw.strip()

        parsed = json.loads(raw)
    except (json.JSONDecodeError, Exception) as e:
        logger.error(f"Intent classification failed: {e}")
        parsed = {
            "intent": "unclear",
            "extracted_params": {"query_text": state["message"]},
            "needs_clarification": True,
            "clarification_question": "I didn't quite catch that. Could you tell me what kind of food you're looking for and which area of the city?",
        }

    intent = parsed.get("intent", "unclear")
    extracted_params = parsed.get("extracted_params", {})

    # If clarification needed, short-circuit
    final_response = ""
    if parsed.get("needs_clarification"):
        intent = "unclear"
        final_response = parsed.get("clarification_question", "Could you tell me more about what you're looking for?")

    return {
        "session_id": session_id,
        "intent": intent,
        "extracted_params": extracted_params,
        "conversation_history": history,
        "final_response": final_response,
    }


# ═══════════════════════════════════════════════════════════════════
# Node 2: Query Builder
# ═══════════════════════════════════════════════════════════════════

async def query_builder_node(state: AgentState) -> dict[str, Any]:
    """Decide which tool to call based on classified intent."""

    intent = state.get("intent", "unclear")
    params = state.get("extracted_params", {})

    if intent == "chitchat":
        return {"tool_used": "none"}

    if intent == "unclear":
        return {"tool_used": "none"}

    if intent == "save_favorite":
        return {"tool_used": "save_to_favorites"}

    if intent == "restaurant_detail":
        return {"tool_used": "get_restaurant_detail"}

    # find_restaurant or find_dish
    has_specific_filters = any([
        params.get("neighborhood"),
        params.get("cuisine"),
        params.get("price_range"),
        params.get("is_veg") is not None,
    ])

    if intent == "find_dish" or (intent == "find_restaurant" and not has_specific_filters):
        return {"tool_used": "semantic_search"}

    return {"tool_used": "filter_search"}


# ═══════════════════════════════════════════════════════════════════
# Node 3: Executor
# ═══════════════════════════════════════════════════════════════════

async def executor_node(state: AgentState) -> dict[str, Any]:
    """Execute the selected tool against the database."""

    tool_used = state.get("tool_used", "none")
    params = state.get("extracted_params", {})
    city = state.get("city", "Chennai")
    tool_results = []

    if tool_used == "none":
        # Save user message to Redis
        _save_message(state["session_id"], "user", state["message"])
        return {"tool_results": []}

    try:
        async with get_db() as conn:
            if tool_used == "semantic_search":
                query_text = params.get("query_text", state["message"])
                tool_results = await semantic_search(conn, query_text, city=city)

            elif tool_used == "filter_search":
                tool_results = await filter_search(
                    conn,
                    city=city,
                    neighborhood=params.get("neighborhood"),
                    cuisine=params.get("cuisine"),
                    price_range=params.get("price_range"),
                    is_veg=params.get("is_veg"),
                )

            elif tool_used == "get_restaurant_detail":
                restaurant_id = params.get("restaurant_id")
                if restaurant_id:
                    detail = await get_restaurant_detail(conn, restaurant_id)
                    tool_results = [detail] if detail else []
                else:
                    # Try semantic search with restaurant name
                    name = params.get("restaurant_name", state["message"])
                    tool_results = await semantic_search(conn, name, city=city, limit=1)

            elif tool_used == "save_to_favorites":
                user_id = state.get("user_id")
                restaurant_id = params.get("restaurant_id")
                if user_id and restaurant_id:
                    result = await save_to_favorites(conn, user_id, restaurant_id)
                    tool_results = [result]
                else:
                    tool_results = [{"success": False, "error": "Missing user_id or restaurant_id"}]

    except Exception as e:
        logger.error(f"Tool execution error: {e}")
        tool_results = []

    # Save user message to Redis
    _save_message(state["session_id"], "user", state["message"])

    return {"tool_results": tool_results}


# ═══════════════════════════════════════════════════════════════════
# Node 4: Response Formatter
# ═══════════════════════════════════════════════════════════════════

async def response_formatter_node(state: AgentState) -> dict[str, Any]:
    """Format the final response using Gemini based on tool results."""

    intent = state.get("intent", "unclear")
    channel = state.get("channel", "web")
    tool_results = state.get("tool_results", [])

    # If we already have a final_response (e.g. clarification question), use it
    if state.get("final_response") and intent in ("unclear", "chitchat"):
        if intent == "chitchat":
            # Generate chitchat response
            user_input = f"Channel: {channel}\n\nUser message: {state['message']}"
            response_text = _call_gemini(RESPONSE_FORMATTER_PROMPT, user_input)
        else:
            response_text = state["final_response"]

        _save_message(state["session_id"], "assistant", response_text)

        return {
            "final_response": response_text,
            "restaurants": [],
        }

    # Format tool results for Gemini
    results_text = json.dumps(tool_results, indent=2, default=str) if tool_results else "No results found."

    user_input = (
        f"Channel: {channel}\n"
        f"User intent: {intent}\n"
        f"User message: {state['message']}\n\n"
        f"Search results:\n{results_text}"
    )

    try:
        response_text = _call_gemini(RESPONSE_FORMATTER_PROMPT, user_input)
    except Exception as e:
        logger.error(f"Response formatting error: {e}")
        response_text = "I had a little trouble finding that. Could you try rephrasing your request?"

    # Save assistant response to Redis
    _save_message(state["session_id"], "assistant", response_text)

    # Build structured restaurant list for UI
    restaurants = []
    for r in tool_results:
        if isinstance(r, dict) and "name" in r:
            restaurants.append(r)

    return {
        "final_response": response_text,
        "restaurants": restaurants,
    }
