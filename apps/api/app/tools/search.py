"""
Database search tools for the Cravely agent.
All tools are async and accept an asyncpg Connection as the first argument.
"""

import json
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


def _row_to_dict(row) -> dict:
    """Convert an asyncpg Record to a dict."""
    return dict(row)


def _parse_json_field(value):
    """Parse a JSON field that may be a string, list, or None."""
    if value is None:
        return []
    if isinstance(value, list):
        return value
    if isinstance(value, str):
        try:
            return json.loads(value)
        except json.JSONDecodeError:
            return []
    return []


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
            1 - (r.embedding <=> $1::vector) AS similarity,
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
        WHERE c.name = $2 AND r.is_active = true AND r.embedding IS NOT NULL
        ORDER BY similarity DESC
        LIMIT $3
    """

    rows = await conn.fetch(sql, embedding_str, city, limit)

    results = []
    for row in rows:
        d = _row_to_dict(row)
        d["cuisines"] = _parse_json_field(d.get("cuisines"))
        d["top_dishes"] = _parse_json_field(d.get("top_dishes"))
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
    conditions = ["c.name = $1", "r.is_active = true"]
    params: list = [city]
    param_idx = 2

    if neighborhood:
        conditions.append(f"LOWER(n.name) = LOWER(${param_idx})")
        params.append(neighborhood)
        param_idx += 1
    if cuisine:
        conditions.append(f"""
            EXISTS (
                SELECT 1 FROM restaurant_cuisines rc2
                JOIN cuisines c2 ON rc2.cuisine_id = c2.id
                WHERE rc2.restaurant_id = r.id AND LOWER(c2.name) = LOWER(${param_idx})
            )
        """)
        params.append(cuisine)
        param_idx += 1
    if price_range is not None:
        conditions.append(f"r.price_range = ${param_idx}")
        params.append(price_range)
        param_idx += 1
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
        LIMIT ${param_idx}
    """

    rows = await conn.fetch(sql, *params)

    results = []
    for row in rows:
        d = _row_to_dict(row)
        d["cuisines"] = _parse_json_field(d.get("cuisines"))
        d["top_dishes"] = _parse_json_field(d.get("top_dishes"))
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
        WHERE r.id = $1::uuid
    """

    row = await conn.fetchrow(sql, restaurant_id)

    if not row:
        return None

    d = _row_to_dict(row)
    d["cuisines"] = _parse_json_field(d.get("cuisines"))
    menu_items = _parse_json_field(d.get("menu_items"))
    d["menu_items"] = menu_items
    d["top_dishes"] = [item["name"] for item in menu_items[:3]] if menu_items else []
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
        WHERE user_id = $1::uuid
    """

    row = await conn.fetchrow(sql, user_id)

    if not row:
        return {}

    return {
        "dietary": row["dietary"] or [],
        "favorite_cuisines": [str(c) for c in (row["favorite_cuisines"] or [])],
        "preferred_neighborhoods": [str(n) for n in (row["preferred_neighborhoods"] or [])],
        "price_range_max": row["price_range_max"],
    }


async def save_to_favorites(conn, user_id: str, restaurant_id: str) -> dict:
    """Save a restaurant to the user's favorites list."""
    if not user_id:
        return {"success": False, "error": "User must be logged in to save favorites"}

    sql = """
        INSERT INTO favorites (user_id, restaurant_id)
        VALUES ($1::uuid, $2::uuid)
        ON CONFLICT DO NOTHING
    """

    await conn.execute(sql, user_id, restaurant_id)

    return {"success": True}
