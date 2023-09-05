import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = ["navbar"]
  connect() {
    console.log(this.element)
    this.scrollThreshold = 90; // Change this value as needed
    window.addEventListener('scroll', this.handleScroll.bind(this));
  }

  handleScroll() {
    const scrollY = window.scrollY

    if (scrollY >= this.scrollThreshold) {
      // Scroll height exceeds the threshold, change the navbar color
      this.navbarTarget.classList.add('font-change');
    } else {
      // Scroll height is below the threshold, reset the navbar color
      this.navbarTarget.classList.remove('font-change');
    }
  }
}
