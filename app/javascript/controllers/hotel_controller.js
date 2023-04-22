import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hotel"
export default class extends Controller {
  static targets = ["filterMenu"]

  toggleFilterMenu() {
    this.filterMenuTarget.classList.toggle('hidden');
  }

  toggleFilterCategory(event) {
    const icon = event.currentTarget.children[0];
    const filterOptions = event.currentTarget.nextElementSibling;

    icon.classList.toggle('rotate-180');
    filterOptions.classList.toggle('max-h-96');
  }
}
