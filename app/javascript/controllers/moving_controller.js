import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slides"]; // 指定目標元素
  static values = { currentIndex: Number }; // 定義一個值來保存當前索引

  connect() {
    this.currentIndex = 0; // 初始化當前索引為 0
    this.updateSlides(); // 更新輪播效果
  }

  nextSlide() {
    this.currentIndex++; // 每次點擊下一張，索引加一
    if (this.currentIndex >= this.slidesTargets.length) {
      this.currentIndex = 0; // 如果索引超過最大值，則重置為 0
    }
    this.updateSlides(); // 更新輪播效果
  }

  prevSlide() {
    this.currentIndex--; // 每次點擊上一張，索引減一
    if (this.currentIndex < 0) {
      this.currentIndex = this.slidesTargets.length - 1; // 如果索引小於 0，則設置為最大值
    }
    this.updateSlides(); // 更新輪播效果
  }

  updateSlides() {
    this.slidesTargets.forEach((slide, index) => {
      // 遍歷所有目標元素，根據索引值更新其樣式
      if (index === this.currentIndex) {
        slide.style.display = "flex"; // 使用 Flex 布局顯示當前索引對應的元素
        slide.style.opacity = "1"; // 將透明度設為 1，實現淡入效果
      } else {
        slide.style.display = "none"; // 隱藏其他元素
        slide.style.opacity = "0"; // 將透明度設為 0，實現淡出效果
      }

    });
    console.log('updateSlides has been executed')
  }

}