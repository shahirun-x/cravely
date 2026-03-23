#!/usr/bin/env python3
"""
Fetch restaurant data from Google Places API for Chennai neighborhoods.

Usage:
    python fetch_places.py --neighborhood "T. Nagar"
    python fetch_places.py --neighborhood "Adyar"
    python fetch_places.py --neighborhood "all"

Output:
    Saves JSON files to ../data/places_{slug}.json
"""

import argparse
import json
import os
import re
import time
from pathlib import Path

import requests
from dotenv import load_dotenv

# Load environment variables
load_dotenv(Path(__file__).resolve().parent.parent / ".env")

API_KEY = os.getenv("GOOGLE_PLACES_API_KEY")
TEXT_SEARCH_URL = "https://maps.googleapis.com/maps/api/place/textsearch/json"
PLACE_DETAILS_URL = "https://maps.googleapis.com/maps/api/place/details/json"
DATA_DIR = Path(__file__).resolve().parent.parent / "data"

NEIGHBORHOODS = [
    "T. Nagar",
    "Adyar",
    "Mylapore",
    "Anna Nagar",
    "OMR",
    "Nungambakkam",
]

DETAIL_FIELDS = [
    "place_id",
    "name",
    "formatted_address",
    "geometry",
    "formatted_phone_number",
    "opening_hours",
    "rating",
    "user_ratings_total",
    "price_level",
    "photos",
    "website",
    "url",
]


def slugify(name: str) -> str:
    """Convert a neighborhood name to a URL-safe slug."""
    slug = name.lower().strip()
    slug = re.sub(r"[.\s]+", "-", slug)
    slug = re.sub(r"[^a-z0-9-]", "", slug)
    slug = re.sub(r"-+", "-", slug).strip("-")
    return slug


def fetch_text_search(query: str) -> list[dict]:
    """Fetch up to 60 results using Text Search with pagination."""
    all_results = []
    params = {"query": query, "key": API_KEY}

    for page in range(3):  # Max 3 pages (60 results)
        print(f"  Fetching page {page + 1}...")
        response = requests.get(TEXT_SEARCH_URL, params=params, timeout=10)
        data = response.json()

        if data.get("status") != "OK":
            print(f"  ⚠ Text Search status: {data.get('status')} — {data.get('error_message', '')}")
            break

        all_results.extend(data.get("results", []))
        print(f"  Got {len(data.get('results', []))} results (total: {len(all_results)})")

        next_token = data.get("next_page_token")
        if not next_token:
            break

        # Google requires a short delay before using next_page_token
        time.sleep(2)
        params = {"pagetoken": next_token, "key": API_KEY}

    return all_results


def fetch_place_details(place_id: str) -> dict | None:
    """Fetch full details for a single place."""
    params = {
        "place_id": place_id,
        "fields": ",".join(DETAIL_FIELDS),
        "key": API_KEY,
    }
    try:
        response = requests.get(PLACE_DETAILS_URL, params=params, timeout=10)
        data = response.json()
        if data.get("status") == "OK":
            return data.get("result")
        else:
            print(f"    ⚠ Details error for {place_id}: {data.get('status')}")
            return None
    except requests.RequestException as e:
        print(f"    ⚠ Request failed for {place_id}: {e}")
        return None


def extract_restaurant_data(detail: dict) -> dict:
    """Extract the fields we care about from a Place Details response."""
    photos = detail.get("photos", [])
    opening_hours = detail.get("opening_hours", {})

    return {
        "place_id": detail.get("place_id"),
        "name": detail.get("name"),
        "formatted_address": detail.get("formatted_address"),
        "latitude": detail.get("geometry", {}).get("location", {}).get("lat"),
        "longitude": detail.get("geometry", {}).get("location", {}).get("lng"),
        "formatted_phone_number": detail.get("formatted_phone_number"),
        "opening_hours_text": opening_hours.get("weekday_text"),
        "rating": detail.get("rating"),
        "user_ratings_total": detail.get("user_ratings_total"),
        "price_level": detail.get("price_level"),
        "photo_reference": photos[0].get("photo_reference") if photos else None,
        "website": detail.get("website"),
        "google_maps_url": detail.get("url"),
    }


def fetch_neighborhood(neighborhood: str) -> None:
    """Fetch all restaurants for a neighborhood and save to JSON."""
    slug = slugify(neighborhood)
    query = f"restaurants in {neighborhood}, Chennai"
    output_file = DATA_DIR / f"places_{slug}.json"

    print(f"\n{'='*60}")
    print(f"Fetching: {neighborhood} (slug: {slug})")
    print(f"Query: \"{query}\"")
    print(f"{'='*60}")

    # Step 1: Text Search
    search_results = fetch_text_search(query)
    print(f"\n  Found {len(search_results)} restaurants from Text Search")

    # Step 2: Fetch details for each
    restaurants = []
    errors = 0

    for i, result in enumerate(search_results, 1):
        place_id = result.get("place_id")
        name = result.get("name", "Unknown")
        print(f"  [{i}/{len(search_results)}] Fetching details: {name}")

        detail = fetch_place_details(place_id)
        if detail:
            restaurants.append(extract_restaurant_data(detail))
        else:
            errors += 1

        # Small delay to respect rate limits
        if i % 10 == 0:
            time.sleep(1)

    # Step 3: Save
    DATA_DIR.mkdir(parents=True, exist_ok=True)
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(restaurants, f, indent=2, ensure_ascii=False)

    print(f"\n✅ Saved {len(restaurants)} restaurants to {output_file}")
    if errors:
        print(f"⚠  {errors} restaurants had errors fetching details")


def main():
    parser = argparse.ArgumentParser(description="Fetch Chennai restaurant data from Google Places API")
    parser.add_argument(
        "--neighborhood",
        type=str,
        required=True,
        help='Neighborhood name (e.g. "T. Nagar") or "all" for all neighborhoods',
    )
    args = parser.parse_args()

    if not API_KEY:
        print("❌ GOOGLE_PLACES_API_KEY not found in .env file")
        print("   Create apps/api/.env with: GOOGLE_PLACES_API_KEY=your_key_here")
        return

    if args.neighborhood.lower() == "all":
        for neighborhood in NEIGHBORHOODS:
            fetch_neighborhood(neighborhood)
    else:
        if args.neighborhood not in NEIGHBORHOODS:
            print(f"⚠ Warning: '{args.neighborhood}' not in default list: {NEIGHBORHOODS}")
            print("  Proceeding anyway...")
        fetch_neighborhood(args.neighborhood)

    print("\n🎉 Done!")


if __name__ == "__main__":
    main()
