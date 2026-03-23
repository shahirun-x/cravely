"""
AgentState — the shared state TypedDict that flows through the LangGraph graph.
"""

from typing import List, Optional, TypedDict


class AgentState(TypedDict):
    # ── Input ──
    message: str
    session_id: str
    user_id: Optional[str]
    channel: str  # "web" or "whatsapp"
    city: str

    # ── Detected by intent_classifier ──
    intent: str  # find_restaurant | find_dish | restaurant_detail | save_favorite | chitchat | unclear
    extracted_params: dict

    # ── Set by executor ──
    tool_used: str
    tool_results: List[dict]

    # ── Conversation memory (last 6 messages from Redis) ──
    conversation_history: List[dict]

    # ── Final output ──
    final_response: str
    restaurants: List[dict]
