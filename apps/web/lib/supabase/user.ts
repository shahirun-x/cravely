import type { SupabaseClient } from "@supabase/supabase-js";

/**
 * Insert a new user profile into the `users` table after first OAuth login.
 */
export async function createUserProfile(
  supabase: SupabaseClient,
  userId: string,
  fullName: string,
  cityId?: string
) {
  const { error } = await supabase.from("users").upsert(
    {
      id: userId,
      full_name: fullName,
      city_id: cityId ?? null,
    },
    { onConflict: "id" }
  );

  if (error) {
    if (process.env.NODE_ENV === "development") {
      console.error("Failed to create user profile:", error.message);
    }
    throw new Error("Failed to create user profile");
  }
}

/**
 * Save onboarding preferences to the `user_preferences` table.
 * Looks up cuisine and neighborhood IDs by name.
 */
export async function saveUserPreferences(
  supabase: SupabaseClient,
  userId: string,
  dietary: string[],
  cuisineNames: string[],
  neighborhoodNames: string[]
) {
  // Look up cuisine IDs by name
  let cuisineIds: string[] = [];
  if (cuisineNames.length > 0) {
    const { data: cuisines } = await supabase
      .from("cuisines")
      .select("id")
      .in("name", cuisineNames);
    cuisineIds = cuisines?.map((c) => c.id) ?? [];
  }

  // Look up neighborhood IDs by name
  let neighborhoodIds: string[] = [];
  if (neighborhoodNames.length > 0) {
    const { data: neighborhoods } = await supabase
      .from("neighborhoods")
      .select("id")
      .in("name", neighborhoodNames);
    neighborhoodIds = neighborhoods?.map((n) => n.id) ?? [];
  }

  // Upsert user preferences
  const { error } = await supabase.from("user_preferences").upsert(
    {
      user_id: userId,
      dietary,
      favorite_cuisines: cuisineIds,
      preferred_neighborhoods: neighborhoodIds,
    },
    { onConflict: "user_id" }
  );

  if (error) {
    if (process.env.NODE_ENV === "development") {
      console.error("Failed to save user preferences:", error.message);
    }
    throw new Error("Failed to save user preferences");
  }
}
