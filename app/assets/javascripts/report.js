$(document).ready(function() {
  $("#filter").change(function(){
    var id = $(this).val();
    if(id == "1") {
      $('.tweet').show();
    } else if(id == "2") {
      $('.tweet').show();
    } else {
      $('.tweet_date').show();
    }
  });
});
