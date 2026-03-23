#!/usr/bin/env python3
"""
Generate embeddings for restaurants and menu items using Google's text-embedding-004.

Usage:
    python generate_embeddings.py

Reads SUPABASE_DATABASE_URL and GOOGLE_GEMINI_API_KEY from .env.
"""

import os
import time
from pathlib import Path

import google.generativeai as genai
import psycopg
from dotenv import load_dotenv

# Load environment variables
load_dotenv(Path(__file__).resolve().parent.parent / ".env")

DATABASE_URL = os.getenv("SUPABASE_DATABASE_URL")
GEMINI_API_KEY = os.getenv("GOOGLE_GEMINI_API_KEY")
EMBEDDING_MODEL = "models/text-embedding-004"
BATCH_SIZE = 20
SLEEP_BETWEEN_BATCHES = 1  # seconds


def get_embedding(text: str) -> list[float]:
    """Generate a 768-dim embedding for the given text."""
    result = genai.embed_content(
        model=EMBEDDING_MODEL,
        content=text,
        task_type="retrieval_document",
    )
    return result["embedding"]


def embed_restaurants(conn) -> None:
    """Fetch restaurants with NULL embedding and generate embeddings."""
    print("\n📍 Embedding restaurants...")

    with conn.cursor() as cur:
        # Fetch restaurants needing embeddings, with their cuisines and neighborhood
        cur.execute("""
            SELECT
                r.id, r.name, r.description,
                n.name AS neighborhood,
                COALESCE(
                    STRING_AGG(DISTINCT c.name, ', '),
                    ''
                ) AS cuisines
            FROM restaurants r
            LEFT JOIN neighborhoods n ON r.neighborhood_id = n.id
            LEFT JOIN restaurant_cuisines rc ON r.id = rc.restaurant_id
            LEFT JOIN cuisines c ON rc.cuisine_id = c.id
            WHERE r.embedding IS NULL
            GROUP BY r.id, r.name, r.description, n.name
            ORDER BY r.name
        """)
        rows = cur.fetchall()

    total = len(rows)
    if total == 0:
        print("  ✅ All restaurants already have embeddings.")
        return

    print(f"  Found {total} restaurants to embed.")

    for i, (rid, name, description, neighborhood, cuisines) in enumerate(rows, 1):
        # Build embedding text
        parts = [name]
        if description:
            parts.append(description)
        if cuisines:
            parts.append(f"Cuisines: {cuisines}")
        if neighborhood:
            parts.append(f"Located in {neighborhood}")
        text = ". ".join(parts)

        try:
            embedding = get_embedding(text)

            with conn.cursor() as cur:
                cur.execute(
                    "UPDATE restaurants SET embedding = %s::vector WHERE id = %s",
                    (str(embedding), rid),
                )
            conn.commit()
            print(f"  Restaurants: {i}/{total} embedded — {name}")

        except Exception as e:
            print(f"  ⚠ Error embedding restaurant '{name}': {e}")
            conn.rollback()

        # Rate limit: pause every BATCH_SIZE items
        if i % BATCH_SIZE == 0 and i < total:
            print(f"  💤 Sleeping {SLEEP_BETWEEN_BATCHES}s (rate limit)...")
            time.sleep(SLEEP_BETWEEN_BATCHES)


def embed_menu_items(conn) -> None:
    """Fetch menu items with NULL embedding and generate embeddings."""
    print("\n🍽️  Embedding menu items...")

    with conn.cursor() as cur:
        cur.execute("""
            SELECT
                mi.id, mi.name, mi.description, mi.price,
                cat.name AS category
            FROM menu_items mi
            LEFT JOIN categories cat ON mi.category_id = cat.id
            WHERE mi.embedding IS NULL
            ORDER BY mi.name
        """)
        rows = cur.fetchall()

    total = len(rows)
    if total == 0:
        print("  ✅ All menu items already have embeddings.")
        return

    print(f"  Found {total} menu items to embed.")

    for i, (mid, name, description, price, category) in enumerate(rows, 1):
        # Build embedding text
        parts = [name]
        if description:
            parts.append(description)
        if category:
            parts.append(f"Category: {category}")
        if price:
            parts.append(f"Price: ₹{price}")
        text = ". ".join(parts)

        try:
            embedding = get_embedding(text)

            with conn.cursor() as cur:
                cur.execute(
                    "UPDATE menu_items SET embedding = %s::vector WHERE id = %s",
                    (str(embedding), mid),
                )
            conn.commit()
            print(f"  Menu items: {i}/{total} embedded — {name}")

        except Exception as e:
            print(f"  ⚠ Error embedding menu item '{name}': {e}")
            conn.rollback()

        # Rate limit
        if i % BATCH_SIZE == 0 and i < total:
            print(f"  💤 Sleeping {SLEEP_BETWEEN_BATCHES}s (rate limit)...")
            time.sleep(SLEEP_BETWEEN_BATCHES)


def main():
    if not DATABASE_URL:
        print("❌ SUPABASE_DATABASE_URL not found in .env")
        return
    if not GEMINI_API_KEY:
        print("❌ GOOGLE_GEMINI_API_KEY not found in .env")
        return

    # Configure Gemini
    genai.configure(api_key=GEMINI_API_KEY)

    print("🔌 Connecting to database...")
    with psycopg.connect(DATABASE_URL) as conn:
        embed_restaurants(conn)
        embed_menu_items(conn)

    print("\n🎉 Embedding generation complete!")


if __name__ == "__main__":
    main()
