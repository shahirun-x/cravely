"""
JWT authentication dependency — validates Supabase-issued Bearer tokens.
"""

import logging
import os

from fastapi import Header, HTTPException
from jose import ExpiredSignatureError, JWTError, jwt

logger = logging.getLogger(__name__)

_ALGORITHM = "HS256"


def _get_secret() -> str:
    secret = os.getenv("SUPABASE_JWT_SECRET")
    if not secret:
        raise RuntimeError("SUPABASE_JWT_SECRET env var is not set")
    return secret


def verify_supabase_token(authorization: str = Header(...)) -> str:
    """
    FastAPI dependency. Extracts and validates the Bearer JWT issued by Supabase.

    Returns the user_id (sub claim) on success.
    Raises HTTP 401 for any failure — reason is never disclosed to the caller.
    """
    if not authorization.startswith("Bearer "):
        logger.warning("Auth failed: Authorization header missing or not Bearer (got: %.20r)", authorization)
        raise HTTPException(status_code=401, detail="Unauthorized")

    token = authorization[len("Bearer "):]

    try:
        payload = jwt.decode(
            token,
            _get_secret(),
            algorithms=[_ALGORITHM],
            options={"verify_aud": False},  # Supabase does not always set aud
        )
    except ExpiredSignatureError:
        logger.warning("Auth failed: token expired")
        raise HTTPException(status_code=401, detail="Unauthorized")
    except JWTError as exc:
        logger.warning("Auth failed: %s: %s", type(exc).__name__, exc)
        raise HTTPException(status_code=401, detail="Unauthorized")
    except Exception as exc:
        logger.warning("Auth failed (unexpected): %s: %s", type(exc).__name__, exc)
        raise HTTPException(status_code=401, detail="Unauthorized")

    user_id: str | None = payload.get("sub")
    if not user_id:
        raise HTTPException(status_code=401, detail="Unauthorized")

    return user_id
