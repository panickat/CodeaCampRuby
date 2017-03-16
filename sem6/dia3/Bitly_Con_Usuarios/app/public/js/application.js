$(document).ready(function() {

  //General
  $( "form input" ).focus(function() {
    $( "label:nth-last-child(1)").fadeTo( "slow", 0 );
  });

  //// login & signin
  $( "#login" ).click(function() {
    window.location.href = location.origin + "/login";
  });

  $( "#signin" ).click(function() {
    window.location.href = location.origin + "/singin";
  });

  $( "#frm_log" ).submit(function( event ) {
    get_response();
  });

  function get_response() {
    event.preventDefault();
    var posting = $.post( location.href, $("form").serialize() );

    posting.done(function( data ) {

      if (data.success) {
        window.location.href = location.origin + "/" + data.redirect_to;
      }else{
        $("label:nth-last-child(1)").text("Intenta de nuevo");

        var err_list = "";
        data.errs.forEach( function(err) {
          err_list += "<li>"+ err +"</li>";
        });

        $("label:nth-last-child(1)").append("<ol>"+ err_list +"</ol>");
      }
      $("label:nth-last-child(1)").fadeTo( "slow", 1 );
    });
  }

  // urls app

  $( "#frm_addurl" ).submit(function( event ) {

    event.preventDefault();
    var posting = $.post( "/add_url", $(this).serialize());

    posting.done(function( data ) {


      if (data.success) {
        $("label:nth-last-child(1)").text(
          "Se guardo la url: " + data.url.long_url + " con el shorten: "
        );
        var url = location.origin + "/" + data.url.short_url;
        $("label:nth-last-child(1)").append("<a href='" + url + "' target='_blank'>" + url + "</a>");
      }else{
        $("label:nth-last-child(1)").text("Lo sentimos mucho, no se guardo tu url por estas razones");

        var err_list = "";
        data.errs.forEach( function(err) {
          err_list += "<li>"+ err +"</li>";
        });

        $("label:nth-last-child(1)").append("<ol>"+ err_list +"</ol>");
      }
      $("label:nth-last-child(1)").fadeTo( "slow", 1 );
    });

  });

});
