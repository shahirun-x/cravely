"use client";

import { MapIcon } from "lucide-react";
import type { RestaurantResult } from "@/lib/types";

interface MapPanelProps {
  restaurants: RestaurantResult[];
  onAskCravely: (name: string) => void;
}

export default function MapPanel({ }: MapPanelProps) {
  return (
    <div className="flex flex-col items-center justify-center h-full text-center px-6 bg-bg-primary">
      <div
        className="p-8 max-w-sm"
        style={{
          backgroundColor: "var(--bg-card)",
          border: "1px solid var(--border)",
          borderRadius: "var(--radius-lg)",
        }}
      >
        <MapIcon
          className="mx-auto mb-4"
          style={{ color: "var(--text-muted)" }}
          size={48}
        />
        <p className="text-base text-text-secondary">
          Map view coming soon
        </p>
      </div>
    </div>
  );
}
