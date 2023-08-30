import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
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
      // const marker = JSON.parse(this.data.get("mapMarkerValue"));
      const marker = this.markerValue
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    }

  #fitMapToMarkers() {
    const marker = this.markerValue
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ marker.lng, marker.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  }
