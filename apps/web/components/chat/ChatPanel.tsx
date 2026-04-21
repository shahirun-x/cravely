"use client";

import { useState, useRef, useEffect, useCallback } from "react";
import ReactMarkdown from "react-markdown";
import { sendChatMessage } from "@/lib/api";
import type { ChatMessage, RestaurantResult } from "@/lib/types";
import { Star, ArrowUp } from "lucide-react";

interface ChatPanelProps {
  onRestaurantClick?: (restaurant: RestaurantResult) => void;
  onRestaurantsUpdate?: (restaurants: RestaurantResult[]) => void;
}

const SUGGESTIONS = [
  "Biryani near T. Nagar",
  "Veg-friendly cafes in Adyar",
  "Best dosas in Mylapore",
  "Late night food in OMR",
];

export default function ChatPanel({ onRestaurantClick, onRestaurantsUpdate }: ChatPanelProps) {
  console.log('user:', 'none', 'session:', typeof window !== 'undefined' ? sessionStorage.getItem("cravely-session-id") : 'server');
  
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const bottomRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  // Session ID persisted in sessionStorage
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

  // Auto-scroll on new messages
  useEffect(() => {
    requestAnimationFrame(() => {
      bottomRef.current?.scrollIntoView({ behavior: "smooth" });
    });
  }, [messages, loading]);

  // Listen for external "cravely:send" events
  useEffect(() => {
    function handleExternalSend(e: Event) {
      const detail = (e as CustomEvent).detail;
      if (detail) sendMessage(`Tell me more about ${detail}`);
    }
    window.addEventListener("cravely:send", handleExternalSend);
    return () =>
      window.removeEventListener("cravely:send", handleExternalSend);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const sendMessage = useCallback(
    async (text: string) => {
      console.log('handleSubmit fired', text);
      if (!text.trim() || loading) return;

      const userMsg: ChatMessage = {
        id: crypto.randomUUID(),
        role: "user",
        content: text.trim(),
        restaurants: [],
        timestamp: new Date(),
      };

      setMessages((prev) => [...prev, userMsg]);
      setInput(""); // Clear input immediately
      setLoading(true);

      try {
        const response = await sendChatMessage(text.trim(), sessionId);

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
      } catch (error: any) {
        console.error("Chat request failed:", error);
        const errorMsg: ChatMessage = {
          id: crypto.randomUUID(),
          role: "assistant",
          content: `Error: ${error?.message || "Unknown error occurred"}`,
          restaurants: [],
          timestamp: new Date(),
        };
        setMessages((prev) => [...prev, errorMsg]);
      } finally {
        setLoading(false);
        inputRef.current?.focus();
      }
    },
    [loading, sessionId]
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
    <div className="flex flex-col h-full bg-bg-primary">
      {/* Messages area */}
      <div className="flex-1 overflow-y-auto px-4 py-4 space-y-4">
        {messages.length === 0 ? (
          /* Welcome state */
          <div className="flex flex-col items-center justify-center h-full text-center px-4">
            <h2 className="text-lg font-semibold mb-1 text-text-primary">
              What are you craving?
            </h2>
            <p className="text-sm mb-6 text-text-secondary">
              Ask me anything about food in Chennai
            </p>
            <div className="flex flex-wrap gap-2 justify-center max-w-sm">
              {SUGGESTIONS.map((s) => (
                <button
                  key={s}
                  onClick={() => sendMessage(s)}
                  className="px-4 py-2 text-[13px] text-text-secondary transition-default cursor-pointer"
                  style={{
                    backgroundColor: "var(--bg-elevated)",
                    border: "1px solid var(--border)",
                    borderRadius: "var(--radius-xl)",
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.borderColor = "var(--accent)";
                    e.currentTarget.style.color = "var(--accent)";
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.borderColor = "var(--border)";
                    e.currentTarget.style.color = "var(--text-secondary)";
                  }}
                >
                  {s}
                </button>
              ))}
            </div>
          </div>
        ) : (
          /* Message list */
          messages.map((msg) => (
            <div key={msg.id}>
              <div
                className={`flex ${
                  msg.role === "user" ? "justify-end" : "justify-start"
                }`}
              >
                <div className="max-w-[75%]">
                  {msg.role === "assistant" && (
                    <span
                      className="text-[10px] font-semibold mb-1 block uppercase"
                      style={{
                        color: "var(--accent)",
                        letterSpacing: "0.06em",
                      }}
                    >
                      Cravely
                    </span>
                  )}
                  <div
                    className="px-4 py-2.5 text-sm leading-relaxed"
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
                    style={{
                      textAlign: msg.role === "user" ? "right" : "left",
                    }}
                  >
                    {formatTime(msg.timestamp)}
                  </span>


                </div>
              </div>
            </div>
          ))
        )}

        {/* Typing indicator */}
        {loading && (
          <div className="flex justify-start">
            <div className="flex gap-2 items-center p-3 bg-[#1A1A1A] rounded-lg w-fit"
              style={{ borderRadius: "var(--radius-lg) var(--radius-lg) var(--radius-lg) 4px" }}
            >
              <span className="text-[#888888] text-xs font-semibold tracking-wider">CRAVELY</span>
              <div className="flex gap-1">
                <span className="w-2 h-2 bg-[#FF6B35] rounded-full animate-bounce" style={{animationDelay: '0ms'}}/>
                <span className="w-2 h-2 bg-[#FF6B35] rounded-full animate-bounce" style={{animationDelay: '150ms'}}/>
                <span className="w-2 h-2 bg-[#FF6B35] rounded-full animate-bounce" style={{animationDelay: '300ms'}}/>
              </div>
            </div>
          </div>
        )}
        <div ref={bottomRef} />
      </div>

      {/* Input bar */}
      <div
        className="px-4 py-3"
        style={{
          backgroundColor: "var(--bg-secondary)",
          borderTop: "1px solid var(--border)",
        }}
      >
        <div
          className="flex items-center gap-2 px-4 py-2"
          style={{
            backgroundColor: "var(--bg-elevated)",
            border: "1px solid var(--border)",
            borderRadius: "var(--radius-xl)",
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
            className="flex-1 text-sm outline-none bg-transparent disabled:opacity-50 text-text-primary placeholder:text-text-muted"
          />
          <button
            onClick={() => sendMessage(input)}
            disabled={!input.trim() || loading}
            className="w-8 h-8 rounded-full flex items-center justify-center shrink-0 transition-default cursor-pointer disabled:opacity-30 disabled:cursor-not-allowed"
            style={{ backgroundColor: "var(--accent)" }}
          >
            <ArrowUp className="w-4 h-4 text-white" />
          </button>
        </div>
      </div>
    </div>
  );
}
