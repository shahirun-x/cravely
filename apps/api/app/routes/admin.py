"""
Admin routes — one-off operational endpoints, not user-facing.
"""

import asyncio
import json
import logging
import os

import httpx
from fastapi import APIRouter, Depends, Header, HTTPException, Request
from fastapi.responses import StreamingResponse

from app.db.connection import get_db
from app.dependencies.auth import verify_supabase_token

logger = logging.getLogger(__name__)

router = APIRouter()

TEXT_SEARCH_URL = "https://maps.googleapis.com/maps/api/place/textsearch/json"
PLACE_DETAILS_URL = "https://maps.googleapis.com/maps/api/place/details/json"
SLEEP_BETWEEN_REQUESTS = 0.3


def _require_admin_secret(request: Request, x_admin_secret: str = Header(...)) -> None:
    """
    Secondary guard on top of JWT auth. Caller must supply the X-Admin-Secret
    header matching the ADMIN_SECRET env var.
    """
    expected = os.getenv("ADMIN_SECRET")
    if not expected:
        logger.error("ADMIN_SECRET env var is not configured")
        raise HTTPException(status_code=500, detail="Something went wrong")

    if x_admin_secret != expected:
        ip = request.client.host if request.client else "unknown"
        logger.warning("Admin secret mismatch from IP %s", ip)
        raise HTTPException(status_code=403, detail="Forbidden")


async def _find_place_id(client: httpx.AsyncClient, api_key: str, name: str) -> str | None:
    resp = await client.get(
        TEXT_SEARCH_URL,
        params={
            "query": f"{name} restaurant Chennai",
            "key": api_key,
            "region": "in",
            "language": "en",
        },
        timeout=10,
    )
    data = resp.json()
    if data.get("status") == "OK" and data.get("results"):
        return data["results"][0]["place_id"]
    return None


async def _fetch_opening_hours(client: httpx.AsyncClient, api_key: str, place_id: str) -> dict | None:
    resp = await client.get(
        PLACE_DETAILS_URL,
        params={"place_id": place_id, "fields": "opening_hours", "key": api_key},
        timeout=10,
    )
    data = resp.json()
    if data.get("status") != "OK":
        return None

    periods = data.get("result", {}).get("opening_hours", {}).get("periods", [])
    if not periods:
        return None

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


@router.get("/api/v1/admin/sync-hours")
async def sync_hours(
    update_all: bool = False,
    _user_id: str = Depends(verify_supabase_token),
    _admin: None = Depends(_require_admin_secret),
):
    """
    Fetch opening hours from Google Places for all restaurants missing them,
    then update the opening_hours column. Streams progress as newline-delimited text.

    Query params:
      update_all=true  — re-sync every restaurant, not just those with NULL hours
    """
    api_key = os.getenv("GOOGLE_PLACES_API_KEY")
    if not api_key:
        logger.error("GOOGLE_PLACES_API_KEY is not configured")
        raise HTTPException(status_code=500, detail="Something went wrong")

    async def stream():
        async with get_db() as conn:
            await conn.execute("""
                ALTER TABLE restaurants
                ADD COLUMN IF NOT EXISTS opening_hours JSONB;
            """)
            yield "[✓] opening_hours column ensured.\n"

            if update_all:
                rows = await conn.fetch("""
                    SELECT r.id, r.name, n.name AS neighborhood
                    FROM restaurants r
                    LEFT JOIN neighborhoods n ON r.neighborhood_id = n.id
                    ORDER BY r.name
                """)
            else:
                rows = await conn.fetch("""
                    SELECT r.id, r.name, n.name AS neighborhood
                    FROM restaurants r
                    LEFT JOIN neighborhoods n ON r.neighborhood_id = n.id
                    WHERE r.opening_hours IS NULL
                    ORDER BY r.name
                """)

            total = len(rows)
            if total == 0:
                yield "[✓] All restaurants already have opening_hours. Use ?update_all=true to re-sync.\n"
                return

            yield f"[*] Syncing {total} restaurants...\n"

            updated = skipped = errors = 0

            async with httpx.AsyncClient() as http:
                for i, row in enumerate(rows, 1):
                    rid = row["id"]
                    name = row["name"]
                    neighborhood = row["neighborhood"] or "Chennai"
                    prefix = f"  [{i}/{total}] {name} ({neighborhood})"

                    try:
                        place_id = await _find_place_id(http, api_key, name)
                        await asyncio.sleep(SLEEP_BETWEEN_REQUESTS)

                        if not place_id:
                            yield f"{prefix} ⚠ place not found\n"
                            skipped += 1
                            continue

                        hours = await _fetch_opening_hours(http, api_key, place_id)
                        await asyncio.sleep(SLEEP_BETWEEN_REQUESTS)

                        if not hours:
                            yield f"{prefix} ⚠ no hours data\n"
                            skipped += 1
                            continue

                        await conn.execute(
                            "UPDATE restaurants SET opening_hours = $1 WHERE id = $2",
                            json.dumps(hours), rid,
                        )
                        yield f"{prefix} ✓ ({len(hours)} days)\n"
                        updated += 1

                    except Exception as exc:
                        logger.exception("Error syncing hours for %s: %s", name, exc)
                        yield f"{prefix} ✗ error (see server logs)\n"
                        errors += 1

                    if i % 20 == 0 and i < total:
                        yield f"\n  [..] Pausing 2s after {i} requests...\n\n"
                        await asyncio.sleep(2)

            yield f"\n[DONE] Updated: {updated}  Skipped: {skipped}  Errors: {errors}\n"

    return StreamingResponse(stream(), media_type="text/plain")
