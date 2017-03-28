$(document).ready(function(){
  var players = init_players();

  // events
  $(document).keydown(function(e) {
    switchkey(e, "down");

  }).keyup(function(e) {
    switchkey(e, "up");
  });

  $("#again").click(function(){
    players = init_players();
  });

  // helpers
  function switchkey(e,action){
    e.preventDefault();

    players.forEach(function(player, index){
      if (e.key == player.key) up_down(index ,action);
    });
  };

  function up_down(index, action){
    if (players[index].nth != null) return;

    switch (action) {
      case "up":
      held_down = new Date() - players[index].press_start;
      strength = Math.random() * 15;

      players[index].move = setInterval(function() { players[index].nth = step_td(players[index].name) }, strength)
      setTimeout(function(){
        clearInterval(players[index].move)
        winner();
      }, held_down);
      break;

      case "down":
      if (players[index].press_start == null) players[index].press_start = new Date();
      break;
    }
  }
  function step_td(user){
    active = $("#" + user).find("td.active").removeClass("active").index() + 2;
    $("#" + user + " td:nth-child("+ active +")").addClass("active");
    return active
  }

  function winner(){
    var goal = $("#" + players[0].name).find("td.goal").index();
    var nearest = 0;
    var number_players = 0;

    players.forEach(function(player){

      if (player.nth != null) {
        number_players += 1;
        if (player.nth <= goal && player.nth > nearest) nearest = player.nth
      }
    });

    if (number_players == players.length){
      $("#winner > .msg").append("El ganador es: " + save_game("/save_game", nearest) + "!!");
      $("#winner").fadeTo("slow", 1);
    }
  }

  function save_game(post_url, nearest = null, _players = null){ 
    var winner = null;
    var ids = [];
    if (_players == null) _players = players;

    _players.forEach(function(player){
      ids.push(player.id);
      if (player.nth == nearest) winner = player;
    });

    var posting = $.post( post_url , {players: ids, winner: winner.id} );
    posting.done(function( data ) {
      statistics(data);
    });

    return winner.name;
  }


  function statistics(data){
    var li = "";
    var games_total =0;
    data.forEach(function(player){
      games_total += player.wins;
    });
    data.forEach(function(player){
      player_lost =  games_total - player.wins;
      li += "<li><span class='name'>"+ player_name(player.user_id) +"</span> ganados:<var>"+ player.wins +"</var>perdidos:<var>"+ player_lost +"</var></li>";
    });

    $("#statistics").html(
      "<h1 class='brackets'>Total de <span>juegos: "+ games_total +"</span></h1>" +
      "<ol class='gris'>" +
      li +
      "</ol>"
    );
  }
  function player_name(user_id){
    out = "";
    players.forEach(function(player){
      if (player.id == user_id) out = player.name;
    });
    return out;
  }

  function init_players(){
    key_range = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    $("#players_keys").html("");
    if ($("#winner").css("opacity") == 1){
      $("#winner").fadeTo("slow", 0, function(){
        $("#winner .msg").html("");
      });
    }
    var out = [];
    location.search.replace("?","").split('&').map(function(p) {
      var arr = p.split('=');
      var hash = {};
      hash.name = arr[0].replace(/[+]/g,"_");
      hash.id = arr[1];
      hash.press_start = null;
      hash.key = key_range.shift();
      hash.move = null;
      hash.nth = null;

      out.push(hash);
      init_stage(hash);
    });

    save_game("/batch_statistics",null,out);
    return out;
  };

  function init_stage(hash){
    $("#players_keys").append(
      "<li><figure class='brackets'><div class='name'>"+ hash.name.replace(/[_]/g," ") +"</div> juega con la letra<var>"+ hash.key +"</var><span>manten presionado para tomar impulso</span></figure></li>"
    );
    $("#" + hash.name).find("td.active").removeClass("active");
    $("#" + hash.name + " td:nth-child(2)").addClass("active");
  };

});
