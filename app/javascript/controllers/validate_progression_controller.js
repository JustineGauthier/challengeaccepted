import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card"]

  validate(event) {
    event.preventDefault()
    fetch(`http://localhost:3000/participations/progressions/${progression.id}`, {
      method: "PATCH",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({"done": true})
    })
      .then(response => response.json())
      .then((data) => {
      })
    this.cardTarget.remove();
  }
}
