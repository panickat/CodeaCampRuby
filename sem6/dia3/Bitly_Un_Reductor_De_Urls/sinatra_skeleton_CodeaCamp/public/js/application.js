$(document).ready(function() {

  $( "#frm_url > input" ).focus(function() {
    $("#status").fadeTo( "slow", 0 );
  });

  $( "#frm_url" ).submit(function( event ) {

    event.preventDefault();
    var posting = $.post( "/add_url", $(this).serialize());

    posting.done(function( data ) {


      if (data.success) {
        $("#status").text(
          "Se guardo la url: " + data.url.long_url + " con el shorten: "
        );
        var url = 'http://localhost:9393/' + data.url.short_url;
        $("#status").append("<a href='" + url + "'>" + url + "</a>");
      }else{
        $("#status").text("Lo sentimos mucho, no se guardo tu url por estas razones");

        var err_list = "";
        data.errs.forEach( function(err) {
          err_list += "<li>"+ err +"</li>";
        });

        $("#status").append("<ol>"+ err_list +"</ol>");
      }
      $("#status").fadeTo( "slow", 1 );
    });
  });

});
