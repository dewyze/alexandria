import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["bookContainer", "destroyInput"];

  connect() {
    this.nextIndex = parseInt(this.data.get("next-index"));
  }

  deleteRow() {
    event.preventDefault();

    event.currentTarget.closest(".fieldset").classList.toggle("hidden");
    let inputIndex = event.currentTarget.getAttribute("data-index");
    this.destroyInputTargets[inputIndex].value = 1;
  }

  addRow() {
    event.preventDefault();

    let controller = this;

    fetch(`/form_fields/store_books/new?index=${controller.nextIndex++}`)
      .then((response) => response.text())
      .then((html) => {
        controller.bookContainerTarget.insertAdjacentHTML("beforeend", html);
      });
  }
}
