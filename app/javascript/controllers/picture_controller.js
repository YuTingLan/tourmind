import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slides"]; 
  static values = { currentIndex: Number }; 

  connect() {
    this.currentIndex = parseInt(localStorage.getItem("currentIndex")) || 0;
    this.updateSlides();

    this.intervalId = setInterval(() => {
      this.nextSlide();
    }, 5000);
  }

  nextSlide() {
    this.currentIndex++; 
    if (this.currentIndex >= this.slidesTargets.length) {
      this.currentIndex = 0; 
    }
    this.updateSlides(); 
  }

  prevSlide() {
    this.currentIndex--; 
    if (this.currentIndex < 0) {
      this.currentIndex = this.slidesTargets.length - 1; 
    }
    this.updateSlides(); 
  }

  disconnect() {
    clearInterval(this.intervalId); 
  }

  updateSlides() {
    this.slidesTargets.forEach((slide, index) => {

      if (index === this.currentIndex) {
        slide.style.display = "flex"; 
      } else {
        slide.style.display = "none"; 
      }
    });
  }
}
