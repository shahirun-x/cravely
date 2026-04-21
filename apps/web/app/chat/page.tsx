"use client";

import { useState } from "react";
import Header from "@/components/chat/Header";
import ChatPanel from "@/components/chat/ChatPanel";
import SearchPanel from "@/components/chat/SearchPanel";
import MapPanel from "@/components/chat/MapPanel";
import RestaurantSheet from "@/components/chat/RestaurantSheet";
import { MessageSquare, Search, MapIcon, Star } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

type View = "chat" | "search" | "map";

function RestaurantCard({
  restaurant,
  onClick,
}: {
  restaurant: RestaurantResult;
  onClick: () => void;
}) {
  const priceSymbol = restaurant.price_range
    ? "₹".repeat(restaurant.price_range)
    : "₹₹";

  return (
    <button
      onClick={onClick}
      className="w-full text-left p-4 transition-default cursor-pointer group"
      style={{
        backgroundColor: "var(--bg-card)",
        border: "1px solid var(--border)",
        borderRadius: "var(--radius-md)",
      }}
      onMouseEnter={(e) =>
        (e.currentTarget.style.borderColor = "rgba(255, 107, 53, 0.3)")
      }
      onMouseLeave={(e) =>
        (e.currentTarget.style.borderColor = "var(--border)")
      }
    >
      <div className="flex items-start justify-between gap-2">
        <div className="min-w-0 flex-1">
          <h4 className="font-semibold text-[15px] truncate text-text-primary">
            {restaurant.name}
          </h4>
          <div className="flex items-center gap-2 mt-1.5 flex-wrap">
            <span
              className="text-[11px] px-2.5 py-1 text-text-muted"
              style={{
                backgroundColor: "var(--bg-elevated)",
                borderRadius: "var(--radius-sm)",
              }}
            >
              {restaurant.neighborhood}
            </span>
            {restaurant.cuisines?.slice(0, 2).map((c) => (
              <span
                key={c}
                className="text-[11px] px-2.5 py-1 text-text-muted"
                style={{
                  backgroundColor: "var(--bg-elevated)",
                  borderRadius: "var(--radius-sm)",
                }}
              >
                {c}
              </span>
            ))}
          </div>
        </div>
        <div className="flex flex-col items-end gap-1 shrink-0">
          {restaurant.avg_rating && (
            <span className="flex items-center gap-1 text-[13px] text-text-secondary">
              <Star className="w-3.5 h-3.5 fill-star text-star" />
              {restaurant.avg_rating}
            </span>
          )}
          <span className="text-[13px] text-text-muted">{priceSymbol}</span>
          <span className="flex items-center gap-1.5">
            <span
              className="w-2 h-2 rounded-full"
              style={{
                backgroundColor: restaurant.is_pure_veg
                  ? "var(--veg)"
                  : "var(--non-veg)",
              }}
            />
            <span className="text-xs text-text-muted">
              {restaurant.is_pure_veg ? "Veg" : "Non-veg"}
            </span>
          </span>
        </div>
      </div>
    </button>
  );
}

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
