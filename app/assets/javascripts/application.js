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
//= require turbolinks
//= require jquery/dist/jquery.min.js
//= require bootstrap/dist/js/bootstrap.min.js
//= require js/adminlte.min.js
//= require iCheck/icheck.min.js
//= require timepicker/bootstrap-timepicker.min.js
//= require bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js
//= require jquery.geocomplete
//= require rails.validations
//= require pagination.js
$(function() {
  $(".geo-input").geocomplete();
});
