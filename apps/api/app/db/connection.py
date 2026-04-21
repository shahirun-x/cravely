import logging
import os
from contextlib import asynccontextmanager

import asyncpg
from dotenv import load_dotenv

logger = logging.getLogger(__name__)

load_dotenv()

_pool: asyncpg.Pool | None = None

def get_pool() -> asyncpg.Pool:
    return _pool

def _ensure_ssl(url: str) -> str:
    """Append sslmode=require if no sslmode is already present in the URL."""
    if "sslmode=" not in url:
        separator = "&" if "?" in url else "?"
        return f"{url}{separator}sslmode=require"
    return url


async def open_pool():
    global _pool
    db_url = os.getenv("SUPABASE_DATABASE_URL")
    if not db_url:
        logger.warning("SUPABASE_DATABASE_URL not set — database disabled")
        return
    _pool = await asyncpg.create_pool(
        dsn=_ensure_ssl(db_url),
        min_size=1,
        max_size=5,
        statement_cache_size=0,
    )
    logger.info("Database pool opened successfully")

async def close_pool():
    global _pool
    if _pool:
        await _pool.close()
        logger.info("Database pool closed")

@asynccontextmanager
async def get_db():
    if not _pool:
        raise Exception("Database pool not initialized")
    async with _pool.acquire() as conn:
        yield conn
