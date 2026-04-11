"""Test the 5 queries against the local Cravely API — with delays for rate limiting."""
import requests
import time

BASE = "http://127.0.0.1:8000/api/v1/chat"

tests = [
    "biryani near T. Nagar",
    "veg food in Adyar",
    "something spicy",
    "hi",
    "chettinad food",
]

for i, q in enumerate(tests):
    if i > 0:
        print("  [waiting 25s for rate limit...]")
        time.sleep(25)

    print(f"\n===== QUERY: {q} =====")
    try:
        r = requests.post(BASE, json={"message": q, "channel": "web"}, timeout=60)
        d = r.json()
        intent = d.get("intent", "?")
        rests = d.get("restaurants", [])
        resp = d.get("response", "")[:300]
        print(f"Intent: {intent}")
        print(f"Restaurants: {len(rests)}")
        if rests:
            for rest in rests[:3]:
                name = rest.get("name", "?")
                hood = rest.get("neighborhood", "?")
                print(f"  - {name} ({hood})")
        print(f"Response: {resp}...")
    except Exception as e:
        print(f"ERROR: {e}")

print("\n===== ALL TESTS DONE =====")
