$(document).ready(function() {

  // hashtag from nav
  $(".sidenav ul li").click(function(event){

    event.preventDefault();
    click_list_active(".sidenav ul li",this);

    var posting = $.post("/posts_from_tag", "tag=" + $(this).find("a").attr("href"));

    posting.done(function(data) {
      $("#posts_container").html(construct_pots_from_tag(data.posts));
    });

  });
  // hashtag from body
  $("#posts_container").on("click", "a", function(event){ console.log("from body");

    event.preventDefault();
    click_list_active(".sidenav ul li","");

    var posting = $.post("/posts_from_tag", "tag=" + $(this).attr("href"));

    posting.done(function(data) {
      $("#posts_container").html(construct_pots_from_tag(data.posts));
    });

  });

  // New Post
  $( "form input, form textarea" ).focus(function() {
    display_alert("#save_post_alert","hide");
  });

  $("form").submit(function(event){
    event.preventDefault();
    var posting = $.post("/add_post", $(this).serialize());

    posting.done(function(data) {
      $("#save_post_alert").text("Listo!");
      display_alert("show");
    });

    posting.fail(function(data){
      var msg_error = array_extract_to_li(data.errors);
      $("#save_post_alert").html(msg_error);
    });

  });

  // animations
  function display_alert(action){
    if (action == "show") {
      $(".sidenav").animate({height: "658px"});
      $("#save_post_alert").removeClass("hide");
      $("#save_post_alert").addClass("show");
      $("#save_post_alert").fadeTo("slow", 1);
    } else {
      $(".sidenav").animate({height: "586px"});
      $("#save_post_alert").fadeTo("slow", 0, function(){
        $("#save_post_alert").removeClass("show");
        $("#save_post_alert").addClass("hide");
      });
    }
  };
  // html construct

  function construct_pots_from_tag(posts) {
    var html = ""; var tag = "";
    posts.forEach(function(data) {

      var date = new Date(data.post.created_at);
      date = date.getFullYear() + " " + (date.getMonth() + 1) + " " + date.getDate();

      var tags = "";
      data.tags.forEach(function(tag){
        tags += " <a class='label label-primary' href='"+ tag +"'>" + tag + "</a>"
      });

      html += "<h4><small>RECENT POSTS</small></h4>" +
      "<hr>" +
      "<h4>" + data.post.title + "</h4>" +
      '<h5><span class="glyphicon glyphicon-time"></span> Comentado en: ' + date + "</h5>" +
      "<h5>" +
      tags +
      "</h5>" +
      "<br>" +
      "<p>" + data.post.body + "</p>" ;
    });
    return html;
  };

  // helpers
  function click_list_active(selector,li_active){

    $(selector).each(function(i){
      $(this).removeClass("active");
    });

    $(li_active).addClass("active");
  };

  function array_extract_to_li(data) {
    var out = "";

    data.errs.forEach( function(str) {
      out += "<ol><li>"+ srt +"</li><ol>";
    });

    return out;
  };

});
