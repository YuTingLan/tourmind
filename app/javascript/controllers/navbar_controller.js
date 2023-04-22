import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
    static targets = ["navbarMenu"]

    initialize() {
        console.log('navbar');
    }

    toggleNavbarMenu() {
        // this.navbarMenuTarget.classList.toggle('active');
        console.log(navbar)
    }
}