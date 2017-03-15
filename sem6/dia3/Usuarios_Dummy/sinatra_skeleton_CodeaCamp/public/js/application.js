$(document).ready(function() {

  $( "form input" ).focus(function() {
    $( "label:nth-last-child(1)").fadeTo( "slow", 0 );
  });

  $( "#login" ).click(function() {
    window.location.href = location.origin + "/login";
  });

  $( "#signin" ).click(function() {
    window.location.href = location.origin + "/singin";
  });

  $( "form" ).submit(function( event ) {
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

  // app_content
  count_down(10);
  function count_down(expire) {
    if (location.pathname.match(/app_content*/) == null) return;

    var seconds_to_oexpire = setInterval(function(){
      expire -= 1;
      $("label:nth-last-child(1) p.label-text var").text(expire);
      if (expire == 0) clearInterval(seconds_to_oexpire);
    }, 1000);
  }

});
