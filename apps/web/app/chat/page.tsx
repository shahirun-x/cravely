"use client";

import { useState } from "react";
import Header from "@/components/chat/Header";
import ChatPanel from "@/components/chat/ChatPanel";
import SearchPanel from "@/components/chat/SearchPanel";
import MapPanel from "@/components/chat/MapPanel";
import RestaurantSheet from "@/components/chat/RestaurantSheet";
import { MessageSquare, Search, MapIcon } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

type View = "chat" | "search" | "map";

export default function ChatPage() {
  const [activeView, setActiveView] = useState<View>("chat");
  const [sheetRestaurant, setSheetRestaurant] =
    useState<RestaurantResult | null>(null);

  function handleAskCravely(name: string) {
    setActiveView("chat");
    setTimeout(() => {
      const event = new CustomEvent("cravely:send", { detail: name });
      window.dispatchEvent(event);
    }, 100);
  }

  function handleRestaurantClick(restaurant: RestaurantResult) {
    setSheetRestaurant(restaurant);
  }

  return (
    <div className="h-screen flex flex-col bg-bg-primary">
      {/* Header */}
      <Header activeView={activeView} onViewChange={setActiveView} />

      {/* Main content */}
      <div className="flex-1 flex overflow-hidden">
        {/* Chat panel — always mounted to preserve history, hidden via CSS on mobile when other view active */}
        <div
          className={`w-full flex-col ${
            activeView === "chat" ? "flex flex-1" : "hidden lg:flex lg:w-[400px] lg:shrink-0"
          }`}
          style={{ borderRight: activeView !== "chat" ? "1px solid var(--border)" : "none" }}
        >
          <div className={`w-full h-full flex flex-col mx-auto ${activeView === "chat" ? "lg:max-w-3xl" : ""}`}>
            <ChatPanel onRestaurantClick={handleRestaurantClick} />
          </div>
        </div>

        {/* Right panel — Search or Map */}
        {activeView !== "chat" && (
          <div className="flex-1 flex">
            {activeView === "search" && (
              <SearchPanel
                onAskCravely={handleAskCravely}
                onRestaurantClick={handleRestaurantClick}
              />
            )}
            {activeView === "map" && (
              <MapPanel
                restaurants={[]}
                onAskCravely={handleAskCravely}
              />
            )}
          </div>
        )}
      </div>

      {/* Restaurant detail sheet */}
      <RestaurantSheet
        restaurant={sheetRestaurant}
        onClose={() => setSheetRestaurant(null)}
        onAskCravely={(name) => {
          setSheetRestaurant(null);
          handleAskCravely(name);
        }}
      />

      {/* Mobile bottom tab bar */}
      <div
        className="lg:hidden flex items-center shrink-0"
        style={{
          backgroundColor: "var(--bg-secondary)",
          borderTop: "1px solid var(--border)",
        }}
      >
        {(
          [
            { key: "chat" as View, label: "Chat", Icon: MessageSquare },
            { key: "search" as View, label: "Search", Icon: Search },
            { key: "map" as View, label: "Map", Icon: MapIcon },
          ] as const
        ).map(({ key, label, Icon }) => (
          <button
            key={key}
            onClick={() => setActiveView(key)}
            className="flex-1 flex flex-col items-center gap-0.5 py-2.5 cursor-pointer transition-default"
          >
            <Icon
              className="w-5 h-5"
              style={{
                color:
                  activeView === key
                    ? "var(--accent)"
                    : "var(--text-muted)",
              }}
            />
            <span
              className="text-[10px] font-medium capitalize"
              style={{
                color:
                  activeView === key
                    ? "var(--accent)"
                    : "var(--text-muted)",
              }}
            >
              {label}
            </span>
          </button>
        ))}
      </div>
    </div>
  );
}
