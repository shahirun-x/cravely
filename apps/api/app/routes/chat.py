"""
Chat API route — the main user-facing endpoint.
"""

import asyncio
import json
import logging
import uuid
from typing import Optional

from fastapi import APIRouter

from app.agent.graph import agent
from app.db.connection import get_db
from app.models.schemas import AgentResponse, ChatRequest, RestaurantResult

logger = logging.getLogger(__name__)

router = APIRouter()


async def _log_conversation(
    user_id: Optional[str],
    session_id: str,
    channel: str,
    user_message: str,
    assistant_message: str,
    intent: str,
    tool_used: str,
) -> None:
    """Fire-and-forget: log conversation to Supabase using asyncpg."""
    try:
        async with get_db() as conn:
            if user_id:
                try:
                    exists = await conn.fetchval("SELECT id FROM users WHERE id = $1", user_id)
                    if not exists:
                        user_id = None
                except Exception as e:
                    logger.warning(f"Failed checking user_id: {e}")
                    user_id = None

            # Upsert conversation
            await conn.execute(
                """
                INSERT INTO conversations (id, user_id, channel, session_id)
                VALUES (gen_random_uuid(), $1, $2, $3)
                ON CONFLICT DO NOTHING
                """,
                user_id, channel, session_id,
            )

            # Get conversation id
            row = await conn.fetchrow(
                "SELECT id FROM conversations WHERE session_id = $1 LIMIT 1",
                session_id,
            )
            if not row:
                return
            conv_id = row["id"]

            # Insert user message
            await conn.execute(
                """
                INSERT INTO messages (id, conversation_id, role, content)
                VALUES (gen_random_uuid(), $1, 'user', $2)
                """,
                conv_id, user_message,
            )

            # Insert assistant message
            tool_calls_json = json.dumps({"intent": intent, "tool": tool_used})
            await conn.execute(
                """
                INSERT INTO messages (id, conversation_id, role, content, tool_calls)
                VALUES (gen_random_uuid(), $1, 'assistant', $2, $3::jsonb)
                """,
                conv_id, assistant_message, tool_calls_json,
            )
    except Exception as e:
        logger.warning(f"Conversation logging failed: {e}")


@router.post("/chat", response_model=AgentResponse)
async def chat(request: ChatRequest) -> AgentResponse:
    """
    Main chat endpoint. Sends user message through the LangGraph agent.
    """
    session_id = request.session_id or str(uuid.uuid4())

    # Build initial state
    initial_state = {
        "message": request.message,
        "session_id": session_id,
        "user_id": request.user_id,
        "channel": request.channel,
        "city": request.city,
        "intent": "",
        "extracted_params": {},
        "tool_used": "",
        "tool_results": [],
        "conversation_history": [],
        "final_response": "",
        "restaurants": [],
    }

    # Run the agent graph
    result = await agent.ainvoke(initial_state)

    # Build restaurant result models
    restaurants = []
    for r in result.get("restaurants", []):
        if isinstance(r, dict) and "name" in r:
            try:
                restaurants.append(RestaurantResult(
                    id=str(r.get("id", "")),
                    name=r.get("name", ""),
                    description=r.get("description"),
                    neighborhood=r.get("neighborhood", ""),
                    address=r.get("address", ""),
                    avg_rating=r.get("avg_rating"),
                    price_range=r.get("price_range"),
                    is_pure_veg=r.get("is_pure_veg", False),
                    timings=r.get("timings"),
                    cuisines=r.get("cuisines", []),
                    top_dishes=r.get("top_dishes", []),
                    zomato_url=r.get("zomato_url"),
                    swiggy_url=r.get("swiggy_url"),
                ))
            except Exception:
                pass

    response = AgentResponse(
        message=result.get("final_response", "Something went wrong. Please try again."),
        restaurants=restaurants,
        intent=result.get("intent", "unknown"),
        tool_used=result.get("tool_used", "none"),
        session_id=session_id,
    )

    # Fire-and-forget: log to database
    asyncio.create_task(
        _log_conversation(
            user_id=request.user_id,
            session_id=session_id,
            channel=request.channel,
            user_message=request.message,
            assistant_message=response.message,
            intent=response.intent,
            tool_used=response.tool_used,
        )
    )

    return response
