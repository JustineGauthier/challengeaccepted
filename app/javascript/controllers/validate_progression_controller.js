import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

function insertAfter(newNode, existingNode) {
  existingNode.parentNode.insertBefore(newNode, existingNode.nextSibling);
}

export default class extends Controller {
  static values = {
    updateUrl: String
  }

  validate(event) {

    // Cibler l'élément cliqué puis les boutons à l'intérieur
    const controllerEl = this.element;
    const validBtn = controllerEl.querySelector('.btn-valid');
    const notValidBtn = controllerEl.querySelector('.btn-not-valid');

    // Désactive l'action initiale de l'événement
    event.preventDefault();

    // Valider l'action via un fetch
    fetch(this.updateUrlValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken()
      }
    })
    .then(response => {

      // Mettre à jour le contenu du bouton
      validBtn.textContent = 'Validation en cours...';

      // Afficher des infos au niveau du challenge après 1s
      const congrat = () => {
        let p = document.createElement('p');
        p.textContent = "✨ Bien joué ✨";
        insertAfter(p, validBtn);
        validBtn.style.display = 'none';
        notValidBtn.style.display = 'none';

        // Recharger la page pour mettre à jour le décompte des points
        setTimeout(() => {
          window.location.reload();
        }, 1000);

      }
      setTimeout(congrat, 1000);

    })

//       .then(response => {
//         this.element.remove();
//         window.location.reload()
//       } )

  }

  nop(event) {
    event.preventDefault()
    this.element.remove();
  }
}
