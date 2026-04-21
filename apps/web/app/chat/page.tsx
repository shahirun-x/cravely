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

import RestaurantCard from "@/components/chat/RestaurantCard";

export default function ChatPage() {
  const [activeView, setActiveView] = useState<View>("chat");
  const [sheetRestaurant, setSheetRestaurant] = useState<RestaurantResult | null>(null);
  const [currentRestaurants, setCurrentRestaurants] = useState<RestaurantResult[]>([]);

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
          className={`w-full lg:w-[400px] lg:shrink-0 flex flex-col ${
            activeView !== "chat" ? "hidden lg:flex" : "flex"
          }`}
          style={{ borderRight: "1px solid var(--border)" }}
        >
          <ChatPanel 
            onRestaurantClick={handleRestaurantClick} 
            onRestaurantsUpdate={setCurrentRestaurants}
          />
        </div>

        {/* Right panel — Search or Map or Chat Grid */}
        <div
          className={`flex-1 ${
            activeView === "chat" ? "hidden lg:flex" : "flex"
          }`}
        >
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
          {activeView === "chat" && (
            <div className="flex-1 overflow-y-auto px-6 py-6 bg-bg-primary">
              {currentRestaurants.length > 0 ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-4">
                  {currentRestaurants.map((r) => (
                    <RestaurantCard
                       key={r.id || r.name}
                       restaurant={r}
                       onClick={() => handleRestaurantClick(r)}
                    />
                  ))}
                </div>
              ) : (
                <div className="flex items-center justify-center h-full text-center">
                  <div>
                    <p className="text-sm font-medium text-text-secondary">
                      Ask Cravely anything
                    </p>
                    <p className="text-xs mt-1 text-text-muted">
                      Restaurant recommendations will appear here
                    </p>
                  </div>
                </div>
              )}
            </div>
          )}
        </div>
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
