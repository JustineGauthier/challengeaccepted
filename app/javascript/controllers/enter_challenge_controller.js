import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

function insertAfter(newNode, existingNode) {
  existingNode.parentNode.insertBefore(newNode, existingNode.nextSibling);
}

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

        const btn = document.getElementById("launch");

        const createP = () => {
          let p = document.createElement('p');
          p.textContent = "Ta participation a bien été confirmée, have fun!";
          insertAfter(p, btn);
          btn.style.display = 'none';
        }
        setTimeout(createP, 1000);

        const title = document.getElementById("title");
        const challenge_title = title.dataset.challenge;
        const createT = () => {
          let h2 = document.createElement('h2');
          h2.textContent = `Ta participation "${challenge_title}" est enregistrée!`;
          insertAfter(h2, title);
          title.style.display = 'none';
        }
        setTimeout(createT, 1000);

        const debut = document.getElementById("debut");
        const challenge_debut = debut.dataset.challengeDebut;
        const challenge_time_left = debut.dataset.challengeTimeLeft;
        const createH = () => {
        let p = document.createElement('p');
        p.textContent = `Il se déroulera sur ${challenge_debut} jours, c'est parti pour ${challenge_time_left} jours! 🚀`;
        insertAfter(p, debut);
        debut.style.display = 'none';
      }
        setTimeout(createH, 1000);
      } )
  }

  refuse(event) {
    event.preventDefault()
    this.element.remove();
  }
}
