import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
    static targets = ["navbarMenu"]
    
    //控制navbar小於768px的選單
    toggleNavbarMenu() {
        this.navbarMenuTarget.classList.toggle('hidden');
    }
}