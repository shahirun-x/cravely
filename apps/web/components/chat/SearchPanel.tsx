"use client";

import { useState } from "react";
import { Star } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

const NEIGHBORHOODS = [
  "T. Nagar",
  "Adyar",
  "Mylapore",
  "Anna Nagar",
  "OMR",
  "Nungambakkam",
];
const CUISINES = [
  "South Indian",
  "North Indian",
  "Chinese",
  "Chettinad",
  "Biryani",
  "Seafood",
  "Italian",
];

interface SearchPanelProps {
  onAskCravely: (name: string) => void;
  onRestaurantClick?: (restaurant: RestaurantResult) => void;
}

function CustomCheckbox({
  checked,
  onChange,
  label,
}: {
  checked: boolean;
  onChange: () => void;
  label: string;
}) {
  return (
    <button
      type="button"
      onClick={onChange}
      className="flex items-center gap-2.5 text-sm cursor-pointer text-text-secondary hover:text-text-primary transition-default w-full text-left"
    >
      <span
        className="w-4 h-4 rounded flex items-center justify-center shrink-0 transition-default"
        style={{
          backgroundColor: checked ? "var(--accent)" : "var(--bg-elevated)",
          border: `1px solid ${checked ? "var(--accent)" : "var(--border)"}`,
        }}
      >
        {checked && (
          <svg
            width="10"
            height="8"
            viewBox="0 0 10 8"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M1 4L3.5 6.5L9 1"
              stroke="white"
              strokeWidth="1.5"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </svg>
        )}
      </span>
      {label}
    </button>
  );
}

function ResultCard({
  restaurant,
  onAsk,
  onClick,
}: {
  restaurant: RestaurantResult;
  onAsk: () => void;
  onClick: () => void;
}) {
  const priceSymbol = restaurant.price_range
    ? "₹".repeat(restaurant.price_range)
    : "₹₹";

  return (
    <div
      className="overflow-hidden transition-default"
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
      {/* Photo placeholder — gradient */}
      <div
        className="h-32 cursor-pointer"
        onClick={onClick}
        style={{
          background:
            "linear-gradient(135deg, var(--bg-elevated) 0%, var(--bg-card) 100%)",
        }}
      />
      <div className="p-4">
        <div className="flex items-start justify-between gap-2">
          <h3
            className="font-semibold text-[15px] truncate cursor-pointer text-text-primary"
            onClick={onClick}
          >
            {restaurant.name}
          </h3>
          <div className="flex items-center gap-1.5 shrink-0">
            {restaurant.avg_rating && (
              <span className="flex items-center gap-1 text-[13px] text-text-secondary">
                <Star className="w-3.5 h-3.5 fill-star text-star" />
                {restaurant.avg_rating}
              </span>
            )}
            <span
              className="w-2 h-2 rounded-full"
              style={{
                backgroundColor: restaurant.is_pure_veg
                  ? "var(--veg)"
                  : "var(--non-veg)",
              }}
            />
          </div>
        </div>

        <div className="flex items-center gap-1.5 mt-1.5 flex-wrap">
          <span
            className="text-[11px] px-2.5 py-1 text-text-muted"
            style={{
              backgroundColor: "var(--bg-elevated)",
              borderRadius: "var(--radius-sm)",
            }}
          >
            {restaurant.neighborhood}
          </span>
          <span className="text-[13px] text-text-muted">{priceSymbol}</span>
        </div>

        <div className="flex gap-1 mt-2 flex-wrap">
          {restaurant.cuisines?.slice(0, 3).map((c) => (
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

        <button
          onClick={onAsk}
          className="mt-3 w-full py-2 text-xs font-medium cursor-pointer transition-default"
          style={{
            backgroundColor: "var(--accent-muted)",
            color: "var(--accent)",
            borderRadius: "var(--radius-sm)",
          }}
        >
          Ask Cravely
        </button>
      </div>
    </div>
  );
}

function SkeletonCard() {
  return (
    <div
      className="overflow-hidden animate-pulse"
      style={{
        backgroundColor: "var(--bg-card)",
        border: "1px solid var(--border)",
        borderRadius: "var(--radius-md)",
      }}
    >
      <div className="h-32" style={{ backgroundColor: "var(--bg-elevated)" }} />
      <div className="p-4 space-y-2">
        <div
          className="h-4 rounded w-3/4"
          style={{ backgroundColor: "var(--bg-elevated)" }}
        />
        <div
          className="h-3 rounded w-1/2"
          style={{ backgroundColor: "var(--bg-elevated)" }}
        />
        <div
          className="h-8 rounded w-full mt-3"
          style={{ backgroundColor: "var(--bg-elevated)" }}
        />
      </div>
    </div>
  );
}

export default function SearchPanel({
  onAskCravely,
  onRestaurantClick,
}: SearchPanelProps) {
  const [neighborhood, setNeighborhood] = useState<string | null>(null);
  const [cuisine, setCuisine] = useState<string | null>(null);
  const [priceRange, setPriceRange] = useState<number | null>(null);
  const [vegOnly, setVegOnly] = useState(false);
  const [results, setResults] = useState<RestaurantResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [searched, setSearched] = useState(false);

  async function handleSearch() {
    setLoading(true);
    setSearched(true);

    try {
      const parts: string[] = [];
      if (vegOnly) parts.push("vegetarian");
      if (priceRange === 1) parts.push("cheap");
      if (priceRange === 3) parts.push("premium");
      if (cuisine) parts.push(cuisine);
      parts.push("restaurants");
      if (neighborhood) parts.push(`in ${neighborhood}`);

      const query = parts.join(" ") || "restaurants";

      const res = await fetch(
        `${process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000"}/api/v1/chat`,
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            message: query,
            session_id: crypto.randomUUID(),
            channel: "web",
            city: "Chennai",
          }),
        }
      );

      if (res.ok) {
        const data = await res.json();
        setResults(data.restaurants || []);
      }
    } catch {
      setResults([]);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="flex h-full bg-bg-primary">
      {/* Filter sidebar */}
      <div
        className="w-[240px] shrink-0 overflow-y-auto p-4 space-y-5 hidden md:block"
        style={{
          backgroundColor: "var(--bg-secondary)",
          borderRight: "1px solid var(--border)",
        }}
      >
        {/* Neighborhood */}
        <div>
          <h3 className="label-text mb-3">Neighborhood</h3>
          <div className="space-y-2">
            {NEIGHBORHOODS.map((n) => (
              <CustomCheckbox
                key={n}
                checked={neighborhood === n}
                onChange={() =>
                  setNeighborhood(neighborhood === n ? null : n)
                }
                label={n}
              />
            ))}
          </div>
        </div>

        {/* Cuisine */}
        <div>
          <h3 className="label-text mb-3">Cuisine</h3>
          <div className="space-y-2">
            {CUISINES.map((c) => (
              <CustomCheckbox
                key={c}
                checked={cuisine === c}
                onChange={() => setCuisine(cuisine === c ? null : c)}
                label={c}
              />
            ))}
          </div>
        </div>

        {/* Price Range */}
        <div>
          <h3 className="label-text mb-3">Price Range</h3>
          <div className="space-y-2">
            {[
              { v: 1, label: "Budget ₹" },
              { v: 2, label: "Mid-range ₹₹" },
              { v: 3, label: "Premium ₹₹₹" },
            ].map(({ v, label }) => (
              <CustomCheckbox
                key={v}
                checked={priceRange === v}
                onChange={() =>
                  setPriceRange(priceRange === v ? null : v)
                }
                label={label}
              />
            ))}
          </div>
        </div>

        {/* Veg toggle */}
        <div>
          <label className="flex items-center gap-2.5 text-sm cursor-pointer text-text-secondary">
            <button
              onClick={() => setVegOnly(!vegOnly)}
              className="w-10 h-5 rounded-full relative transition-default cursor-pointer"
              style={{
                backgroundColor: vegOnly
                  ? "var(--veg)"
                  : "var(--border)",
              }}
            >
              <div
                className="w-4 h-4 rounded-full bg-white absolute top-0.5 transition-all"
                style={{ left: vegOnly ? "22px" : "2px" }}
              />
            </button>
            Veg Only
          </label>
        </div>

        {/* Search button */}
        <button
          onClick={handleSearch}
          disabled={loading}
          className="w-full py-2.5 text-sm font-semibold text-white cursor-pointer transition-default disabled:opacity-60"
          style={{
            backgroundColor: "var(--accent)",
            borderRadius: "var(--radius-md)",
          }}
        >
          {loading ? "Searching..." : "Search"}
        </button>
      </div>

      {/* Results grid */}
      <div className="flex-1 overflow-y-auto p-4">
        {/* Mobile filters bar */}
        <div className="md:hidden mb-4 flex gap-2 flex-wrap">
          <button
            onClick={handleSearch}
            disabled={loading}
            className="px-4 py-2 text-sm font-semibold text-white cursor-pointer"
            style={{
              backgroundColor: "var(--accent)",
              borderRadius: "var(--radius-md)",
            }}
          >
            {loading ? "Searching..." : "Search All"}
          </button>
        </div>

        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {[1, 2, 3, 4].map((i) => (
              <SkeletonCard key={i} />
            ))}
          </div>
        ) : results.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {results.map((r) => (
              <ResultCard
                key={r.id || r.name}
                restaurant={r}
                onAsk={() => onAskCravely(r.name)}
                onClick={() => onRestaurantClick?.(r)}
              />
            ))}
          </div>
        ) : (
          <div className="flex flex-col items-center justify-center h-full text-center">
            <p className="text-sm font-medium text-text-secondary">
              {searched
                ? "No restaurants found"
                : "Use filters to discover restaurants"}
            </p>
            <p className="text-xs mt-1 text-text-muted">
              {searched
                ? "Try adjusting your filters"
                : "Select a neighborhood, cuisine, or price range"}
            </p>
          </div>
        )}
      </div>
    </div>
  );
}
