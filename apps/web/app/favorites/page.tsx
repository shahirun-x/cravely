"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { ArrowLeft, Heart } from "lucide-react";
import { createClient } from "@/lib/supabase/client";
import RestaurantCard from "@/components/chat/RestaurantCard";
import RestaurantSheet from "@/components/chat/RestaurantSheet";
import type { RestaurantResult } from "@/lib/types";

export default function FavoritesPage() {
  const router = useRouter();
  const [restaurants, setRestaurants] = useState<RestaurantResult[]>([]);
  const [loading, setLoading] = useState(true);
  const [sheetRestaurant, setSheetRestaurant] = useState<RestaurantResult | null>(null);

  useEffect(() => {
    async function fetchFavorites() {
      const supabase = createClient();
      const { data: { user } } = await supabase.auth.getUser();

      if (!user) {
        router.push("/login");
        return;
      }

      const { data, error } = await supabase
        .from("favorites")
        .select(`
          restaurant_id,
          restaurants (
            id, name, description, address,
            avg_rating, price_range, is_pure_veg, timings,
            latitude, longitude, zomato_url, swiggy_url,
            neighborhoods ( name ),
            restaurant_cuisines (
              cuisines ( name )
            )
          )
        `)
        .eq("user_id", user.id);

      if (error) {
        console.error("Failed to fetch favorites:", error);
        setLoading(false);
        return;
      }

      const mapped: RestaurantResult[] = (data ?? [])
        .map((row: any) => {
          const r = row.restaurants;
          if (!r) return null;
          return {
            id: r.id,
            name: r.name,
            description: r.description ?? null,
            address: r.address,
            avg_rating: r.avg_rating ?? null,
            price_range: r.price_range ?? null,
            is_pure_veg: r.is_pure_veg,
            timings: r.timings ?? null,
            latitude: r.latitude ?? null,
            longitude: r.longitude ?? null,
            zomato_url: r.zomato_url ?? null,
            swiggy_url: r.swiggy_url ?? null,
            neighborhood: r.neighborhoods?.name ?? "",
            cuisines: (r.restaurant_cuisines ?? [])
              .map((rc: any) => rc.cuisines?.name)
              .filter(Boolean),
            top_dishes: [],
          } satisfies RestaurantResult;
        })
        .filter(Boolean) as RestaurantResult[];

      setRestaurants(mapped);
      setLoading(false);
    }

    fetchFavorites();
  }, [router]);

  return (
    <div
      className="min-h-screen flex flex-col"
      style={{
        backgroundColor: "var(--bg-primary)",
        paddingBottom: "env(safe-area-inset-bottom)",
      }}
    >
      {/* Header */}
      <header
        className="flex items-center gap-3 px-4 shrink-0"
        style={{
          height: "56px",
          paddingTop: "env(safe-area-inset-top)",
          backgroundColor: "var(--bg-secondary)",
          borderBottom: "1px solid var(--border)",
        }}
      >
        <Link
          href="/chat"
          className="flex items-center justify-center transition-default cursor-pointer"
          style={{
            width: "44px",
            height: "44px",
            borderRadius: "var(--radius-sm)",
            color: "var(--text-muted)",
          }}
        >
          <ArrowLeft className="w-5 h-5" />
        </Link>
        <Heart className="w-5 h-5" style={{ color: "var(--accent)" }} />
        <div className="flex items-center gap-2">
          <span className="text-base font-semibold" style={{ color: "var(--text-primary)" }}>
            Saved Places
          </span>
          {!loading && restaurants.length > 0 && (
            <span
              className="text-xs font-semibold px-2 py-0.5"
              style={{
                backgroundColor: "var(--accent-muted)",
                color: "var(--accent)",
                borderRadius: "var(--radius-sm)",
              }}
            >
              {restaurants.length}
            </span>
          )}
        </div>
      </header>

      {/* Content */}
      <main className="flex-1 px-4 py-5 max-w-5xl w-full mx-auto">
        {loading ? (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {Array.from({ length: 6 }).map((_, i) => (
              <div
                key={i}
                className="h-36 animate-pulse"
                style={{
                  backgroundColor: "var(--bg-card)",
                  border: "1px solid var(--border)",
                  borderRadius: "var(--radius-md)",
                }}
              />
            ))}
          </div>
        ) : restaurants.length === 0 ? (
          <div className="flex flex-col items-center justify-center h-[60vh] gap-4 text-center">
            <div
              className="w-16 h-16 flex items-center justify-center"
              style={{
                backgroundColor: "var(--accent-muted)",
                borderRadius: "var(--radius-xl)",
              }}
            >
              <Heart className="w-8 h-8" style={{ color: "var(--accent)" }} />
            </div>
            <p className="text-base font-medium" style={{ color: "var(--text-secondary)" }}>
              Start saving places
            </p>
            <p className="text-sm" style={{ color: "var(--text-muted)" }}>
              Restaurants you save will appear here
            </p>
            <Link
              href="/chat"
              className="btn-accent mt-2"
            >
              Open Cravely
            </Link>
          </div>
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {restaurants.map((r) => (
              <RestaurantCard
                key={r.id}
                restaurant={r}
                onClick={() => setSheetRestaurant(r)}
              />
            ))}
          </div>
        )}
      </main>

      <RestaurantSheet
        restaurant={sheetRestaurant}
        onClose={() => setSheetRestaurant(null)}
        onAskCravely={(name) => {
          setSheetRestaurant(null);
          router.push(`/chat?q=${encodeURIComponent(name)}`);
        }}
      />
    </div>
  );
}
