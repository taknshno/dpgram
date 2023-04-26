import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import '../stylesheets/application';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function () {
  setTimeout(function () {
    $(".alert").hide();
  }, 4000);
});

if (document.URL.match(/new/) || document.URL.match(/edit/) || document.URL.match(/confirm/)) {
  document.addEventListener("DOMContentLoaded", () => {
    const createImageHTML = (blob) => {
      const imageElement = document.getElementById("prv");
      const blobImage = document.createElement("img");
      blobImage.setAttribute("src", blob);

      imageElement.appendChild(blobImage);
    };

    document.getElementById("picture_image").addEventListener("change", (e) => {
      const imageContent = document.querySelector("#prv").querySelector("img");
      const textContent = document.querySelector("#prv").querySelector("h5");
      console.log(imageContent);
      if (imageContent) {
        imageContent.remove();
      } else if (textContent) {
        textContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
}