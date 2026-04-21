"use client";

import { useEffect, useState } from "react";
import { APIProvider, Map, AdvancedMarker, Pin, InfoWindow, useMap } from "@vis.gl/react-google-maps";
import type { RestaurantResult } from "@/lib/types";

interface MapPanelProps {
  restaurants?: RestaurantResult[];
  onAskCravely?: (name: string) => void;
  selectedRestaurantId?: string | null;
}

const DEFAULT_CENTER = { lat: 13.0827, lng: 80.2707 };

function MapController({
  restaurants,
  onAskCravely,
  selectedRestaurantId,
}: {
  restaurants: RestaurantResult[];
  onAskCravely?: (name: string) => void;
  selectedRestaurantId?: string | null;
}) {
  const map = useMap();
  const [openId, setOpenId] = useState<string | null>(null);

  // Pan + zoom + open InfoWindow when selectedRestaurantId changes
  useEffect(() => {
    if (!selectedRestaurantId || !map) return;
    const r = restaurants.find((x) => x.id === selectedRestaurantId);
    if (!r || r.latitude == null || r.longitude == null) return;
    map.panTo({ lat: Number(r.latitude), lng: Number(r.longitude) });
    map.setZoom(16);
    setOpenId(selectedRestaurantId);
  }, [selectedRestaurantId, map, restaurants]);

  const validRestaurants = restaurants.filter(
    (r) => r.latitude != null && r.longitude != null
  );

  return (
    <>
      {validRestaurants.map((r) => (
        <AdvancedMarker
          key={r.id}
          position={{ lat: Number(r.latitude), lng: Number(r.longitude) }}
          title={r.name}
          onClick={() => setOpenId(r.id)}
        >
          <Pin
            background={r.is_pure_veg ? "#4ADE80" : "#FF6B35"}
            borderColor={r.is_pure_veg ? "#22c55e" : "#ea580c"}
            glyphColor="#fff"
          />
        </AdvancedMarker>
      ))}

      {openId &&
        (() => {
          const r = validRestaurants.find((x) => x.id === openId);
          if (!r) return null;
          return (
            <InfoWindow
              position={{ lat: Number(r.latitude), lng: Number(r.longitude) }}
              onCloseClick={() => setOpenId(null)}
            >
              <div style={{ maxWidth: "200px", fontFamily: "sans-serif" }}>
                <p style={{ fontWeight: 600, marginBottom: 4 }}>{r.name}</p>
                <p style={{ fontSize: 12, color: "#666", marginBottom: 6 }}>
                  {r.neighborhood}
                </p>
                {onAskCravely && (
                  <button
                    onClick={() => { onAskCravely(r.name); setOpenId(null); }}
                    style={{
                      fontSize: 12,
                      color: "#FF6B35",
                      background: "none",
                      border: "none",
                      padding: 0,
                      cursor: "pointer",
                    }}
                  >
                    Ask Cravely →
                  </button>
                )}
              </div>
            </InfoWindow>
          );
        })()}
    </>
  );
}

export default function MapPanel({
  restaurants = [],
  onAskCravely,
  selectedRestaurantId,
}: MapPanelProps) {
  const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY || "";

  const validRestaurants = restaurants.filter(
    (r) => r.latitude != null && r.longitude != null
  );
  const center =
    validRestaurants.length > 0
      ? { lat: Number(validRestaurants[0].latitude), lng: Number(validRestaurants[0].longitude) }
      : DEFAULT_CENTER;

  return (
    <APIProvider apiKey={apiKey}>
      <Map
        style={{ width: "100%", height: "100%" }}
        defaultCenter={center}
        defaultZoom={13}
        mapId="cravely-map"
        colorScheme="DARK"
      >
        <MapController
          restaurants={restaurants}
          onAskCravely={onAskCravely}
          selectedRestaurantId={selectedRestaurantId}
        />
      </Map>
    </APIProvider>
  );
}
