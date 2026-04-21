"use client";

import { useState } from "react";
import { SlidersHorizontal, X } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";
import RestaurantCard from "@/components/chat/RestaurantCard";

const NEIGHBORHOODS = [
  "Adyar",
  "T Nagar",
  "Anna Nagar",
  "OMR",
  "Velachery",
  "Nungambakkam",
];
const CUISINES = [
  "South Indian",
  "North Indian",
  "Chinese",
  "Continental",
  "Bakery & Cafe",
  "Chettinad",
  "Street Food",
];

interface SearchPanelProps {
  onAskCravely: (name: string) => void;
  onRestaurantClick?: (restaurant: RestaurantResult) => void;
  onRestaurantsUpdate?: (restaurants: RestaurantResult[]) => void;
  onSelectRestaurant?: (id: string) => void;
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
      style={{ minHeight: "44px" }}
    >
      <span
        className="w-4 h-4 rounded flex items-center justify-center shrink-0 transition-default"
        style={{
          backgroundColor: checked ? "var(--accent)" : "var(--bg-elevated)",
          border: `1px solid ${checked ? "var(--accent)" : "var(--border)"}`,
        }}
      >
        {checked && (
          <svg width="10" height="8" viewBox="0 0 10 8" fill="none">
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
        <div className="h-4 rounded w-3/4" style={{ backgroundColor: "var(--bg-elevated)" }} />
        <div className="h-3 rounded w-1/2" style={{ backgroundColor: "var(--bg-elevated)" }} />
        <div className="h-8 rounded w-full mt-3" style={{ backgroundColor: "var(--bg-elevated)" }} />
      </div>
    </div>
  );
}

function FilterContent({
  neighborhood, setNeighborhood,
  cuisine, setCuisine,
  priceRange, setPriceRange,
  vegOnly, setVegOnly,
  loading, onSearch,
}: {
  neighborhood: string | null;
  setNeighborhood: (v: string | null) => void;
  cuisine: string | null;
  setCuisine: (v: string | null) => void;
  priceRange: number | null;
  setPriceRange: (v: number | null) => void;
  vegOnly: boolean;
  setVegOnly: (v: boolean) => void;
  loading: boolean;
  onSearch: () => void;
}) {
  return (
    <div className="space-y-5">
      <div>
        <h3 className="label-text mb-3">Neighborhood</h3>
        <div className="space-y-1">
          {NEIGHBORHOODS.map((n) => (
            <CustomCheckbox
              key={n}
              checked={neighborhood === n}
              onChange={() => setNeighborhood(neighborhood === n ? null : n)}
              label={n}
            />
          ))}
        </div>
      </div>

      <div>
        <h3 className="label-text mb-3">Cuisine</h3>
        <div className="space-y-1">
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

      <div>
        <h3 className="label-text mb-3">Price Range</h3>
        <div className="space-y-1">
          {[
            { v: 1, label: "Budget ₹" },
            { v: 2, label: "Mid-range ₹₹" },
            { v: 3, label: "Premium ₹₹₹" },
          ].map(({ v, label }) => (
            <CustomCheckbox
              key={v}
              checked={priceRange === v}
              onChange={() => setPriceRange(priceRange === v ? null : v)}
              label={label}
            />
          ))}
        </div>
      </div>

      <div>
        <label className="flex items-center gap-2.5 text-sm cursor-pointer text-text-secondary" style={{ minHeight: "44px" }}>
          <button
            onClick={() => setVegOnly(!vegOnly)}
            className="w-10 h-5 rounded-full relative transition-default cursor-pointer"
            style={{
              backgroundColor: vegOnly ? "var(--veg)" : "var(--border)",
              minHeight: "unset",
              minWidth: "unset",
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

      <button
        onClick={onSearch}
        disabled={loading}
        className="w-full py-3 text-sm font-semibold text-white cursor-pointer transition-default disabled:opacity-60"
        style={{
          backgroundColor: "var(--accent)",
          borderRadius: "var(--radius-md)",
          minHeight: "44px",
        }}
      >
        {loading ? "Searching..." : "Search"}
      </button>
    </div>
  );
}

export default function SearchPanel({
  onAskCravely: _onAskCravely,
  onRestaurantClick,
  onRestaurantsUpdate,
  onSelectRestaurant,
}: SearchPanelProps) {
  const [neighborhood, setNeighborhood] = useState<string | null>(null);
  const [cuisine, setCuisine] = useState<string | null>(null);
  const [priceRange, setPriceRange] = useState<number | null>(null);
  const [vegOnly, setVegOnly] = useState(false);
  const [results, setResults] = useState<RestaurantResult[]>([]);
  const [loading, setLoading] = useState(false);
  const [searched, setSearched] = useState(false);
  const [drawerOpen, setDrawerOpen] = useState(false);

  async function handleSearch() {
    setLoading(true);
    setSearched(true);
    setDrawerOpen(false);

    try {
      const searchParams = new URLSearchParams();
      if (neighborhood) searchParams.append("neighborhood", neighborhood);
      if (cuisine) searchParams.append("cuisine", cuisine);

      const res = await fetch(
        `${process.env.NEXT_PUBLIC_API_URL || "http://localhost:8000"}/search?${searchParams.toString()}`
      );

      if (res.ok) {
        const data = await res.json();
        setResults(data || []);
        if (onRestaurantsUpdate) {
          onRestaurantsUpdate(data || []);
        }
      }
    } catch {
      setResults([]);
    } finally {
      setLoading(false);
    }
  }

  const filteredResults = vegOnly ? results.filter((r) => r.is_pure_veg) : results;

  const filterProps = {
    neighborhood, setNeighborhood,
    cuisine, setCuisine,
    priceRange, setPriceRange,
    vegOnly, setVegOnly,
    loading,
    onSearch: handleSearch,
  };

  const activeFilterCount = [neighborhood, cuisine, priceRange !== null ? priceRange : null, vegOnly || null]
    .filter(Boolean).length;

  return (
    <div className="flex h-full bg-bg-primary">
      {/* Desktop filter sidebar */}
      <div
        className="w-[240px] shrink-0 overflow-y-auto p-4 hidden md:block"
        style={{
          backgroundColor: "var(--bg-secondary)",
          borderRight: "1px solid var(--border)",
        }}
      >
        <FilterContent {...filterProps} />
      </div>

      {/* Results area */}
      <div
        className="flex-1 overflow-y-auto p-4"
        style={{ WebkitOverflowScrolling: "touch" }}
      >
        {/* Mobile top bar: filter button + search all */}
        <div className="md:hidden flex items-center gap-2 mb-4">
          <button
            onClick={() => setDrawerOpen(true)}
            className="flex items-center gap-2 px-4 text-sm font-medium cursor-pointer transition-default"
            style={{
              backgroundColor: "var(--bg-elevated)",
              border: activeFilterCount > 0 ? "1px solid var(--accent)" : "1px solid var(--border)",
              color: activeFilterCount > 0 ? "var(--accent)" : "var(--text-secondary)",
              borderRadius: "var(--radius-md)",
              height: "44px",
            }}
          >
            <SlidersHorizontal className="w-4 h-4" />
            Filters
            {activeFilterCount > 0 && (
              <span
                className="w-5 h-5 rounded-full text-[11px] font-bold flex items-center justify-center text-white"
                style={{ backgroundColor: "var(--accent)" }}
              >
                {activeFilterCount}
              </span>
            )}
          </button>
          <button
            onClick={handleSearch}
            disabled={loading}
            className="flex-1 text-sm font-semibold text-white cursor-pointer transition-default disabled:opacity-60"
            style={{
              backgroundColor: "var(--accent)",
              borderRadius: "var(--radius-md)",
              height: "44px",
            }}
          >
            {loading ? "Searching..." : "Search All"}
          </button>
        </div>

        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {[1, 2, 3, 4].map((i) => <SkeletonCard key={i} />)}
          </div>
        ) : filteredResults.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {filteredResults.map((r) => (
              <RestaurantCard
                key={r.id || r.name}
                restaurant={r}
                onClick={() => { onRestaurantClick?.(r); onSelectRestaurant?.(r.id); }}
              />
            ))}
          </div>
        ) : (
          <div className="flex flex-col items-center justify-center h-full text-center">
            <p className="text-sm font-medium text-text-secondary">
              {searched ? "No restaurants found" : "Use filters to discover restaurants"}
            </p>
            <p className="text-xs mt-1 text-text-muted">
              {searched
                ? "Try adjusting your filters"
                : "Select a neighborhood, cuisine, or price range"}
            </p>
          </div>
        )}
      </div>

      {/* Mobile filter bottom drawer */}
      {drawerOpen && (
        <>
          <div
            className="md:hidden fixed inset-0 z-40"
            style={{ backgroundColor: "rgba(0,0,0,0.5)" }}
            onClick={() => setDrawerOpen(false)}
          />
          <div
            className="md:hidden fixed left-0 right-0 bottom-0 z-50 overflow-y-auto"
            style={{
              maxHeight: "80vh",
              backgroundColor: "var(--bg-secondary)",
              borderTop: "1px solid var(--border)",
              borderRadius: "24px 24px 0 0",
              paddingBottom: "env(safe-area-inset-bottom)",
            }}
          >
            {/* Handle */}
            <div className="flex justify-center pt-3 pb-2 shrink-0">
              <div className="w-12 h-1 rounded-full" style={{ backgroundColor: "var(--border)" }} />
            </div>
            {/* Close row */}
            <div className="flex items-center justify-between px-4 pb-3"
              style={{ borderBottom: "1px solid var(--border)" }}>
              <span className="text-base font-semibold text-text-primary">Filters</span>
              <button
                onClick={() => setDrawerOpen(false)}
                className="flex items-center justify-center cursor-pointer"
                style={{
                  width: "36px",
                  height: "36px",
                  minHeight: "unset",
                  minWidth: "unset",
                  color: "var(--text-muted)",
                }}
              >
                <X className="w-5 h-5" />
              </button>
            </div>
            <div className="p-4">
              <FilterContent {...filterProps} />
            </div>
          </div>
        </>
      )}
    </div>
  );
}
