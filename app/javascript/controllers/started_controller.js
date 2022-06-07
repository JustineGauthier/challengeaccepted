import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static values = {
    updateUrl: String
  }

  status(event) {

    // à enlever ? redescends lors du changement de show
    event.preventDefault()
    fetch(this.updateUrlValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken()
        }
    })
    .then(response => {

      const btn = document.getElementById("launch2");
      btn.textContent = "✨GO!✨";

      setTimeout(() => {
        window.location.reload();
        }, 1000);
    })
  }
}
