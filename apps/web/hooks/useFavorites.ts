"use client";

import { useState, useEffect, useCallback } from "react";
import { createClient } from "@/lib/supabase/client";

const supabase = createClient();

interface UseFavoritesReturn {
  isFavorite: (id: string) => boolean;
  toggleFavorite: (id: string) => Promise<void>;
  loading: boolean;
}

export function useFavorites(): UseFavoritesReturn {
  const [favorites, setFavorites] = useState<Set<string>>(new Set());
  const [userId, setUserId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function load() {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user) { setLoading(false); return; }
      setUserId(user.id);

      const { data } = await supabase
        .from("favorites")
        .select("restaurant_id")
        .eq("user_id", user.id);

      if (data) {
        setFavorites(new Set(data.map((r: { restaurant_id: string }) => r.restaurant_id)));
      }
      setLoading(false);
    }
    load();
  }, []);

  const isFavorite = useCallback((id: string) => favorites.has(id), [favorites]);

  const toggleFavorite = useCallback(async (id: string) => {
    if (!userId) return;

    const wasFavorited = favorites.has(id);

    // Optimistic update
    setFavorites((prev) => {
      const next = new Set(prev);
      if (wasFavorited) next.delete(id);
      else next.add(id);
      return next;
    });

    try {
      if (wasFavorited) {
        const { error } = await supabase
          .from("favorites")
          .delete()
          .eq("user_id", userId)
          .eq("restaurant_id", id);
        if (error) throw error;
      } else {
        const { error } = await supabase
          .from("favorites")
          .insert({ user_id: userId, restaurant_id: id });
        if (error) throw error;
      }
    } catch {
      // Revert on error
      setFavorites((prev) => {
        const next = new Set(prev);
        if (wasFavorited) next.add(id);
        else next.delete(id);
        return next;
      });
    }
  }, [userId, favorites]);

  return { isFavorite, toggleFavorite, loading };
}
