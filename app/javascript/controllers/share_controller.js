import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    id: String,
    title: String
  }

  connect() {
  }

  shareLink() {
    const url = `https://challenge-accepted-854.herokuapp.com//challenges/${this.idValue}/join`

    const options = {
      title: this.titleValue,
      text: 'Viens rejoindre le challenge!',
      url: url,
    }

    console.log(options)

    try {
      navigator.share(options);
    } catch (error) {
      alert(error);
      // expected output: ReferenceError: nonExistentFunction is not defined
      // Note - error messages will vary depending on browser
    }
  }
}
