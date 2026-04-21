// Shared types matching the FastAPI AgentResponse schema

export interface RestaurantResult {
  id: string;
  name: string;
  description?: string | null;
  neighborhood: string;
  address: string;
  avg_rating?: number | null;
  price_range?: number | null;
  is_pure_veg: boolean;
  timings?: Record<string, string> | null;
  cuisines: string[];
  top_dishes: string[];
  zomato_url?: string | null;
  swiggy_url?: string | null;
  menu_items?: MenuItem[];
  phone?: string | null;
  latitude?: number | null;
  longitude?: number | null;
}

export interface MenuItem {
  name: string;
  description?: string | null;
  price: number;
  is_veg: boolean;
  category?: string | null;
}

export interface AgentResponse {
  message: string;
  restaurants: RestaurantResult[];
  intent: string;
  tool_used: string;
  session_id: string;
}

export interface ChatMessage {
  id: string;
  role: "user" | "assistant";
  content: string;
  restaurants: RestaurantResult[];
  timestamp: Date;
}

export interface SearchParams {
  neighborhood?: string;
  cuisine?: string;
  price_range?: number;
  is_veg?: boolean;
  query?: string;
}
