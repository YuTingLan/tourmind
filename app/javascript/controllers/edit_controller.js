import { Controller } from "@hotwired/stimulus";
import { patch } from "@rails/request.js";

// Connects to data-controller="send"
export default class extends Controller {
  static targets = ["name", "description", "container"];

  async update() {
    try {
      this.trimDays();

      const data = {
        name: this.nameTarget.value,
        description: this.descriptionTarget.value,
        days: +this.containerTarget.dataset.days,
        locations: {},
      };

      const dayCount = document
        .querySelector("#plan")
        .querySelectorAll(".day").length;

      for (let i = 1; i <= dayCount; i++) {
        data.locations[`day${i}`] = [];
        const sites = document
          .querySelector(`#plan-day-${i}`)
          .querySelectorAll(".site");

        sites.forEach((site) => {
          data.locations[`day${i}`].push(
            site.id.split("-").map((el) => +el || el)
          );
        });
      }

      const id = document.querySelector("#top").dataset.id;

      const res = await patch(`/plans/${id}`, {
        body: JSON.stringify({ data }),
        responseKind: "json",
      });

      const { redirect_url } = await res.json;

      if (!res.ok) alert("Something went wrong!");

      window.location.replace(redirect_url);
    } catch (err) {
      alert(err.message);
    }
  }

  addDay() {
    const dayElement = `
    <div class="relative px-4 day">
      <h4 class="text-xl text-gray-900 font-bold">第${
        +this.containerTarget.dataset.days + 1
      }天</h4>
      <div class="absolute h-full border border-dashed border-opacity-20 border-secondary"></div>
      <div data-controller="sorting" class="h-full w-full sites-list" id="plan-day-${
        +this.containerTarget.dataset.days + 1
      }">
        <div></div>
      </div>
    </div>`;

    this.containerTarget.dataset.days = +this.containerTarget.dataset.days + 1;
    this.containerTarget.insertAdjacentHTML("beforeend", dayElement);
  }

  removeDay() {
    const sitesInLastDay = this.containerTarget.lastElementChild
      .querySelector(".sites-list")
      .querySelectorAll(".site").length;

    if (sitesInLastDay) return alert("移除天數前，請先移除該天所有行程。");

    this.containerTarget.dataset.days = +this.containerTarget.dataset.days - 1;
    this.containerTarget.lastElementChild.remove();
  }

  trimDays() {
    const sitesInLastDay = this.containerTarget.lastElementChild
      .querySelector(".sites-list")
      .querySelectorAll(".site").length;

    if (sitesInLastDay) return;

    this.containerTarget.dataset.days = +this.containerTarget.dataset.days - 1;
    this.containerTarget.lastElementChild.remove();
    return this.trimDays();
  }
}
