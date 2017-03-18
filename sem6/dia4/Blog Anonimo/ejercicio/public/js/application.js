$(document).ready(function() {

  $( "form input, form textarea" ).focus(function() {
    hide_or_show("#save_post_alert","hide");
  });

  $("form").submit(function(event){
    event.preventDefault();
    var posting = $.post("/add_post", $(this).serialize());

    posting.done(function(data) {

      if (data.success){
        $("#save_post_alert").text("Listo!");
      }else{
        var msg_error = array_extract_to_li(data.errors);
        $("#save_post_alert").html(msg_error);
      }
      hide_or_show("show");
    });
  });

  // animations
  function hide_or_show(action){
    if (action == "show") {
      $(".sidenav").animate({height:'673px'});
      $("#save_post_alert").removeClass("hide");
      $("#save_post_alert").addClass("show");
      $("#save_post_alert").fadeTo("slow", 1);
    } else {
      $(".sidenav").animate({height:'601px'});
      $("#save_post_alert").fadeTo("slow", 0, function(){
        $("#save_post_alert").removeClass("show");
        $("#save_post_alert").addClass("hide");
      });
    }
  };

  //helpers
  function array_extract_to_li(data) {
    var out = "";

    data.errs.forEach( function(str) {
      out += "<ol><li>"+ srt +"</li><ol>";
    });

    return out;
  };

});
