import { APIProvider, Map, AdvancedMarker, Pin } from '@vis.gl/react-google-maps'
import type { RestaurantResult } from "@/lib/types"

interface MapPanelProps {
  restaurants?: RestaurantResult[]
  onAskCravely?: (name: string) => void
}

export default function MapPanel({ restaurants = [] }: MapPanelProps) {
  const apiKey = process.env.NEXT_PUBLIC_GOOGLE_MAPS_API_KEY || "YOUR_API_KEY"
  
  // Default center: Chennai
  const defaultCenter = { lat: 13.0827, lng: 80.2707 }
  
  const validRestaurants = restaurants.filter(r => r.latitude != null && r.longitude != null)
  const center = validRestaurants.length > 0
    ? { lat: Number(validRestaurants[0].latitude), lng: Number(validRestaurants[0].longitude) }
    : defaultCenter

  return (
    <APIProvider apiKey={apiKey}>
      <Map
        style={{ width: '100%', height: '100%' }}
        defaultCenter={center}
        defaultZoom={13}
        mapId="cravely-map"
        colorScheme="DARK"
      >
        {validRestaurants.map(r => (
          <AdvancedMarker
            key={r.id}
            position={{ lat: Number(r.latitude), lng: Number(r.longitude) }}
            title={r.name}
          >
            <Pin
              background={r.is_pure_veg ? '#4ADE80' : '#FF6B35'}
              borderColor={r.is_pure_veg ? '#22c55e' : '#ea580c'}
              glyphColor="#fff"
            />
          </AdvancedMarker>
        ))}
      </Map>
    </APIProvider>
  )
}
