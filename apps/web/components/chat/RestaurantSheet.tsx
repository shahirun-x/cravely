"use client";

import { useEffect, useState } from "react";
import { X, Star } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

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

  if (!restaurant) return null;

  const priceSymbol = restaurant.price_range
    ? "₹".repeat(restaurant.price_range)
    : "₹₹";

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
        className="fixed right-0 top-0 bottom-0 z-50 w-full max-w-md overflow-y-auto transition-transform duration-300"
        style={{
          backgroundColor: "var(--bg-secondary)",
          borderLeft: "1px solid var(--border)",
          transform: visible ? "translateX(0)" : "translateX(100%)",
        }}
      >
        {/* Header */}
        <div
          className="sticky top-0 z-10 flex items-center justify-between p-5"
          style={{
            backgroundColor: "var(--bg-secondary)",
            borderBottom: "1px solid var(--border)",
          }}
        >
          <h2 className="text-2xl font-bold text-text-primary">
            {restaurant.name}
          </h2>
          <button
            onClick={handleClose}
            className="w-8 h-8 rounded-full flex items-center justify-center cursor-pointer transition-default"
            style={{
              backgroundColor: "var(--bg-elevated)",
              border: "1px solid var(--border)",
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
          <div className="flex items-center gap-4">
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
                  color: restaurant.is_pure_veg
                    ? "var(--veg)"
                    : "var(--non-veg)",
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
              <p className="text-sm text-text-primary">
                {restaurant.address}
              </p>
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
                    <span className="text-sm text-text-primary">
                      {dish}
                    </span>
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
                className="flex-1 py-2.5 text-center text-sm font-semibold text-white transition-default"
                style={{
                  backgroundColor: "var(--accent)",
                  borderRadius: "var(--radius-md)",
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
                className="flex-1 py-2.5 text-center text-sm font-semibold transition-default"
                style={{
                  backgroundColor: "var(--bg-elevated)",
                  border: "1px solid var(--border)",
                  color: "var(--text-primary)",
                  borderRadius: "var(--radius-md)",
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
            }}
          >
            Ask Cravely about this place
          </button>
        </div>
      </div>
    </>
  );
}
