import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["card"]
  static values = {
    updateUrl: String
  }

  validate(event) {
    event.preventDefault()
    fetch(this.updateUrlValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken()
        }
    })
      .then(response => {
        this.cardTarget.remove();
        
      } )
  }

  nop(event) {
    event.preventDefault()
    this.cardTarget.remove();
  }
}
