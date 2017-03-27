$(document).ready(function() {
  var number_players = 1;


  $( "form input" ).focus(function() {
    $( "#status").fadeTo( "slow", 0 );
  });

  $( "#frm_log" ).submit(function( event ) {
    event.preventDefault();
    get_response();
  });

  $("#push_player").click(function(){
    number_players += 1;
    if (number_players  <= 36) {
      $("#other_players").append(
        "<label>" +
          '<input type="text" required name="player'+ number_players +'" />' +
          '<div class="label-text">Jugador '+ number_players +'</div>' +
        '</label>'
      );
    } else {
      $("#status").text("Lo sentimos el numero maximo de jugadores es de 36");
      $( "#status" ).fadeTo( "slow", 1 );
    }
  });

  //helpers
  function get_response() {
    var posting = $.post( location.href, $("#frm_log").serialize() );

    posting.done(function( data ) {

      var serialize = "";
      $.each(data.players, function(index,obj){
        var join =  (index == 0) ? "" : "&";
        serialize += join + $.param(obj);
      });
      window.location.href = location.origin + data.redirect_to + serialize;
    });

  };


});
