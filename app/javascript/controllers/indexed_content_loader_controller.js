import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["container"];

  connect() {
    this.nextIndex = this.data.get("next-index");
  }

  insert() {
    event.preventDefault();

    let controller = this;
    let queryString = `?index=${this.nextIndex++}`;
    let data = event.currentTarget.dataset;

    if (data.params) {
      queryString += data.params;
    }

    let url = this.data.get("url") + queryString;
    fetch(url)
      .then((response) => response.text())
      .then((html) => {
        controller.containerTarget.insertAdjacentHTML(
          controller.data.get("insert-location"),
          html
        );
      });
  }
}
