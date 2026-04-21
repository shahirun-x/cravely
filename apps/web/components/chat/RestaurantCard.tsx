import { Star } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

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
        </div>
      </div>
      <div className="mt-3 w-full py-2 flex items-center justify-center text-xs font-medium cursor-pointer"
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
    </button>
  );
}
