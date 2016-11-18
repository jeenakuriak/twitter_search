// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(function(){
  $("#filter").on('click', function(){
    var id = $(this).val();
    if(id == "1") {
      $('#twet').show();
      $('#retwet').hide();
      $('#twet_date').hide();
    } else if(id == "2") {
      $('#retwet').show();
      $('#twet').hide();
      $('#twet_date').hide();
    } else {
      $('#twet_date').show();
      $('#twet').hide();
      $('#retwet').hide();
    }
  });
});
