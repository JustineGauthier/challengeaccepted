import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    id: String,
    title: String
  }

  connect() {
  }

  shareLink() {
    console.log(this.titleValue)
    const url = `http://localhost:3000/challenges/${this.idValue}/join`
    console.log(url)

    const options = {
      title: this.titleValue,
      text: 'Si vous voulez ',
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
