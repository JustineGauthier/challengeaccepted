<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta property="og:title" content="Mon titre" />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="http://toto.com" />
  <meta property="og:image" content="https://images.unsplash.com/photo-1653914900849-beb53df7f5ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80" />

  <title>challenge truc</title>

  <style>
    .d-none {
      display: none;
    }
  </style>

</head>
<body>
  <h1>test</h1>

  <p class="d-none" id="copy">
    http://...zhfjdbzhuf
    <a href="">copier dans les press papier</a>
  </p>

  <button id="share"  class="d-none">
    partager le lien
  </button>


  <script>

  const initShareButton = () => {
    document.querySelector('#share').classList.remove('d-none');

    document.querySelector('#share').addEventListener('click', (e) => {
      navigator.share({
        title: document.title,
        text: 'Rejoins le challenge !',
        url: 'http://localhost:3000/challenges/'#{/challenges/:id}'',
      }); // partage l'URL de MDN
    })
  }


  const initCopyLink = () => {
    document.querySelector('#copy').classList.remove('d-none');

    navigator.permissions.query({ name: "clipboard-write" }).then(result => {
      if (result.state == "granted" || result.state == "prompt") {
        /* On peut alors écrire dans le presse-papier */

        document.querySelector('#copy a').addEventListener('click', (e) => {
          e.preventDefault()

          navigator.clipboard.writeText('coucou les copains').then(function () {
            console.log('Async: Copying to clipboard was successful!');
          }, function (err) {
            console.error('Async: Could not copy text: ', err);
          });

        });

      }
    });

    </script>
