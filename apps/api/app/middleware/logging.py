"""
Request logging middleware — logs timing, method, path, status, and IP.
Never logs request bodies, Authorization headers, or any PII.
"""

import logging
import time

from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware

logger = logging.getLogger("cravely.access")

# Headers that must never appear in logs
_REDACTED_HEADERS = {"authorization", "cookie", "x-admin-secret", "x-session-id"}


class RequestLoggingMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        start = time.perf_counter()

        response = await call_next(request)

        duration_ms = (time.perf_counter() - start) * 1000
        ip = request.client.host if request.client else "unknown"

        logger.info(
            "%s %s %d %.1fms ip=%s",
            request.method,
            request.url.path,
            response.status_code,
            duration_ms,
            ip,
        )

        return response
