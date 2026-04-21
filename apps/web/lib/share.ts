import type { RestaurantResult } from "@/lib/types";

export function handleShare(restaurant: RestaurantResult) {
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
