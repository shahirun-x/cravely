import os
from contextlib import asynccontextmanager
import asyncpg
from dotenv import load_dotenv

load_dotenv()

_pool: asyncpg.Pool | None = None

def get_pool() -> asyncpg.Pool:
    return _pool

async def open_pool():
    global _pool
    db_url = os.getenv("SUPABASE_DATABASE_URL")
    if not db_url:
        print("SUPABASE_DATABASE_URL not set — database disabled")
        return
    _pool = await asyncpg.create_pool(
        dsn=db_url,
        min_size=1,
        max_size=5,
    )
    print("Database pool opened successfully")

async def close_pool():
    global _pool
    if _pool:
        await _pool.close()
        print("Database pool closed")

@asynccontextmanager
async def get_db():
    if not _pool:
        raise Exception("Database pool not initialized")
    async with _pool.acquire() as conn:
        yield conn
