import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

// Connects to data-controller="sorting"
export default class extends Controller {
  connect() {
    new Sortable(this.element, {
      group: "shared",
      animation: 150,
      ghostClass: "opacity-0",
    });
  }
}
