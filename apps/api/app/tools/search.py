"""
Database search tools for the Cravely agent.
All tools are async and accept a psycopg AsyncConnection as the first argument.
"""

import json
import os
from typing import Optional

from google import genai

# ── Module-level Gemini client (set during app startup) ──

_gemini_client: genai.Client | None = None

EMBEDDING_MODEL = "text-embedding-004"


def set_gemini_client(client: genai.Client) -> None:
    """Called from app startup to inject the Gemini client."""
    global _gemini_client
    _gemini_client = client


def _get_embedding(text: str) -> list[float]:
    """Generate a 768-dim embedding for the given text."""
    if _gemini_client is None:
        raise RuntimeError("Gemini client not initialized. Call set_gemini_client() first.")
    result = _gemini_client.models.embed_content(
        model=EMBEDDING_MODEL,
        contents=text,
    )
    return result.embeddings[0].values


async def semantic_search(
    conn,
    query_text: str,
    city: str = "Chennai",
    limit: int = 5,
) -> list[dict]:
    """
    Semantic vector search across restaurants using pgvector cosine similarity.
    """
    embedding = _get_embedding(query_text)
    embedding_str = str(embedding)

    sql = """
        SELECT
            r.id, r.name, r.description, r.address,
            r.avg_rating, r.price_range, r.is_pure_veg, r.timings,
            r.zomato_url, r.swiggy_url,
            n.name AS neighborhood,
            1 - (r.embedding <=> %s::vector) AS similarity,
            COALESCE(
                (SELECT json_agg(c2.name)
                 FROM restaurant_cuisines rc2
                 JOIN cuisines c2 ON rc2.cuisine_id = c2.id
                 WHERE rc2.restaurant_id = r.id),
                '[]'::json
            ) AS cuisines,
            COALESCE(
                (SELECT json_agg(mi.name ORDER BY mi.price DESC)
                 FROM (SELECT name, price FROM menu_items
                       WHERE restaurant_id = r.id AND is_available = true
                       LIMIT 3) mi),
                '[]'::json
            ) AS top_dishes
        FROM restaurants r
        JOIN neighborhoods n ON r.neighborhood_id = n.id
        JOIN cities c ON n.city_id = c.id
        WHERE c.name = %s AND r.is_active = true AND r.embedding IS NOT NULL
        ORDER BY similarity DESC
        LIMIT %s
    """

    async with conn.cursor() as cur:
        await cur.execute(sql, (embedding_str, city, limit))
        columns = [desc[0] for desc in cur.description]
        rows = await cur.fetchall()

    results = []
    for row in rows:
        d = dict(zip(columns, row))
        d["cuisines"] = d["cuisines"] if isinstance(d["cuisines"], list) else json.loads(str(d["cuisines"])) if d["cuisines"] else []
        d["top_dishes"] = d["top_dishes"] if isinstance(d["top_dishes"], list) else json.loads(str(d["top_dishes"])) if d["top_dishes"] else []
        if d.get("timings") and isinstance(d["timings"], str):
            d["timings"] = json.loads(d["timings"])
        d.pop("similarity", None)
        d["id"] = str(d["id"])
        results.append(d)

    return results


async def filter_search(
    conn,
    city: str = "Chennai",
    neighborhood: Optional[str] = None,
    cuisine: Optional[str] = None,
    price_range: Optional[int] = None,
    is_veg: Optional[bool] = None,
    limit: int = 10,
) -> list[dict]:
    """
    Structured SQL search — no embeddings. Dynamically builds WHERE clause.
    """
    conditions = ["c.name = %s", "r.is_active = true"]
    params: list = [city]

    if neighborhood:
        conditions.append("LOWER(n.name) = LOWER(%s)")
        params.append(neighborhood)
    if cuisine:
        conditions.append("""
            EXISTS (
                SELECT 1 FROM restaurant_cuisines rc2
                JOIN cuisines c2 ON rc2.cuisine_id = c2.id
                WHERE rc2.restaurant_id = r.id AND LOWER(c2.name) = LOWER(%s)
            )
        """)
        params.append(cuisine)
    if price_range is not None:
        conditions.append("r.price_range = %s")
        params.append(price_range)
    if is_veg is True:
        conditions.append("r.is_pure_veg = true")

    where_clause = " AND ".join(conditions)
    params.append(limit)

    sql = f"""
        SELECT
            r.id, r.name, r.description, r.address,
            r.avg_rating, r.price_range, r.is_pure_veg, r.timings,
            r.zomato_url, r.swiggy_url,
            n.name AS neighborhood,
            COALESCE(
                (SELECT json_agg(c2.name)
                 FROM restaurant_cuisines rc2
                 JOIN cuisines c2 ON rc2.cuisine_id = c2.id
                 WHERE rc2.restaurant_id = r.id),
                '[]'::json
            ) AS cuisines,
            COALESCE(
                (SELECT json_agg(mi.name ORDER BY mi.price DESC)
                 FROM (SELECT name, price FROM menu_items
                       WHERE restaurant_id = r.id AND is_available = true
                       LIMIT 3) mi),
                '[]'::json
            ) AS top_dishes
        FROM restaurants r
        JOIN neighborhoods n ON r.neighborhood_id = n.id
        JOIN cities c ON n.city_id = c.id
        WHERE {where_clause}
        ORDER BY r.avg_rating DESC NULLS LAST
        LIMIT %s
    """

    async with conn.cursor() as cur:
        await cur.execute(sql, params)
        columns = [desc[0] for desc in cur.description]
        rows = await cur.fetchall()

    results = []
    for row in rows:
        d = dict(zip(columns, row))
        d["cuisines"] = d["cuisines"] if isinstance(d["cuisines"], list) else json.loads(str(d["cuisines"])) if d["cuisines"] else []
        d["top_dishes"] = d["top_dishes"] if isinstance(d["top_dishes"], list) else json.loads(str(d["top_dishes"])) if d["top_dishes"] else []
        if d.get("timings") and isinstance(d["timings"], str):
            d["timings"] = json.loads(d["timings"])
        d["id"] = str(d["id"])
        results.append(d)

    return results


async def get_restaurant_detail(conn, restaurant_id: str) -> dict | None:
    """Fetch full restaurant profile with menu items and cuisines."""
    sql = """
        SELECT
            r.id, r.name, r.description, r.address,
            r.avg_rating, r.price_range, r.is_pure_veg, r.timings,
            r.phone, r.zomato_url, r.swiggy_url,
            n.name AS neighborhood,
            COALESCE(
                (SELECT json_agg(c2.name)
                 FROM restaurant_cuisines rc2
                 JOIN cuisines c2 ON rc2.cuisine_id = c2.id
                 WHERE rc2.restaurant_id = r.id),
                '[]'::json
            ) AS cuisines,
            COALESCE(
                (SELECT json_agg(json_build_object(
                    'name', mi.name,
                    'description', mi.description,
                    'price', mi.price,
                    'is_veg', mi.is_veg,
                    'category', cat.name
                ) ORDER BY mi.price)
                 FROM menu_items mi
                 LEFT JOIN categories cat ON mi.category_id = cat.id
                 WHERE mi.restaurant_id = r.id AND mi.is_available = true),
                '[]'::json
            ) AS menu_items
        FROM restaurants r
        JOIN neighborhoods n ON r.neighborhood_id = n.id
        WHERE r.id = %s::uuid
    """

    async with conn.cursor() as cur:
        await cur.execute(sql, (restaurant_id,))
        columns = [desc[0] for desc in cur.description]
        row = await cur.fetchone()

    if not row:
        return None

    d = dict(zip(columns, row))
    d["cuisines"] = d["cuisines"] if isinstance(d["cuisines"], list) else json.loads(str(d["cuisines"])) if d["cuisines"] else []
    menu_items = d.get("menu_items", [])
    if not isinstance(menu_items, list):
        menu_items = json.loads(str(menu_items)) if menu_items else []
    d["menu_items"] = menu_items
    d["top_dishes"] = [item["name"] for item in menu_items[:3]]
    if d.get("timings") and isinstance(d["timings"], str):
        d["timings"] = json.loads(d["timings"])
    d["id"] = str(d["id"])
    return d


async def get_user_preferences(conn, user_id: Optional[str]) -> dict:
    """Fetch user preferences. Returns empty dict if no user or no preferences."""
    if not user_id:
        return {}

    sql = """
        SELECT dietary, favorite_cuisines, preferred_neighborhoods, price_range_max
        FROM user_preferences
        WHERE user_id = %s::uuid
    """

    async with conn.cursor() as cur:
        await cur.execute(sql, (user_id,))
        row = await cur.fetchone()

    if not row:
        return {}

    return {
        "dietary": row[0] or [],
        "favorite_cuisines": [str(c) for c in (row[1] or [])],
        "preferred_neighborhoods": [str(n) for n in (row[2] or [])],
        "price_range_max": row[3],
    }


async def save_to_favorites(conn, user_id: str, restaurant_id: str) -> dict:
    """Save a restaurant to the user's favorites list."""
    if not user_id:
        return {"success": False, "error": "User must be logged in to save favorites"}

    sql = """
        INSERT INTO favorites (user_id, restaurant_id)
        VALUES (%s::uuid, %s::uuid)
        ON CONFLICT DO NOTHING
    """

    async with conn.cursor() as cur:
        await cur.execute(sql, (user_id, restaurant_id))
    await conn.commit()

    return {"success": True}
