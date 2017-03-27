$(document).ready(function(){
  var players = players();

  //eventos
  $(document).keydown(function(e) {
    switchkey(e, "down");

  }).keyup(function(e) {
    switchkey(e, "up");
  });

  function switchkey(e,action){
    e.preventDefault();

    players.forEach(function(player, index){
      if (e.key == player.key) up_down(index ,action);
    });
    //  $("#cris").find("td.active").removeClass("active");
    //  $("#cris td:nth-child(2)").addClass("active");
  };

  function up_down(index, action){
    if (players[index].move != null) return;

    switch (action) {
      case "up":
        held_down = new Date() - players[index].press_start;
        strength = Math.random() * 15; console.log(strength);

        players[index].move = setInterval(function() {step_td(players[index].name) }, strength)
        setTimeout(function(){ clearInterval(players[index].move) }, held_down);
        break;

      case "down":
      console.log(players[index]);
         if (players[index].press_start == null) players[index].press_start = new Date();
      break;
    }
  }
  function step_td(user){
    active = $("#" + user).find("td.active").removeClass("active").index() + 2;
    $("#" + user + " td:nth-child("+ active +")").addClass("active");
  }


function players(){
  key_range = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  return location.search.replace("?","").split('&').map(function(p) {
    arr = p.split('=');
    hash = {};
    hash.name = arr[0];
    hash.id = arr[1];
    hash.press_start = null;
    hash.key = key_range.shift();
    hash.move = null;
    return hash ;
  });
};


});
