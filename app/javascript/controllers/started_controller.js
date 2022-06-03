import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static values = {
    updateUrl: String
  }

  status(event) {
    event.preventDefault()
    fetch(this.updateUrlValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken()
        }
    })
      .then(response => {
        window.location.reload()
      } )
  }
}
