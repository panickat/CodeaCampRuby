$(document).ready(function() {

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
    get_response(event);
  });

  function get_response(event) {
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
  
});
