"""
JWT authentication dependency — validates Supabase-issued Bearer tokens via JWKS.
Supports both RS256 (default for newer Supabase projects) and HS256.
"""

import logging
import os

import jwt
from fastapi import Header, HTTPException
from jwt import PyJWKClient

logger = logging.getLogger(__name__)

_SUPABASE_URL = os.environ.get("SUPABASE_URL", "")

_jwks_client: PyJWKClient | None = None


def _get_jwks_client() -> PyJWKClient:
    global _jwks_client
    if _jwks_client is None:
        if not _SUPABASE_URL:
            raise RuntimeError("SUPABASE_URL env var is not set")
        _jwks_client = PyJWKClient(f"{_SUPABASE_URL}/auth/v1/.well-known/jwks.json")
    return _jwks_client


def verify_supabase_token(authorization: str = Header(...)) -> str:
    """
    FastAPI dependency. Validates the Bearer JWT issued by Supabase via JWKS.

    Returns the user_id (sub claim) on success.
    Raises HTTP 401 for any failure — reason is never disclosed to the caller.
    """
    if not authorization.startswith("Bearer "):
        logger.warning("Auth failed: Authorization header missing or not Bearer (got: %.20r)", authorization)
        raise HTTPException(status_code=401, detail="Unauthorized")

    token = authorization[7:]

    try:
        client = _get_jwks_client()
        signing_key = client.get_signing_key_from_jwt(token)
        payload = jwt.decode(
            token,
            signing_key.key,
            algorithms=["RS256", "HS256"],
            audience="authenticated",
        )
    except Exception as exc:
        logger.warning("Auth failed: %s: %s", type(exc).__name__, exc)
        raise HTTPException(status_code=401, detail="Unauthorized")

    user_id: str | None = payload.get("sub")
    if not user_id:
        raise HTTPException(status_code=401, detail="Unauthorized")

    return user_id
