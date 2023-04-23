import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hotel"
export default class extends Controller {
  static targets = ["filterMenu"]
  //控制篩選鍵
  toggleFilterMenu() {
    this.filterMenuTarget.classList.toggle('hidden');
  }

  //控制畫面左方分類Category的三角形篩選鍵
  toggleFilterCategory(event) {
    const icon = event.currentTarget.children[0];
    const filterOptions = event.currentTarget.nextElementSibling;

    icon.classList.toggle('rotate-180');
    filterOptions.classList.toggle('max-h-96');
  }
}
