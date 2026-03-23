"""
LangGraph graph definition for the Cravely agent.
"""

from langgraph.graph import END, StateGraph

from app.agent.nodes import (
    executor_node,
    intent_classifier_node,
    query_builder_node,
    response_formatter_node,
)
from app.agent.state import AgentState


def should_skip_tools(state: AgentState) -> str:
    """Conditional edge: skip executor if intent is chitchat or unclear."""
    if state.get("intent") in ("chitchat", "unclear"):
        return "response_formatter"
    return "query_builder"


# ── Build the graph ──

workflow = StateGraph(AgentState)

workflow.add_node("intent_classifier", intent_classifier_node)
workflow.add_node("query_builder", query_builder_node)
workflow.add_node("executor", executor_node)
workflow.add_node("response_formatter", response_formatter_node)

workflow.set_entry_point("intent_classifier")
workflow.add_conditional_edges("intent_classifier", should_skip_tools)
workflow.add_edge("query_builder", "executor")
workflow.add_edge("executor", "response_formatter")
workflow.add_edge("response_formatter", END)

# Compile into a runnable agent
agent = workflow.compile()
