import type { AgentResponse, RestaurantResult, SearchParams } from "./types";

const API_BASE = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000";

export async function sendChatMessage(
  message: string,
  sessionId: string,
  city = "Chennai",
  userId?: string
): Promise<AgentResponse> {
  console.log('API URL:', process.env.NEXT_PUBLIC_API_URL);
  
  const actualUserId = userId || crypto.randomUUID();

  const res = await fetch(`${API_BASE}/api/v1/chat`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      message,
      session_id: sessionId,
      user_id: actualUserId,
      channel: "web",
      city,
    }),
  });

  if (!res.ok) {
    throw new Error(`Chat request failed: ${res.status}`);
  }

  return res.json();
}

export async function searchRestaurants(
  params: SearchParams
): Promise<RestaurantResult[]> {
  const query = new URLSearchParams();
  if (params.neighborhood) query.set("neighborhood", params.neighborhood);
  if (params.cuisine) query.set("cuisine", params.cuisine);
  if (params.price_range) query.set("price_range", String(params.price_range));
  if (params.is_veg) query.set("is_veg", "true");
  if (params.query) query.set("query", params.query);

  const res = await fetch(`${API_BASE}/api/v1/search?${query.toString()}`);

  if (!res.ok) {
    throw new Error(`Search request failed: ${res.status}`);
  }

  return res.json();
}

export async function getRestaurantDetail(
  id: string
): Promise<RestaurantResult> {
  const res = await fetch(`${API_BASE}/api/v1/restaurants/${id}`);

  if (!res.ok) {
    throw new Error(`Restaurant detail request failed: ${res.status}`);
  }

  return res.json();
}
