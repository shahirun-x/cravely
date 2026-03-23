"""
Pydantic models for API request/response schemas.
"""

from typing import List, Optional

from pydantic import BaseModel, Field


class RestaurantResult(BaseModel):
    """Restaurant data returned by tools and sent to the frontend."""

    id: str
    name: str
    description: Optional[str] = None
    neighborhood: str
    address: str
    avg_rating: Optional[float] = None
    price_range: Optional[int] = None  # 1=budget, 2=mid, 3=premium
    is_pure_veg: bool = False
    timings: Optional[dict] = None
    cuisines: List[str] = Field(default_factory=list)
    top_dishes: List[str] = Field(default_factory=list)
    zomato_url: Optional[str] = None
    swiggy_url: Optional[str] = None


class MenuItemResult(BaseModel):
    """Menu item data returned by tools."""

    id: str
    restaurant_name: str
    name: str
    description: Optional[str] = None
    price: float
    is_veg: bool
    category: str


class AgentResponse(BaseModel):
    """Response returned by the /chat endpoint."""

    message: str
    restaurants: List[RestaurantResult] = Field(default_factory=list)
    intent: str
    tool_used: str
    session_id: str


class ChatRequest(BaseModel):
    """Request body for the /chat endpoint."""

    message: str
    session_id: Optional[str] = None  # null = new session
    user_id: Optional[str] = None  # null = anonymous
    channel: str = "web"  # "web" or "whatsapp"
    city: str = "Chennai"
