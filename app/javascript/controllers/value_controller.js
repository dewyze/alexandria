import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  update(event) {
    console.log("UPDATE");
    event.preventDefault();
    const valueIndex = event.currentTarget.getAttribute("data-index");
    this.contentTargets[valueIndex].value = this.data.get("value");
  }
}
