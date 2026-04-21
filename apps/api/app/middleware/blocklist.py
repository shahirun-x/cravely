"""
IP blocklist middleware.

Reads a comma-separated list of blocked IPs from the BLOCKED_IPS env var.
Checks both X-Forwarded-For and the direct REMOTE_ADDR.
Returns 403 immediately — no further handler is called.
"""

import logging
import os

from fastapi import Request
from fastapi.responses import JSONResponse
from starlette.middleware.base import BaseHTTPMiddleware

logger = logging.getLogger(__name__)


def _load_blocklist() -> frozenset[str]:
    raw = os.getenv("BLOCKED_IPS", "")
    ips = frozenset(ip.strip() for ip in raw.split(",") if ip.strip())
    if ips:
        logger.info("IP blocklist loaded: %d entries", len(ips))
    return ips


def _client_ips(request: Request) -> list[str]:
    """Return all IP addresses associated with this request."""
    ips: list[str] = []
    forwarded = request.headers.get("x-forwarded-for")
    if forwarded:
        ips.extend(ip.strip() for ip in forwarded.split(","))
    if request.client:
        ips.append(request.client.host)
    return ips


class IPBlocklistMiddleware(BaseHTTPMiddleware):
    def __init__(self, app):
        super().__init__(app)
        # Load once at startup; restart to update
        self._blocked: frozenset[str] = _load_blocklist()

    async def dispatch(self, request: Request, call_next):
        if self._blocked:
            for ip in _client_ips(request):
                if ip in self._blocked:
                    logger.warning("Blocked IP attempted access: %s %s", ip, request.url.path)
                    return JSONResponse(status_code=403, content={"error": "Forbidden"})
        return await call_next(request)
