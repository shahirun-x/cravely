"use client";

import { useEffect, useRef, useState } from "react";
import { Share2, Star, X } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";
import { handleShare } from "@/lib/share";

interface RestaurantSheetProps {
  restaurant: RestaurantResult | null;
  onClose: () => void;
  onAskCravely: (name: string) => void;
}

export default function RestaurantSheet({
  restaurant,
  onClose,
  onAskCravely,
}: RestaurantSheetProps) {
  const [visible, setVisible] = useState(false);
  // true on screens narrower than 640px (Tailwind sm breakpoint)
  const [isMobile, setIsMobile] = useState(false);
  const touchStartY = useRef<number | null>(null);
  const sheetRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function check() {
      setIsMobile(window.innerWidth < 640);
    }
    check();
    window.addEventListener("resize", check);
    return () => window.removeEventListener("resize", check);
  }, []);

  useEffect(() => {
    if (restaurant) {
      requestAnimationFrame(() => setVisible(true));
    } else {
      setVisible(false);
    }
  }, [restaurant]);

  function handleClose() {
    setVisible(false);
    setTimeout(onClose, 300);
  }

  // Swipe-down to dismiss on mobile
  function onTouchStart(e: React.TouchEvent) {
    touchStartY.current = e.touches[0].clientY;
  }
  function onTouchEnd(e: React.TouchEvent) {
    if (touchStartY.current === null) return;
    const delta = e.changedTouches[0].clientY - touchStartY.current;
    if (delta > 80) handleClose();
    touchStartY.current = null;
  }

  if (!restaurant) return null;

  const priceSymbol = restaurant.price_range
    ? "₹".repeat(restaurant.price_range)
    : "₹₹";

  // Mobile: slides up from bottom. Desktop: slides in from right.
  const sheetStyle = isMobile
    ? {
        bottom: 0,
        left: 0,
        right: 0,
        top: "auto",
        maxHeight: "92vh",
        width: "100%",
        borderRadius: "24px 24px 0 0",
        borderLeft: "none",
        borderTop: "1px solid var(--border)",
        transform: visible ? "translateY(0)" : "translateY(100%)",
        paddingBottom: "env(safe-area-inset-bottom)",
      }
    : {
        right: 0,
        top: 0,
        bottom: 0,
        left: "auto",
        width: "100%",
        maxWidth: "448px",
        borderRadius: 0,
        borderLeft: "1px solid var(--border)",
        transform: visible ? "translateX(0)" : "translateX(100%)",
      };

  return (
    <>
      {/* Backdrop */}
      <div
        className="fixed inset-0 z-40 transition-opacity duration-300"
        style={{
          backgroundColor: "rgba(0,0,0,0.5)",
          opacity: visible ? 1 : 0,
        }}
        onClick={handleClose}
      />

      {/* Sheet */}
      <div
        ref={sheetRef}
        className="fixed z-50 overflow-y-auto transition-transform duration-300"
        style={{
          backgroundColor: "var(--bg-secondary)",
          WebkitOverflowScrolling: "touch",
          ...sheetStyle,
        }}
        onTouchStart={isMobile ? onTouchStart : undefined}
        onTouchEnd={isMobile ? onTouchEnd : undefined}
      >
        {/* Mobile drag handle */}
        {isMobile && (
          <div className="flex justify-center pt-3 pb-1 shrink-0">
            <div
              className="w-12 h-1 rounded-full"
              style={{ backgroundColor: "var(--border)" }}
            />
          </div>
        )}

        {/* Header */}
        <div
          className="sticky top-0 z-10 flex items-center justify-between p-5"
          style={{
            backgroundColor: "var(--bg-secondary)",
            borderBottom: "1px solid var(--border)",
          }}
        >
          <h2 className="text-xl font-bold text-text-primary pr-4 leading-tight">
            {restaurant.name}
          </h2>
          <button
            onClick={handleClose}
            className="flex items-center justify-center cursor-pointer transition-default shrink-0"
            style={{
              width: "36px",
              height: "36px",
              minHeight: "unset",
              minWidth: "unset",
              backgroundColor: "var(--bg-elevated)",
              border: "1px solid var(--border)",
              borderRadius: "50%",
            }}
          >
            <X className="w-4 h-4 text-text-secondary" />
          </button>
        </div>

        <div className="p-5 space-y-5">
          {/* Tags row */}
          <div className="flex items-center gap-2 flex-wrap">
            <span
              className="text-sm px-3 py-1.5 text-text-muted"
              style={{
                backgroundColor: "var(--bg-elevated)",
                borderRadius: "var(--radius-sm)",
              }}
            >
              {restaurant.neighborhood}
            </span>
            {restaurant.cuisines?.map((c) => (
              <span
                key={c}
                className="text-sm px-3 py-1.5 text-text-muted"
                style={{
                  backgroundColor: "var(--bg-elevated)",
                  borderRadius: "var(--radius-sm)",
                }}
              >
                {c}
              </span>
            ))}
          </div>

          {/* Rating row */}
          <div className="flex items-center gap-4 flex-wrap">
            {restaurant.avg_rating && (
              <div className="flex items-center gap-1.5">
                <Star className="w-4 h-4 fill-star text-star" />
                <span className="text-lg font-semibold text-text-primary">
                  {restaurant.avg_rating}
                </span>
                <span className="text-sm text-text-muted">rating</span>
              </div>
            )}
            <span className="text-sm font-medium text-text-muted">
              {priceSymbol}
            </span>
            <span className="flex items-center gap-1.5 text-sm">
              <span
                className="w-2 h-2 rounded-full"
                style={{
                  backgroundColor: restaurant.is_pure_veg
                    ? "var(--veg)"
                    : "var(--non-veg)",
                }}
              />
              <span
                style={{
                  color: restaurant.is_pure_veg ? "var(--veg)" : "var(--non-veg)",
                }}
              >
                {restaurant.is_pure_veg ? "Pure Veg" : "Non-Veg"}
              </span>
            </span>
          </div>

          {/* Description */}
          {restaurant.description && (
            <p className="text-sm leading-relaxed text-text-secondary">
              {restaurant.description}
            </p>
          )}

          {/* Address */}
          {restaurant.address && (
            <div>
              <h3 className="label-text mb-1">Address</h3>
              <p className="text-sm text-text-primary">{restaurant.address}</p>
            </div>
          )}

          {/* Top dishes */}
          {restaurant.top_dishes && restaurant.top_dishes.length > 0 && (
            <div>
              <h3 className="label-text mb-2">Popular Dishes</h3>
              <div className="space-y-2">
                {restaurant.top_dishes.slice(0, 6).map((dish) => (
                  <div
                    key={dish}
                    className="flex items-center justify-between py-2 px-3"
                    style={{
                      backgroundColor: "var(--bg-card)",
                      border: "1px solid var(--border)",
                      borderRadius: "var(--radius-sm)",
                    }}
                  >
                    <span className="text-sm text-text-primary">{dish}</span>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Menu items */}
          {restaurant.menu_items && restaurant.menu_items.length > 0 && (
            <div>
              <h3 className="label-text mb-2">Menu</h3>
              <div className="space-y-2">
                {restaurant.menu_items.slice(0, 8).map((item, i) => (
                  <div
                    key={i}
                    className="flex items-start justify-between py-3 px-3"
                    style={{
                      backgroundColor: "var(--bg-card)",
                      border: "1px solid var(--border)",
                      borderRadius: "var(--radius-sm)",
                    }}
                  >
                    <div className="flex items-start gap-2">
                      <span
                        className="w-2 h-2 rounded-full mt-1.5 shrink-0"
                        style={{
                          backgroundColor: item.is_veg
                            ? "var(--veg)"
                            : "var(--non-veg)",
                        }}
                      />
                      <div>
                        <p className="text-sm font-medium text-text-primary">
                          {item.name}
                        </p>
                        {item.description && (
                          <p className="text-xs mt-0.5 text-text-secondary">
                            {item.description}
                          </p>
                        )}
                      </div>
                    </div>
                    <span
                      className="text-sm font-semibold shrink-0 ml-3"
                      style={{ color: "var(--accent)" }}
                    >
                      ₹{item.price}
                    </span>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Ordering links */}
          <div className="flex gap-3">
            {restaurant.zomato_url && (
              <a
                href={restaurant.zomato_url}
                target="_blank"
                rel="noopener noreferrer"
                className="flex-1 py-3 text-center text-sm font-semibold text-white transition-default"
                style={{
                  backgroundColor: "var(--accent)",
                  borderRadius: "var(--radius-md)",
                  minHeight: "44px",
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                }}
              >
                Zomato
              </a>
            )}
            {restaurant.swiggy_url && (
              <a
                href={restaurant.swiggy_url}
                target="_blank"
                rel="noopener noreferrer"
                className="flex-1 py-3 text-center text-sm font-semibold transition-default"
                style={{
                  backgroundColor: "var(--bg-elevated)",
                  border: "1px solid var(--border)",
                  color: "var(--text-primary)",
                  borderRadius: "var(--radius-md)",
                  minHeight: "44px",
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                }}
              >
                Swiggy
              </a>
            )}
          </div>

          {/* Ask Cravely */}
          <button
            onClick={() => onAskCravely(restaurant.name)}
            className="w-full py-3 text-sm font-medium cursor-pointer transition-default"
            style={{
              backgroundColor: "var(--accent-muted)",
              color: "var(--accent)",
              borderRadius: "var(--radius-md)",
              minHeight: "44px",
            }}
          >
            Ask Cravely about this place
          </button>

          {/* Share */}
          <button
            onClick={() => handleShare(restaurant)}
            className="w-full py-3 text-sm font-medium cursor-pointer transition-default flex items-center justify-center gap-2"
            style={{
              backgroundColor: "var(--bg-elevated)",
              border: "1px solid var(--border)",
              color: "var(--text-secondary)",
              borderRadius: "var(--radius-md)",
              minHeight: "44px",
            }}
          >
            <Share2 className="w-4 h-4" />
            Share
          </button>
        </div>
      </div>
    </>
  );
}
