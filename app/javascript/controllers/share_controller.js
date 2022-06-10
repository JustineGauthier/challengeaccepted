import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    id: String,
    title: String,
    creator: String
  }

  connect() {
  }

  shareLink() {
    const url = `https://www.challengeaccepted.live/challenges/${this.idValue}/join`

    const options = {
      title: this.titleValue,
      text: `${this.creatorValue} t'invite à rejoindre un challenge !`,
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
