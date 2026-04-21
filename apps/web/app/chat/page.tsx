"use client";

import { useState } from "react";
import Header from "@/components/chat/Header";
import ChatPanel from "@/components/chat/ChatPanel";
import SearchPanel from "@/components/chat/SearchPanel";
import MapPanel from "@/components/chat/MapPanel";
import RestaurantSheet from "@/components/chat/RestaurantSheet";
import RestaurantCard from "@/components/chat/RestaurantCard";
import { MessageCircle, Search, Map as MapIcon } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

type View = "chat" | "search" | "map";

const BOTTOM_NAV_TABS: { key: View; label: string; Icon: React.FC<{ className?: string; style?: React.CSSProperties }> }[] = [
  { key: "chat",   label: "Chat",   Icon: MessageCircle },
  { key: "search", label: "Search", Icon: Search },
  { key: "map",    label: "Map",    Icon: MapIcon },
];

export default function ChatPage() {
  const [activeView, setActiveView] = useState<View>("chat");
  const [sheetRestaurant, setSheetRestaurant] = useState<RestaurantResult | null>(null);
  const [currentRestaurants, setCurrentRestaurants] = useState<RestaurantResult[]>([]);
  const [selectedRestaurantId, setSelectedRestaurantId] = useState<string | null>(null);

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
    <div
      className="flex flex-col bg-bg-primary"
      style={{ height: "100dvh" }}
    >
      {/* Header */}
      <Header activeView={activeView} onViewChange={setActiveView} />

      {/* Main content — on mobile add bottom padding for bottom nav */}
      <div
        className="flex-1 flex overflow-hidden"
        style={{ paddingBottom: "0" }}
      >
        {/* Chat panel */}
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

        {/* Right panel */}
        <div
          className={`flex-1 ${
            activeView === "chat" ? "hidden lg:flex" : "flex"
          }`}
        >
          {activeView === "search" && (
            <SearchPanel
              onAskCravely={handleAskCravely}
              onRestaurantClick={handleRestaurantClick}
              onRestaurantsUpdate={setCurrentRestaurants}
              onSelectRestaurant={(id) => { setSelectedRestaurantId(id); setActiveView("map"); }}
            />
          )}
          {activeView === "map" && (
            <MapPanel
              restaurants={currentRestaurants}
              onAskCravely={handleAskCravely}
              selectedRestaurantId={selectedRestaurantId}
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

      {/* Mobile bottom nav — hidden on sm+ (desktop uses Header tabs) */}
      <nav
        className="sm:hidden flex items-center shrink-0"
        style={{
          backgroundColor: "var(--bg-secondary)",
          borderTop: "1px solid var(--border)",
          paddingBottom: "env(safe-area-inset-bottom)",
          height: "calc(56px + env(safe-area-inset-bottom))",
        }}
      >
        {BOTTOM_NAV_TABS.map(({ key, label, Icon }) => (
          <button
            key={key}
            onClick={() => setActiveView(key)}
            className="flex-1 flex flex-col items-center justify-center gap-0.5 cursor-pointer transition-default"
            style={{ height: "56px" }}
          >
            <Icon
              className="w-5 h-5"
              style={{
                color: activeView === key ? "var(--accent)" : "var(--text-muted)",
              }}
            />
            <span
              className="text-[10px] font-medium"
              style={{
                color: activeView === key ? "var(--accent)" : "var(--text-muted)",
              }}
            >
              {label}
            </span>
          </button>
        ))}
      </nav>
    </div>
  );
}
