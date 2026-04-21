import os
import logging
import httpx
from fastapi import Header, HTTPException

logger = logging.getLogger(__name__)

SUPABASE_URL = os.environ["SUPABASE_URL"]
SUPABASE_ANON_KEY = os.environ["SUPABASE_ANON_KEY"]


async def verify_supabase_token(authorization: str = Header(...)) -> str:
    if not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="Unauthorized")
    token = authorization[7:]
    try:
        async with httpx.AsyncClient(timeout=5.0) as client:
            response = await client.get(
                f"{SUPABASE_URL}/auth/v1/user",
                headers={
                    "Authorization": f"Bearer {token}",
                    "apikey": SUPABASE_ANON_KEY,
                },
            )
        if response.status_code != 200:
            raise HTTPException(status_code=401, detail="Unauthorized")
        user_id = response.json().get("id")
        if not user_id:
            raise HTTPException(status_code=401, detail="Unauthorized")
        return user_id
    except HTTPException:
        raise
    except Exception as exc:
        logger.warning("Auth failed: %s", type(exc).__name__)
        raise HTTPException(status_code=401, detail="Unauthorized")
