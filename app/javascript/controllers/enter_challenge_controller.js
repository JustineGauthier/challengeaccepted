import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["cardEnter"]
  static values = {
    createUrl: String,
    userId: String,
    challengeId: String
  }

  accept(event) {
    var formData = new FormData();
    formData.append('challenge_id', this.challengeIdValue);
    formData.append('user_id', this.userIdValue);
    console.log(formData)
    event.preventDefault()
    fetch(this.createUrlValue, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": csrfToken()
        },
      body: formData
    })
      .then(response => {
        this.element.remove();
        
          setTimeout(() => {
            window.location.reload();
          }, 1000);
      } )
  }

  refuse(event) {
    event.preventDefault()
    this.element.remove();
  }
}
