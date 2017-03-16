$(document).ready(function() {

  //General
  if (location.pathname == "/codea") $("#close_session").removeClass("not_show");

  $( "form input" ).focus(function() {
    $( "label:nth-last-child(1)").fadeTo( "slow", 0 );
  });

  //// login & signin
  $( "#close_session" ).click(function() {
    window.location.href = location.origin + "/close_session";
  });

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

        var err_list = "";
        data.errs.forEach( function(err) {
          err_list += "<li>"+ err +"</li>";
        });

        $("label:nth-last-child(1)").html("<p>intenta de nuevo</p><ol>"+ err_list +"</ol>");
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

        var url = location.origin + "/" + data.url.short_url;
        $("label:nth-last-child(1)").html("Se guardo la url: " + data.url.long_url + " con el shorten: <a href='" + url + "' target='_blank'>" + url + "</a>");
      }else{

        var err_list = "";
        data.errs.forEach( function(err) {
          err_list += "<li>"+ err +"</li>";
        });

        $("label:nth-last-child(1)").html("<p>Lo sentimos mucho, no se guardo tu url por estas razones</p><ol>"+ err_list +"</ol>");
      }
      $("label:nth-last-child(1)").fadeTo( "slow", 1 );
    });

  });

});
