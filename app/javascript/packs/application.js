// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).ready(function() {

  $('#search_button').click(function() {

    var sentence = $('#word_search').val();
    var format = /[[\]]+/;

    if (format.test(sentence) == true) {
      sentence = sentence.replace(/[[\]]+/g , "").split(",");
    }
    format.test(sentence)
    if (sentence != null){

      $("#show_names ul").remove();
      $.ajax({
        type: 'POST',
        data: {sentence: sentence},
        url: '/word_count.json',
        success: (response) => {
          if (response.length > 0) {
            for (var i = 0; i < response.length; i++) {
              console.log(response[i]);
              $("#show_names").append('<ul><li>'+response[i]+'</li></ul>');
            }
          }
        }
      });
    }
  });
});
