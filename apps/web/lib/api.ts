import type { AgentResponse, RestaurantResult, SearchParams } from "./types";

const API_BASE = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000";
const TIMEOUT_MS = 10_000;

function createTimeoutSignal(): AbortSignal {
  return AbortSignal.timeout(TIMEOUT_MS);
}

function logError(context: string, error: unknown): void {
  if (process.env.NODE_ENV === "development") {
    console.error(`[api] ${context}:`, error);
  }
}

async function apiFetch(input: string, init?: RequestInit): Promise<Response> {
  const signal = createTimeoutSignal();
  try {
    return await fetch(input, { ...init, signal });
  } catch (err: unknown) {
    if (err instanceof Error && err.name === "TimeoutError") {
      throw new Error("Request timed out. Try again.");
    }
    throw err;
  }
}

export async function sendChatMessage(
  message: string,
  sessionId: string,
  city = "Chennai",
  authToken?: string,
): Promise<AgentResponse> {
  const headers: Record<string, string> = { "Content-Type": "application/json" };
  if (authToken) {
    headers["Authorization"] = `Bearer ${authToken}`;
  }

  let res: Response;
  try {
    res = await apiFetch(`${API_BASE}/api/v1/chat`, {
      method: "POST",
      headers,
      body: JSON.stringify({
        message,
        session_id: sessionId,
        // user_id intentionally omitted — backend derives identity from the JWT
        channel: "web",
        city,
      }),
    });
  } catch (err) {
    logError("sendChatMessage fetch", err);
    throw err;
  }

  if (!res.ok) {
    const error = new Error(`Chat request failed: ${res.status}`);
    logError("sendChatMessage response", error);
    throw error;
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

  let res: Response;
  try {
    res = await apiFetch(`${API_BASE}/api/v1/search?${query.toString()}`);
  } catch (err) {
    logError("searchRestaurants fetch", err);
    throw err;
  }

  if (!res.ok) {
    const error = new Error(`Search request failed: ${res.status}`);
    logError("searchRestaurants response", error);
    throw error;
  }

  return res.json();
}

export async function getRestaurantDetail(
  id: string
): Promise<RestaurantResult> {
  let res: Response;
  try {
    res = await apiFetch(`${API_BASE}/api/v1/restaurants/${id}`);
  } catch (err) {
    logError("getRestaurantDetail fetch", err);
    throw err;
  }

  if (!res.ok) {
    const error = new Error(`Restaurant detail request failed: ${res.status}`);
    logError("getRestaurantDetail response", error);
    throw error;
  }

  return res.json();
}
