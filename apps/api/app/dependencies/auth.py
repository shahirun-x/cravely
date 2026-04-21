"""
JWT authentication dependency — validates Supabase-issued Bearer tokens.
Supports HS256 (JWT secret) and RS256 (JWKS) based on the token header.
"""

import logging
import os

import jwt
from fastapi import Header, HTTPException
from jwt import PyJWKClient

logger = logging.getLogger(__name__)

SUPABASE_URL = os.environ.get("SUPABASE_URL", "")
SUPABASE_JWT_SECRET = os.environ.get("SUPABASE_JWT_SECRET", "")

_jwks_client: PyJWKClient | None = None


def _get_jwks_client() -> PyJWKClient:
    global _jwks_client
    if _jwks_client is None:
        _jwks_client = PyJWKClient(f"{SUPABASE_URL}/auth/v1/.well-known/jwks.json")
    return _jwks_client


async def verify_supabase_token(authorization: str = Header(...)) -> str:
    """
    FastAPI dependency. Validates the Bearer JWT issued by Supabase.

    Returns the user_id (sub claim) on success.
    Raises HTTP 401 for any failure — reason is never disclosed to the caller.
    """
    if not authorization.startswith("Bearer "):
        logger.warning("Auth failed: Authorization header missing or not Bearer (got: %.20r)", authorization)
        raise HTTPException(status_code=401, detail="Unauthorized")

    token = authorization[7:]

    try:
        header = jwt.get_unverified_header(token)
        alg = header.get("alg", "HS256")

        if alg == "HS256":
            payload = jwt.decode(
                token,
                SUPABASE_JWT_SECRET,
                algorithms=["HS256"],
                audience="authenticated",
            )
        else:
            signing_key = _get_jwks_client().get_signing_key_from_jwt(token)
            payload = jwt.decode(
                token,
                signing_key.key,
                algorithms=["RS256"],
                audience="authenticated",
            )
    except Exception as exc:
        logger.warning("Auth failed: %s: %s", type(exc).__name__, exc)
        raise HTTPException(status_code=401, detail="Unauthorized")

    user_id: str | None = payload.get("sub")
    if not user_id:
        raise HTTPException(status_code=401, detail="Unauthorized")

    return user_id
