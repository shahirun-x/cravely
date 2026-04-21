"use client";

import { useState, useRef, useEffect, useCallback } from "react";
import ReactMarkdown from "react-markdown";
import { sendChatMessage } from "@/lib/api";
import { createClient } from "@/lib/supabase/client";
import type { ChatMessage, RestaurantResult } from "@/lib/types";

// Stable singleton — avoids a fresh unauthenticated client on every sendMessage call
const supabase = createClient();
import RestaurantCard from "@/components/chat/RestaurantCard";
import { ArrowUp, Sparkles } from "lucide-react";

interface ChatPanelProps {
  onRestaurantClick?: (restaurant: RestaurantResult) => void;
  onRestaurantsUpdate?: (restaurants: RestaurantResult[]) => void;
}

const SUGGESTIONS = [
  "Biryani in T Nagar",
  "Veg cafes in Adyar",
  "Late night food in OMR",
  "Budget lunch in Anna Nagar",
  "Best coffee in Nungambakkam",
  "Non-veg near Velachery",
];

// Mobile bottom nav height + safe area reserve
const MOBILE_NAV_HEIGHT = 56;

export default function ChatPanel({ onRestaurantClick, onRestaurantsUpdate }: ChatPanelProps) {

  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const bottomRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const [sessionId] = useState(() => {
    if (typeof window !== "undefined") {
      const existing = sessionStorage.getItem("cravely-session-id");
      if (existing) return existing;
      const newId = crypto.randomUUID();
      sessionStorage.setItem("cravely-session-id", newId);
      return newId;
    }
    return crypto.randomUUID();
  });

  useEffect(() => {
    requestAnimationFrame(() => {
      bottomRef.current?.scrollIntoView({ behavior: "smooth" });
    });
  }, [messages, loading]);

  useEffect(() => {
    function handleExternalSend(e: Event) {
      const detail = (e as CustomEvent).detail;
      if (detail) sendMessage(`Tell me more about ${detail}`);
    }
    window.addEventListener("cravely:send", handleExternalSend);
    return () => window.removeEventListener("cravely:send", handleExternalSend);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const sendMessage = useCallback(
    async (text: string) => {
      if (!text.trim() || loading) return;

      const userMsg: ChatMessage = {
        id: crypto.randomUUID(),
        role: "user",
        content: text.trim(),
        restaurants: [],
        timestamp: new Date(),
      };

      setMessages((prev) => [...prev, userMsg]);
      setInput("");
      setLoading(true);

      try {
        const { data: { session } } = await supabase.auth.getSession();
        const authToken = session?.access_token;
        if (process.env.NODE_ENV === "development") {
          console.log("[ChatPanel] authToken present:", authToken != null);
        }
        if (!authToken) {
          throw new Error("Not authenticated");
        }
        const response = await sendChatMessage(text.trim(), sessionId, "Chennai", authToken);

        const botMsg: ChatMessage = {
          id: crypto.randomUUID(),
          role: "assistant",
          content: response.message,
          restaurants: response.restaurants || [],
          timestamp: new Date(),
        };

        setMessages((prev) => [...prev, botMsg]);
        if (onRestaurantsUpdate && response.restaurants) {
          onRestaurantsUpdate(response.restaurants);
        }
      } catch (error: unknown) {
        if (process.env.NODE_ENV === "development") {
          console.error("[ChatPanel] sendMessage error:", error);
        }
        // Surface a timeout hint to the user, generic message otherwise
        const isTimeout =
          error instanceof Error && error.message.includes("timed out");
        const errorMsg: ChatMessage = {
          id: crypto.randomUUID(),
          role: "assistant",
          content: isTimeout
            ? "Request timed out. Try again."
            : "Something went wrong. Please try again.",
          restaurants: [],
          timestamp: new Date(),
        };
        setMessages((prev) => [...prev, errorMsg]);
      } finally {
        setLoading(false);
        inputRef.current?.focus();
      }
    },
    [loading, sessionId, onRestaurantsUpdate]
  );

  function handleKeyDown(e: React.KeyboardEvent) {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      sendMessage(input);
    }
  }

  function formatTime(date: Date) {
    return date.toLocaleTimeString("en-IN", {
      hour: "2-digit",
      minute: "2-digit",
    });
  }

  return (
    <div className="flex flex-col h-full bg-bg-primary relative">
      {/* Messages area — padded at bottom on mobile so fixed input bar doesn't overlap */}
      <div
        className="flex-1 overflow-y-auto px-4 py-4 space-y-4"
        style={{
          overscrollBehavior: "contain",
          WebkitOverflowScrolling: "touch",
          // on mobile, reserve space for fixed input + bottom nav
          paddingBottom: `calc(${MOBILE_NAV_HEIGHT + 72}px + env(safe-area-inset-bottom))`,
        }}
      >
        {messages.length === 0 ? (
          <div className="flex flex-col items-center justify-center h-full text-center px-4">
            <Sparkles className="w-6 h-6 mb-3" style={{ color: "#FF6B35" }} />
            <h2 className="text-base font-medium mb-1" style={{ color: "#F5F5F5" }}>
              What are you craving?
            </h2>
            <p className="text-sm mb-6" style={{ color: "#555555" }}>
              Try one of these or type your own
            </p>
            <div className="flex flex-wrap gap-2 justify-center max-w-sm">
              {SUGGESTIONS.map((s) => (
                <button
                  key={s}
                  onClick={() => { setInput(s); sendMessage(s); }}
                  className="px-4 py-2 text-sm rounded-full transition-colors cursor-pointer"
                  style={{
                    border: "1px solid #2A2A2A",
                    backgroundColor: "#1A1A1A",
                    color: "#888888",
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.borderColor = "#FF6B35";
                    e.currentTarget.style.color = "#FF6B35";
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.borderColor = "#2A2A2A";
                    e.currentTarget.style.color = "#888888";
                  }}
                >
                  {s}
                </button>
              ))}
            </div>
          </div>
        ) : (
          messages.map((msg) => (
            <div key={msg.id}>
              <div
                className={`flex ${
                  msg.role === "user" ? "justify-end" : "justify-start"
                }`}
              >
                <div className="max-w-[85%]">
                  {msg.role === "assistant" && (
                    <span
                      className="text-[10px] font-semibold mb-1 block uppercase"
                      style={{ color: "var(--accent)", letterSpacing: "0.06em" }}
                    >
                      Cravely
                    </span>
                  )}
                  <div
                    className="px-4 py-3 text-[15px] leading-relaxed"
                    style={{
                      borderRadius:
                        msg.role === "user"
                          ? "var(--radius-lg) var(--radius-lg) 4px var(--radius-lg)"
                          : "var(--radius-lg) var(--radius-lg) var(--radius-lg) 4px",
                      backgroundColor:
                        msg.role === "user"
                          ? "var(--accent)"
                          : "var(--bg-card)",
                      color:
                        msg.role === "user"
                          ? "#FFFFFF"
                          : "var(--text-primary)",
                      border:
                        msg.role === "assistant"
                          ? "1px solid var(--border)"
                          : "none",
                    }}
                  >
                    {msg.role === "assistant" ? (
                      <div className="prose prose-sm prose-invert max-w-none [&_p]:my-1 [&_ul]:my-1 [&_li]:my-0.5">
                        <ReactMarkdown>{msg.content}</ReactMarkdown>
                      </div>
                    ) : (
                      msg.content
                    )}
                  </div>
                  <span
                    className="text-[11px] mt-1 block text-text-muted"
                    style={{ textAlign: msg.role === "user" ? "right" : "left" }}
                  >
                    {formatTime(msg.timestamp)}
                  </span>
                </div>
              </div>

              {/* Inline restaurant cards — horizontal scroll on mobile */}
              {msg.role === "assistant" && msg.restaurants && msg.restaurants.length > 0 && (
                <div
                  className="mt-3 flex gap-3 overflow-x-auto sm:grid sm:grid-cols-1 sm:overflow-visible pb-1"
                  style={{
                    scrollSnapType: "x mandatory",
                    WebkitOverflowScrolling: "touch",
                    scrollbarWidth: "none",
                    msOverflowStyle: "none",
                  }}
                >
                  {msg.restaurants.map((r) => (
                    <div
                      key={r.id || r.name}
                      className="shrink-0 sm:shrink"
                      style={{
                        minWidth: "280px",
                        maxWidth: "320px",
                        scrollSnapAlign: "start",
                        width: "80vw",
                      }}
                    >
                      <RestaurantCard
                        restaurant={r}
                        onClick={() => onRestaurantClick?.(r)}
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>
          ))
        )}

        {/* Typing indicator */}
        {loading && (
          <div className="flex justify-start">
            <div
              className="flex gap-2 items-center p-3 w-fit"
              style={{
                backgroundColor: "var(--bg-card)",
                border: "1px solid var(--border)",
                borderRadius: "var(--radius-lg) var(--radius-lg) var(--radius-lg) 4px",
              }}
            >
              <span className="text-[10px] font-semibold uppercase tracking-wider" style={{ color: "var(--accent)" }}>
                Cravely
              </span>
              <div className="flex gap-1">
                {[0, 150, 300].map((delay) => (
                  <span
                    key={delay}
                    className="w-2 h-2 rounded-full animate-bounce"
                    style={{
                      backgroundColor: "var(--accent)",
                      animationDelay: `${delay}ms`,
                    }}
                  />
                ))}
              </div>
            </div>
          </div>
        )}
        <div ref={bottomRef} />
      </div>

      {/* Input bar —
          On mobile: fixed above the bottom nav bar
          On desktop (sm+): static at bottom of panel */}
      <div
        className="sm:static sm:border-t px-4 py-3 z-20"
        style={{
          // mobile: fixed above bottom nav
          position: "fixed" as any,
          bottom: `calc(${MOBILE_NAV_HEIGHT}px + env(safe-area-inset-bottom))`,
          left: 0,
          right: 0,
          backgroundColor: "var(--bg-secondary)",
          borderTop: "1px solid var(--border)",
        }}
      >
        <div
          className="flex items-center gap-2 px-4"
          style={{
            backgroundColor: "var(--bg-elevated)",
            border: "1px solid var(--border)",
            borderRadius: "var(--radius-xl)",
            height: "48px",
          }}
        >
          <input
            ref={inputRef}
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Ask Cravely anything..."
            disabled={loading}
            className="flex-1 outline-none bg-transparent disabled:opacity-50 text-text-primary placeholder:text-text-muted"
            style={{ fontSize: "16px" }}
          />
          <button
            onClick={() => sendMessage(input)}
            disabled={!input.trim() || loading}
            className="rounded-full flex items-center justify-center shrink-0 transition-default cursor-pointer disabled:opacity-30 disabled:cursor-not-allowed"
            style={{
              width: "36px",
              height: "36px",
              backgroundColor: "var(--accent)",
              minHeight: "unset",
              minWidth: "unset",
            }}
          >
            <ArrowUp className="w-4 h-4 text-white" />
          </button>
        </div>
      </div>

      {/* Spacer so static desktop input doesn't overlap content */}
      <div className="hidden sm:block h-[72px] shrink-0" />
    </div>
  );
}
