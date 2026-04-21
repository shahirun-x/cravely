"""
Upstash Redis-based rate limiting middleware.

Replaces in-process slowapi for distributed deployments (Railway).
Two limiters run per request:
  - Global IP limiter : 100 req/min  (key: rl:ip:{ip})
  - Chat IP limiter   : 20 req/min   (key: rl:ip:chat:{ip})   — applied only on /chat
  - User limiter      : 50 msg/hour  (key: rl:user:{user_id}) — applied only on /chat

Keys use a sliding-window counter stored in Upstash Redis.
On limit breach a 429 is returned immediately with a Retry-After header.
"""

import logging
import math
import os
import time
from typing import Optional

from fastapi import Request
from fastapi.responses import JSONResponse
from starlette.middleware.base import BaseHTTPMiddleware

logger = logging.getLogger(__name__)


def _get_redis():
    """Lazily import and construct the Upstash Redis client."""
    from upstash_redis import Redis  # noqa: PLC0415

    url = os.getenv("UPSTASH_REDIS_REST_URL")
    token = os.getenv("UPSTASH_REDIS_REST_TOKEN")
    if not url or not token:
        return None
    return Redis(url=url, token=token)


def _client_ip(request: Request) -> str:
    """Extract the real client IP, honouring X-Forwarded-For."""
    forwarded = request.headers.get("x-forwarded-for")
    if forwarded:
        return forwarded.split(",")[0].strip()
    return request.client.host if request.client else "unknown"


def _sliding_window(redis, key: str, limit: int, window_seconds: int) -> tuple[bool, int]:
    """
    Increment a sliding-window counter in Redis.

    Returns (allowed: bool, retry_after_seconds: int).
    Uses a simple INCR + EXPIRE approach: the counter resets when the key
    expires, which gives a fixed-window behaviour close enough to sliding
    window for our purposes without requiring Lua scripts or sorted sets.
    """
    try:
        count = redis.incr(key)
        if count == 1:
            # First hit — set TTL for the window
            redis.expire(key, window_seconds)
        if count > limit:
            ttl = redis.ttl(key)
            retry_after = max(1, int(ttl))
            return False, retry_after
        return True, 0
    except Exception as exc:
        # Redis unavailable — fail open so the app stays up
        logger.warning("Rate-limit Redis error (failing open): %s", exc)
        return True, 0


def _too_many(redis, key: str, limit: int, window_seconds: int) -> tuple[bool, int]:
    """Return (blocked, retry_after). Convenience alias."""
    allowed, retry = _sliding_window(redis, key, limit, window_seconds)
    return not allowed, retry


class RedisRateLimitMiddleware(BaseHTTPMiddleware):
    """
    Middleware that enforces:
      - 100 req/min per IP on all routes
      - 20 req/min per IP on POST /api/v1/chat
      - 50 req/hour per authenticated user_id on POST /api/v1/chat
    """

    async def dispatch(self, request: Request, call_next):
        redis = _get_redis()
        if redis is None:
            # Redis not configured — skip rate limiting
            logger.warning("Upstash Redis not configured; rate limiting disabled")
            return await call_next(request)

        ip = _client_ip(request)
        path = request.url.path
        is_chat = path == "/api/v1/chat" and request.method == "POST"

        # 1. Global IP limit
        blocked, retry = _too_many(redis, f"rl:ip:{ip}", 100, 60)
        if blocked:
            return JSONResponse(
                status_code=429,
                headers={"Retry-After": str(retry)},
                content={"error": "Rate limit exceeded. Try again later."},
            )

        # 2. Per-IP chat limit
        if is_chat:
            blocked, retry = _too_many(redis, f"rl:ip:chat:{ip}", 20, 60)
            if blocked:
                return JSONResponse(
                    status_code=429,
                    headers={"Retry-After": str(retry)},
                    content={"error": "Rate limit exceeded. Try again later."},
                )

        response = await call_next(request)

        # 3. Per-user-id chat limit (checked post-parse — user_id lives in the
        #    JSON body which we can't re-read here; instead the chat route
        #    handler enforces this after parsing. See chat.py.)

        return response


def check_user_rate_limit(user_id: str) -> tuple[bool, int]:
    """
    Called directly from the chat route after the request body is parsed.
    Returns (allowed: bool, retry_after_seconds: int).
    Limit: 50 messages/hour per user_id.
    """
    redis = _get_redis()
    if redis is None:
        return True, 0
    allowed, retry = _sliding_window(redis, f"rl:user:{user_id}", 50, 3600)
    return allowed, retry
