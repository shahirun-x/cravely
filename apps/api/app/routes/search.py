from typing import Optional, List
from fastapi import APIRouter, Request
from app.db.connection import get_db
from app.tools.search import filter_search, semantic_search
from app.models.schemas import RestaurantResult
from main import limiter

router = APIRouter()

@router.get("/search", response_model=List[RestaurantResult])
@limiter.limit("60/minute")
async def search_endpoint(
    request: Request,
    neighborhood: Optional[str] = None,
    cuisine: Optional[str] = None,
    item_name: Optional[str] = None
) -> List[RestaurantResult]:
    async with get_db() as conn:
        if item_name:
            query = f"{item_name} {cuisine or ''} {neighborhood or ''}".strip()
            raw_results = await semantic_search(conn, query, limit=20)
        else:
            raw_results = await filter_search(
                conn,
                neighborhood=neighborhood,
                cuisine=cuisine,
                limit=20
            )

        restaurants = []
        for r in raw_results:
            try:
                restaurants.append(RestaurantResult(
                    id=str(r.get("id", "")),
                    name=r.get("name", ""),
                    description=r.get("description"),
                    neighborhood=r.get("neighborhood", ""),
                    address=r.get("address", ""),
                    avg_rating=r.get("avg_rating"),
                    price_range=r.get("price_range"),
                    is_pure_veg=r.get("is_pure_veg", False),
                    timings=r.get("timings"),
                    cuisines=r.get("cuisines", []),
                    top_dishes=r.get("top_dishes", []),
                    zomato_url=r.get("zomato_url"),
                    swiggy_url=r.get("swiggy_url"),
                    latitude=r.get("latitude"),
                    longitude=r.get("longitude"),
                    opening_hours=r.get("opening_hours"),
                ))
            except Exception:
                pass
                
        return restaurants
