"""
Chat API route — the main user-facing endpoint.
"""

import asyncio
import json
import logging
import os
import re
import uuid
from typing import Optional

from fastapi import APIRouter, Depends, HTTPException, Request
from fastapi.responses import JSONResponse
from pydantic import UUID4, BaseModel, Field, field_validator
from main import limiter
from app.dependencies.auth import verify_supabase_token
from app.middleware.ratelimit import check_user_rate_limit

from app.agent.graph import agent
from app.db.connection import get_db
from app.models.schemas import AgentResponse, RestaurantResult

logger = logging.getLogger(__name__)

router = APIRouter()

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------
_MAX_BODY_BYTES = 10 * 1024  # 10 KB
_ALLOWED_CITIES = {"Chennai"}

# SQL injection pattern: keyword followed by typical injection syntax
_SQL_INJECTION_RE = re.compile(
    r"\b(DROP|DELETE|INSERT|UPDATE|EXEC|UNION|SELECT)\b.{0,30}"
    r"(TABLE|FROM|INTO|WHERE|DATABASE|SCHEMA|--|;|\/\*)",
    re.IGNORECASE,
)


# ---------------------------------------------------------------------------
# Validated request model (replaces ChatRequest for this endpoint)
# ---------------------------------------------------------------------------
class ValidatedChatRequest(BaseModel):
    message: str = Field(..., max_length=500)
    session_id: Optional[UUID4] = None
    user_id: Optional[UUID4] = None
    channel: str = "web"
    city: str = "Chennai"

    @field_validator("message", mode="before")
    @classmethod
    def clean_message(cls, v: str) -> str:
        if not isinstance(v, str):
            raise ValueError("Invalid input")
        return v.strip()

    @field_validator("message", mode="after")
    @classmethod
    def no_sql_injection(cls, v: str) -> str:
        if _SQL_INJECTION_RE.search(v):
            raise ValueError("Invalid input")
        return v

    @field_validator("city")
    @classmethod
    def city_whitelist(cls, v: str) -> str:
        if v not in _ALLOWED_CITIES:
            raise ValueError("Invalid input")
        return v


# ---------------------------------------------------------------------------
# Internal helpers
# ---------------------------------------------------------------------------
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
                    logger.warning("Failed checking user_id: %s", e)
                    user_id = None

            await conn.execute(
                """
                INSERT INTO conversations (id, user_id, channel, session_id)
                VALUES (gen_random_uuid(), $1, $2, $3)
                ON CONFLICT DO NOTHING
                """,
                user_id, channel, session_id,
            )

            row = await conn.fetchrow(
                "SELECT id FROM conversations WHERE session_id = $1 LIMIT 1",
                session_id,
            )
            if not row:
                return
            conv_id = row["id"]

            await conn.execute(
                """
                INSERT INTO messages (id, conversation_id, role, content)
                VALUES (gen_random_uuid(), $1, 'user', $2)
                """,
                conv_id, user_message,
            )

            tool_calls_json = json.dumps({"intent": intent, "tool": tool_used})
            await conn.execute(
                """
                INSERT INTO messages (id, conversation_id, role, content, tool_calls)
                VALUES (gen_random_uuid(), $1, 'assistant', $2, $3::jsonb)
                """,
                conv_id, assistant_message, tool_calls_json,
            )
    except Exception as e:
        logger.warning("Conversation logging failed: %s", e)


# ---------------------------------------------------------------------------
# Session flood guard helpers (Redis-backed)
# ---------------------------------------------------------------------------
_SESSION_BURST_LIMIT = 10   # messages
_SESSION_BURST_WINDOW = 60  # seconds
_SESSION_BLOCK_TTL = 300    # 5 minutes


def _get_redis():
    try:
        from upstash_redis import Redis  # noqa: PLC0415
        url = os.getenv("UPSTASH_REDIS_REST_URL")
        token = os.getenv("UPSTASH_REDIS_REST_TOKEN")
        if url and token:
            return Redis(url=url, token=token)
    except Exception:
        pass
    return None


async def _check_session_flood(session_id: str) -> tuple[bool, str]:
    """
    Returns (blocked: bool, message: str).
    Blocks the session for 5 min if it exceeds 10 messages in 60 seconds.
    """
    redis = _get_redis()
    if redis is None:
        return False, ""

    try:
        block_key = f"blocked:session:{session_id}"
        if redis.exists(block_key):
            ttl = redis.ttl(block_key)
            return True, f"You're sending messages too fast. Please wait {max(1, ttl)} seconds."

        burst_key = f"session:burst:{session_id}"
        count = redis.incr(burst_key)
        if count == 1:
            redis.expire(burst_key, _SESSION_BURST_WINDOW)

        if count > _SESSION_BURST_LIMIT:
            redis.set(block_key, "1", ex=_SESSION_BLOCK_TTL)
            redis.delete(burst_key)
            logger.warning("Session flood detected, soft-blocking session %s", session_id[:8])
            return True, "You're sending messages too fast. Please wait a moment."
    except Exception as exc:
        logger.warning("Session flood check Redis error (failing open): %s", exc)

    return False, ""


# ---------------------------------------------------------------------------
# Endpoint
# ---------------------------------------------------------------------------
@router.post("/chat", response_model=AgentResponse)
@limiter.limit("20/minute")
async def chat(
    http_request: Request,
    request: ValidatedChatRequest,
    _user_id: str = Depends(verify_supabase_token),
) -> AgentResponse:
    """Main chat endpoint. Sends user message through the LangGraph agent."""
    # --- Request size guard ---
    content_length = http_request.headers.get("content-length")
    if content_length and int(content_length) > _MAX_BODY_BYTES:
        raise HTTPException(status_code=413, detail="Request body too large")

    # Read raw body to enforce size even when Content-Length is absent
    body = await http_request.body()
    if len(body) > _MAX_BODY_BYTES:
        raise HTTPException(status_code=413, detail="Request body too large")

    session_id = str(request.session_id) if request.session_id else str(uuid.uuid4())
    user_id_str = str(request.user_id) if request.user_id else None

    # --- Per-user hourly limit ---
    if user_id_str:
        allowed, retry = check_user_rate_limit(user_id_str)
        if not allowed:
            return JSONResponse(
                status_code=429,
                headers={"Retry-After": str(retry)},
                content={"error": "Rate limit exceeded. Try again later."},
            )

    # --- Session flood guard ---
    flood_blocked, flood_msg = await _check_session_flood(session_id)
    if flood_blocked:
        return JSONResponse(
            status_code=429,
            headers={"Retry-After": str(_SESSION_BLOCK_TTL)},
            content={"error": flood_msg},
        )

    initial_state = {
        "message": request.message,
        "session_id": session_id,
        "user_id": user_id_str,
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

    result = await agent.ainvoke(initial_state)

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
                    latitude=r.get("latitude"),
                    longitude=r.get("longitude"),
                    opening_hours=r.get("opening_hours"),
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

    asyncio.create_task(
        _log_conversation(
            user_id=user_id_str,
            session_id=session_id,
            channel=request.channel,
            user_message=request.message,
            assistant_message=response.message,
            intent=response.intent,
            tool_used=response.tool_used,
        )
    )

    return response
