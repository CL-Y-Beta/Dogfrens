import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String
  };
  static targets = ["map"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.markerValue)
    this.map = new mapboxgl.Map({
    container: this.element,
    style: 'mapbox://styles/mapbox/streets-v12', // style URL
    });
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  #addMarkersToMap() {
      const marker = JSON.parse(this.data.get("mapMarkerValue"));
      new mapboxgl.Marker()
        .setLngLat([ 103.88037385, 1.35423795 ])
        .addTo(this.map)
    }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ 103.88037385, 1.35423795 ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  }
