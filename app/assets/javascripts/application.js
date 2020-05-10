// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require jquery.jpostal

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#user_postcode').jpostal({
      postcode : [
        '#user_postcode'
      ],
      address: {
        "#user_prefecture_code": "%3", // # 都道府県が入力される
        "#user_address_city"           : "%4%5", // # 市区町村と町域が入力される
        "#user_address_street"         : "%6%7" // # 大口事務所の番地と名称が入力される
      }
    });
  });
});