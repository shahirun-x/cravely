"""
Fetch Google Places photos for all restaurants and populate photo_url.

Prerequisites:
  1. Run apps/api/db/add_photo_url.sql in the Supabase SQL editor.
  2. Set env vars:
       SUPABASE_URL
       SUPABASE_SERVICE_ROLE_KEY   (needs UPDATE on restaurants)
       GOOGLE_PLACES_API_KEY

Usage:
  cd apps/api
  python scripts/fetch_photos.py
"""

import os
import time
import requests
from supabase import create_client

SUPABASE_URL = os.environ["SUPABASE_URL"]
SUPABASE_KEY = os.environ["SUPABASE_SERVICE_ROLE_KEY"]
GOOGLE_KEY = os.environ["GOOGLE_PLACES_API_KEY"]

PLACES_DETAILS = "https://maps.googleapis.com/maps/api/place/details/json"
PLACES_TEXTSEARCH = "https://maps.googleapis.com/maps/api/place/textsearch/json"
PLACES_PHOTO = "https://maps.googleapis.com/maps/api/place/photo"

supabase = create_client(SUPABASE_URL, SUPABASE_KEY)


def photo_url_from_ref(ref: str) -> str:
    return (
        f"{PLACES_PHOTO}?maxwidth=800"
        f"&photo_reference={ref}"
        f"&key={GOOGLE_KEY}"
    )


def fetch_photo_ref_for_place(place_id: str) -> str | None:
    resp = requests.get(
        PLACES_DETAILS,
        params={"place_id": place_id, "fields": "photos", "key": GOOGLE_KEY},
        timeout=10,
    )
    data = resp.json()
    photos = data.get("result", {}).get("photos", [])
    if photos:
        return photos[0]["photo_reference"]
    return None


def search_place_id(name: str) -> str | None:
    resp = requests.get(
        PLACES_TEXTSEARCH,
        params={"query": f"{name} Chennai", "key": GOOGLE_KEY},
        timeout=10,
    )
    results = resp.json().get("results", [])
    if results:
        return results[0]["place_id"]
    return None


def main():
    response = supabase.from_("restaurants").select("id, name, google_place_id").execute()
    restaurants = response.data or []
    print(f"Processing {len(restaurants)} restaurants…\n")

    for r in restaurants:
        rid = r["id"]
        name = r["name"]
        place_id = r.get("google_place_id") or None

        try:
            # Resolve place_id if missing
            if not place_id:
                place_id = search_place_id(name)
                if not place_id:
                    print(f"Failed: {name} — could not find place_id")
                    time.sleep(0.2)
                    continue
                supabase.from_("restaurants").update(
                    {"google_place_id": place_id}
                ).eq("id", rid).execute()

            # Fetch photo reference
            ref = fetch_photo_ref_for_place(place_id)
            if not ref:
                print(f"Failed: {name} — no photos returned")
                time.sleep(0.2)
                continue

            url = photo_url_from_ref(ref)
            supabase.from_("restaurants").update({"photo_url": url}).eq("id", rid).execute()
            print(f"Updated: {name} → {url[:80]}…")

        except Exception as exc:
            print(f"Failed: {name} — {exc}")

        time.sleep(0.2)

    print("\nDone.")


if __name__ == "__main__":
    main()
