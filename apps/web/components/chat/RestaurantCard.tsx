import { Share2, Star } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";
import { handleShare } from "@/lib/share";

function isOpenNow(
  openingHours: RestaurantResult["opening_hours"]
): boolean | null {
  if (!openingHours) return null;
  const now = new Date();
  const day = now.getDay();
  const time = now.getHours() * 100 + now.getMinutes();
  const todayKey = String(day);
  const todayHours = openingHours[todayKey];
  if (!todayHours) return null;
  if (todayHours.close < todayHours.open) {
    return time >= todayHours.open || time <= todayHours.close;
  }
  return time >= todayHours.open && time <= todayHours.close;
}

export default function RestaurantCard({
  restaurant,
  onClick,
}: {
  restaurant: RestaurantResult;
  onClick: () => void;
}) {
  const priceSymbol = restaurant.price_range
    ? "₹".repeat(restaurant.price_range)
    : "₹₹";

  const openStatus = isOpenNow(restaurant.opening_hours ?? null);

  return (
    <button
      onClick={onClick}
      className="w-full text-left p-4 transition-default cursor-pointer group"
      style={{
        backgroundColor: "var(--bg-card)",
        border: "1px solid var(--border)",
        borderRadius: "var(--radius-md)",
        touchAction: "manipulation",
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
          {/* Veg dot + name */}
          <div className="flex items-center gap-2">
            <span
              className="w-2 h-2 rounded-full shrink-0"
              style={{
                backgroundColor: restaurant.is_pure_veg
                  ? "var(--veg)"
                  : "var(--non-veg)",
              }}
            />
            <h4 className="font-semibold text-[15px] truncate text-text-primary">
              {restaurant.name}
            </h4>
          </div>

          {/* Tags — horizontal scroll, no wrap */}
          <div
            className="flex items-center gap-2 mt-1.5 overflow-x-auto"
            style={{ scrollbarWidth: "none", msOverflowStyle: "none" }}
          >
            <span
              className="text-[11px] px-2.5 py-1 text-text-muted shrink-0"
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
                className="text-[11px] px-2.5 py-1 text-text-muted shrink-0"
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

        {/* Right column: rating + price + open badge */}
        <div className="flex flex-col items-end gap-1 shrink-0">
          {restaurant.avg_rating && (
            <span className="flex items-center gap-1 text-[13px] text-text-secondary">
              <Star className="w-3.5 h-3.5 fill-star text-star" />
              {restaurant.avg_rating}
            </span>
          )}
          <span className="text-[13px] text-text-muted">{priceSymbol}</span>
          {openStatus !== null && (
            <span
              className="text-[10px] font-semibold px-1.5 py-0.5"
              style={{
                backgroundColor: openStatus
                  ? "rgba(74,222,128,0.15)"
                  : "rgba(239,68,68,0.15)",
                color: openStatus ? "#4ade80" : "#f87171",
                borderRadius: "var(--radius-sm)",
              }}
            >
              {openStatus ? "Open" : "Closed"}
            </span>
          )}
        </div>
      </div>

      {/* Action row */}
      <div className="mt-3 flex gap-2">
        <div
          className="flex-1 py-2 flex items-center justify-center text-xs font-medium cursor-pointer"
          style={{
            backgroundColor: "var(--accent-muted)",
            color: "var(--accent)",
            borderRadius: "var(--radius-sm)",
            minHeight: "36px",
          }}
          onClick={(e) => {
            e.stopPropagation();
            onClick();
          }}
        >
          View Details
        </div>
        <div
          className="py-2 px-3 flex items-center justify-center cursor-pointer transition-default"
          style={{
            backgroundColor: "var(--bg-elevated)",
            color: "var(--text-muted)",
            borderRadius: "var(--radius-sm)",
            minHeight: "36px",
            minWidth: "36px",
          }}
          onClick={(e) => {
            e.stopPropagation();
            handleShare(restaurant);
          }}
          title="Share"
        >
          <Share2 className="w-3.5 h-3.5" />
        </div>
      </div>
    </button>
  );
}
