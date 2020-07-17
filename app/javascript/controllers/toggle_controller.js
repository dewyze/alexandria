import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  toggle(event) {
    event.preventDefault();
    const toggleIndex = event.currentTarget.getAttribute("data-index");
    this.contentTargets[toggleIndex].classList.toggle(this.data.get("class"));
  }
}
