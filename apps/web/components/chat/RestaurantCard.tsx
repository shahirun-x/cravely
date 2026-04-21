import { Share2, Star } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

function isOpenNow(
  openingHours: RestaurantResult["opening_hours"]
): boolean | null {
  if (!openingHours) return null;
  const now = new Date();
  // getDay() returns 0=Sunday..6=Saturday, matching Google's period.day
  const day = now.getDay();
  const time = now.getHours() * 100 + now.getMinutes();
  const todayKey = String(day);
  const todayHours = openingHours[todayKey];
  if (!todayHours) return null;
  // Handle midnight-spanning ranges (close < open means closing past midnight)
  if (todayHours.close < todayHours.open) {
    return time >= todayHours.open || time <= todayHours.close;
  }
  return time >= todayHours.open && time <= todayHours.close;
}

function handleShare(restaurant: RestaurantResult) {
  const text =
    `Check out ${restaurant.name} on Cravely!\n` +
    `${restaurant.neighborhood} | ` +
    `${restaurant.is_pure_veg ? "Veg" : "Non-veg"} | ` +
    `⭐${restaurant.avg_rating ?? "N/A"}\n` +
    `Discover more at https://cravely-six.vercel.app`;

  if (navigator.share) {
    navigator.share({ text });
  } else {
    window.open(`https://wa.me/?text=${encodeURIComponent(text)}`, "_blank");
  }
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
          {(() => {
            const open = isOpenNow(restaurant.opening_hours ?? null);
            if (open === null) return null;
            return (
              <span
                className="text-[10px] font-semibold px-1.5 py-0.5"
                style={{
                  backgroundColor: open
                    ? "rgba(74,222,128,0.15)"
                    : "rgba(239,68,68,0.15)",
                  color: open ? "#4ade80" : "#f87171",
                  borderRadius: "var(--radius-sm)",
                }}
              >
                {open ? "Open" : "Closed"}
              </span>
            );
          })()}
        </div>
      </div>
      <div className="mt-3 flex gap-2">
        <div
          className="flex-1 py-2 flex items-center justify-center text-xs font-medium cursor-pointer"
          style={{
            backgroundColor: "var(--accent-muted)",
            color: "var(--accent)",
            borderRadius: "var(--radius-sm)",
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
