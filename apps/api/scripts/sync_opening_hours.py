#!/usr/bin/env python3
"""
Fetch opening hours from Google Places API for all restaurants in the DB,
then update the `opening_hours` JSONB column.

Usage:
    python sync_opening_hours.py

Reads from .env:
    SUPABASE_DATABASE_URL
    GOOGLE_PLACES_API_KEY

The script:
  1. Adds the `opening_hours` column if it doesn't exist.
  2. Fetches all restaurants whose opening_hours IS NULL (or --all flag).
  3. For each restaurant, searches Google Places and fetches details.
  4. Parses period data into {0: {open: HHMM, close: HHMM}, ..., 6: {...}} format.
  5. Updates the DB row.
"""

import argparse
import json
import os
import time
from pathlib import Path

import psycopg
import requests
from dotenv import load_dotenv

# ── Config ──────────────────────────────────────────────────────────────────

load_dotenv(Path(__file__).resolve().parent.parent / ".env")

DATABASE_URL = os.getenv("SUPABASE_DATABASE_URL")
API_KEY = os.getenv("GOOGLE_PLACES_API_KEY")

TEXT_SEARCH_URL = "https://maps.googleapis.com/maps/api/place/textsearch/json"
PLACE_DETAILS_URL = "https://maps.googleapis.com/maps/api/place/details/json"

SLEEP_BETWEEN_REQUESTS = 0.3   # seconds — stay within free-tier QPS


# ── Helpers ──────────────────────────────────────────────────────────────────

def find_place_id(name: str) -> str | None:
    """Search Google Places Text Search and return the best matching place_id."""
    resp = requests.get(
        TEXT_SEARCH_URL,
        params={
            "query": f"{name} restaurant Chennai",
            "key": API_KEY,
            "region": "in",
            "language": "en",
        },
        timeout=10,
    )
    data = resp.json()
    if data.get("status") == "OK" and data.get("results"):
        return data["results"][0]["place_id"]
    return None


def fetch_opening_hours(place_id: str) -> dict | None:
    """Fetch place details and return parsed opening hours dict or None."""
    resp = requests.get(
        PLACE_DETAILS_URL,
        params={
            "place_id": place_id,
            "fields": "opening_hours",
            "key": API_KEY,
        },
        timeout=10,
    )
    data = resp.json()
    if data.get("status") != "OK":
        return None

    periods = data.get("result", {}).get("opening_hours", {}).get("periods", [])
    if not periods:
        return None

    # Build {day_index: {open: HHMM, close: HHMM}} — day 0 = Sunday
    hours: dict[int, dict] = {}
    for period in periods:
        open_info = period.get("open", {})
        close_info = period.get("close", {})
        day = open_info.get("day")
        if day is None:
            continue
        hours[day] = {
            "open": int(open_info.get("time", "0000")),
            "close": int(close_info.get("time", "2359")) if close_info else 2359,
        }

    return hours if hours else None


# ── Main ─────────────────────────────────────────────────────────────────────

def add_column_if_needed(conn) -> None:
    with conn.cursor() as cur:
        cur.execute("""
            ALTER TABLE restaurants
            ADD COLUMN IF NOT EXISTS opening_hours JSONB;
        """)
    conn.commit()
    print("[✓] opening_hours column ensured.")


def sync_hours(conn, update_all: bool = False) -> None:
    with conn.cursor() as cur:
        if update_all:
            cur.execute("""
                SELECT r.id, r.name, n.name AS neighborhood
                FROM restaurants r
                LEFT JOIN neighborhoods n ON r.neighborhood_id = n.id
                ORDER BY r.name
            """)
        else:
            cur.execute("""
                SELECT r.id, r.name, n.name AS neighborhood
                FROM restaurants r
                LEFT JOIN neighborhoods n ON r.neighborhood_id = n.id
                WHERE r.opening_hours IS NULL
                ORDER BY r.name
            """)
        rows = cur.fetchall()

    total = len(rows)
    if total == 0:
        print("[✓] All restaurants already have opening_hours. Use --all to re-sync.")
        return

    print(f"[*] Syncing opening hours for {total} restaurants...\n")

    updated = 0
    skipped = 0
    errors = 0

    for i, (rid, name, neighborhood) in enumerate(rows, 1):
        print(f"  [{i}/{total}] {name} ({neighborhood or 'Unknown'}) ... ", end="", flush=True)

        try:
            place_id = find_place_id(name)
            time.sleep(SLEEP_BETWEEN_REQUESTS)

            if not place_id:
                print("⚠ place not found")
                skipped += 1
                continue

            hours = fetch_opening_hours(place_id)
            time.sleep(SLEEP_BETWEEN_REQUESTS)

            if not hours:
                print("⚠ no hours data")
                skipped += 1
                continue

            with conn.cursor() as cur:
                cur.execute(
                    "UPDATE restaurants SET opening_hours = %s WHERE id = %s",
                    (json.dumps(hours), rid),
                )
            conn.commit()
            print(f"✓ ({len(hours)} days)")
            updated += 1

        except Exception as exc:
            conn.rollback()
            print(f"✗ error: {exc}")
            errors += 1

        # Pause every 20 requests to avoid hitting QPS limits
        if i % 20 == 0 and i < total:
            print(f"\n  [..] Pausing 2s after {i} requests...\n")
            time.sleep(2)

    print(f"\n[DONE] Updated: {updated}  Skipped: {skipped}  Errors: {errors}")


def main():
    parser = argparse.ArgumentParser(
        description="Sync Google Places opening hours into the Cravely DB."
    )
    parser.add_argument(
        "--all",
        action="store_true",
        help="Re-sync ALL restaurants, not just those missing opening_hours.",
    )
    args = parser.parse_args()

    if not DATABASE_URL:
        print("[ERROR] SUPABASE_DATABASE_URL not set in .env")
        return
    if not API_KEY:
        print("[ERROR] GOOGLE_PLACES_API_KEY not set in .env")
        return

    print("[*] Connecting to database...")
    with psycopg.connect(DATABASE_URL) as conn:
        add_column_if_needed(conn)
        sync_hours(conn, update_all=args.all)


if __name__ == "__main__":
    main()
