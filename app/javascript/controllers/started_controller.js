import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

function insertAfter(newNode, existingNode) {
  existingNode.parentNode.insertBefore(newNode, existingNode.nextSibling);
}

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

      const btn = document.getElementById("launch");
      btn.textContent = 'Le challenge se charge...';

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
        let h1 = document.createElement('h1');
        h1.textContent = `Ton challenge "${challenge_title}" est actif!`;
        insertAfter(h1, title);
        title.style.display = 'none';
      }
      setTimeout(createT, 1000);

      const debut = document.getElementById("debut");
      const challenge_debut = debut.dataset.challengeDebut;
      const challenge_time_left = debut.dataset.challengeTimeLeft;
      const createH = () => {
        let h6 = document.createElement('h6');
        h6.textContent = `Il se déroulera sur ${challenge_debut} jours, il te reste donc ${challenge_time_left} jours de participation`;
        insertAfter(h6, debut);
        debut.style.display = 'none';
      }
      setTimeout(createH, 1000);
    })
  }
}
