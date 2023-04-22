import { Controller } from "@hotwired/stimulus";
import { patch } from "@rails/request.js";

// Connects to data-controller="send"
export default class extends Controller {
  async update() {
    const data = {
      name: this.element.querySelector(".name").value,
      description: this.element.querySelector(".description").value,
      days: this.element.querySelector(".days").value,
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

    const resData = await res.json;

    if (res.ok) return window.location.replace(resData.redirect_url);

    return alert("Something went wrong");
  }
}
