$(document).ready(function() {

  $("form").submit(function(event){
    event.preventDefault();
    $("#msg").fadeTo( "slow", 0 );

    var posting = $.post("/rolls");

    posting.done(function(data){
      $("#die img:nth-child(1)").attr("src","/"+ data.rolls[0] +".png");
      $("#die img:nth-child(2)").attr("src","/"+ data.rolls[1] +".png");
      $("#die img:nth-child(3)").attr("src","/"+ data.rolls[2] +".png");

      if (data.win){
        change_class("#msg", "win", "lose", "Que afortunado Ganaste!!!");
      }else {
        change_class("#msg", "lose", "win", "Mala suerte, intenta otra vez!");
      };
      $("#msg").fadeTo( "slow", 1 );
    });

  });

  function change_class(selector,new_c,old_c,text=""){
    $(selector).addClass(new_c);
    $(selector).removeClass(old_c);
    if (text !== "") $(selector).text(text);
  }

});
