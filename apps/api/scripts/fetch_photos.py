"""
Fetch Unsplash food photos for restaurants based on cuisine type.

Prerequisites:
  1. Sign up at unsplash.com/developers, create an app, get Access Key.
  2. Add to apps/api/.env:
       SUPABASE_URL=https://...
       SUPABASE_ANON_KEY=...
       UNSPLASH_ACCESS_KEY=...

Usage:
  cd apps/api
  python scripts/fetch_photos.py           # all restaurants without a photo
  python scripts/fetch_photos.py --debug   # first 5 only, verbose
  python scripts/fetch_photos.py --all     # overwrite existing photos too
"""

import os
import sys
import time
import json
import random
import requests

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

DEBUG = "--debug" in sys.argv
OVERWRITE = "--all" in sys.argv

SUPABASE_URL = os.environ["SUPABASE_URL"].rstrip("/")
SUPABASE_ANON_KEY = os.environ["SUPABASE_ANON_KEY"]
UNSPLASH_ACCESS_KEY = os.environ["UNSPLASH_ACCESS_KEY"]

HEADERS = {
    "apikey": SUPABASE_ANON_KEY,
    "Authorization": f"Bearer {SUPABASE_ANON_KEY}",
}

CUISINE_QUERIES = {
    "South Indian": "dosa idli south indian food",
    "North Indian": "indian curry butter chicken food",
    "Chinese": "chinese noodles fried rice food",
    "Italian": "pizza pasta italian food",
    "Fast Food": "burger fries fast food",
    "Biryani": "biryani indian rice food",
    "Seafood": "seafood fish curry food",
    "Cafe": "coffee cafe food",
    "Bakery": "bakery pastry bread food",
    "Street Food": "indian street food",
    "BBQ": "bbq grilled meat food",
    "Desserts": "indian sweets dessert",
    "default": "indian restaurant food",
}


def get_cuisine_for_restaurant(restaurant_id: str) -> str:
    resp = requests.get(
        f"{SUPABASE_URL}/rest/v1/restaurant_cuisines",
        headers=HEADERS,
        params={
            "restaurant_id": f"eq.{restaurant_id}",
            "select": "cuisines(name)",
            "limit": "1",
        },
        timeout=10,
    )
    data = resp.json()
    if data and data[0].get("cuisines"):
        return data[0]["cuisines"]["name"]
    return "default"


def fetch_unsplash_photo(query: str) -> str | None:
    resp = requests.get(
        "https://api.unsplash.com/search/photos",
        headers={"Authorization": f"Client-ID {UNSPLASH_ACCESS_KEY}"},
        params={"query": query, "per_page": 5, "orientation": "landscape"},
        timeout=10,
    )
    data = resp.json()
    if DEBUG:
        print(f"  Unsplash query: {query}")
        print(f"  Results: {len(data.get('results', []))}")
    results = data.get("results", [])
    if not results:
        return None
    photo = random.choice(results)
    return photo["urls"]["regular"]


def main():
    resp = requests.get(
        f"{SUPABASE_URL}/rest/v1/restaurants",
        headers=HEADERS,
        params={"select": "id,name,photo_url", "limit": "1000"},
        timeout=15,
    )
    resp.raise_for_status()
    restaurants = resp.json()

    if OVERWRITE:
        to_process = restaurants
    else:
        to_process = [r for r in restaurants if not r.get("photo_url")]

    if DEBUG:
        to_process = to_process[:5]
        print(f"[DEBUG] Testing first {len(to_process)} restaurants\n")
    else:
        print(f"Found {len(to_process)} restaurants without photos\n")

    for r in to_process:
        name = r["name"]
        try:
            cuisine = get_cuisine_for_restaurant(r["id"])
            query = CUISINE_QUERIES.get(cuisine, CUISINE_QUERIES["default"])

            if DEBUG:
                print(f"{name} (cuisine: {cuisine})")

            photo_url = fetch_unsplash_photo(query)
            if not photo_url:
                print(f"Failed: {name} — no photos found on Unsplash")
                continue

            requests.patch(
                f"{SUPABASE_URL}/rest/v1/restaurants",
                headers={**HEADERS, "Content-Type": "application/json", "Prefer": "return=minimal"},
                params={"id": f"eq.{r['id']}"},
                data=json.dumps({"photo_url": photo_url}),
                timeout=15,
            ).raise_for_status()

            print(f"Updated: {name} → {cuisine}")
            time.sleep(0.05)

        except Exception as e:
            print(f"Failed: {name} — {e}")

    print("\nDone.")


if __name__ == "__main__":
    main()
