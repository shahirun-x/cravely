"""
Async database connection pool for Supabase PostgreSQL.
"""

import os
from contextlib import asynccontextmanager
from typing import AsyncGenerator

import logging

from psycopg_pool import AsyncConnectionPool

pool: AsyncConnectionPool | None = None
logger = logging.getLogger(__name__)


async def init_pool() -> None:
    """Initialize the async connection pool."""
    global pool
    database_url = os.getenv("SUPABASE_DATABASE_URL")
    if not database_url:
        logger.warning("SUPABASE_DATABASE_URL not set — database features disabled")
        return

    pool = AsyncConnectionPool(
        conninfo=database_url,
        min_size=2,
        max_size=10,
        open=False,
    )
    await pool.open()
    logger.info("Database connection pool initialized")


async def close_pool() -> None:
    """Close the connection pool."""
    global pool
    if pool:
        await pool.close()
        pool = None


@asynccontextmanager
async def get_db() -> AsyncGenerator:
    """Async context manager to get a database connection from the pool."""
    if pool is None:
        raise RuntimeError("Connection pool not initialized. Call init_pool() first.")
    async with pool.connection() as conn:
        yield conn
