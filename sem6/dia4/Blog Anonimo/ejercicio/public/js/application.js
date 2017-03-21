$(document).ready(function() {
  var search_term = null;

  //search
  $("#search").on("input",function(e){
    if($(this).data("lastval")!= $(this).val()) {

      //$(this).data("lastval",$(this).val());
      if ($(this).val().length >= 3){

        search_term = $(this).val();
        var posting = $.post("/tags_like", "tag=" + search_term);

        posting.done(function(data) {

          var out = "";
          data.forEach( function(tag) {
            out += '<a href="'+ tag.tag +'" class="list-group-item">' + tag.tag + "<span class='badge'>"+ tag.hits +"</span></a>";
          });
          $("#search_list").fadeTo("slow", 1);
          $("#search_list").html(out);

        });
      }else if($(this).val().length == 0) {
        $("#search_list").fadeTo("slow", 0, function(){
          $("#search_list").html("");
        });
      };
    };
  });
  //hashtag from search_list
  $("#search_list").on("click", "a", function(event){ console.log("nav");

  event.preventDefault();
  click_list_active("#search_list a",this);
  click_list_active(".sidenav ul li","");

  search_term = $(this).attr("href");
  var posting = $.post("/posts_from_tag", "tag=" + search_term);

  posting.done(function(data) {
    $("#posts_container").html(construct_pots_from_tag(data.posts));
  });

});
// hashtag from nav
$(".sidenav ul li").click(function(event){ console.log("nav");

event.preventDefault();
click_list_active(".sidenav ul li",this);
click_list_active("#search_list a","");

search_term = $(this).find("a").attr("href");
var posting = $.post("/posts_from_tag", "tag=" + search_term);

posting.done(function(data) {
  $("#posts_container").html(construct_pots_from_tag(data.posts));
});

});
// hashtag from body
$("#posts_container").on("click", "a", function(event){

  event.preventDefault();
  click_list_active(".sidenav ul li","");
  click_list_active("#search_list a","");

  search_term = $(this).attr("href");
  var posting = $.post("/posts_from_tag", "tag=" + search_term);

  posting.done(function(data) {
    $("#posts_container").html(construct_pots_from_tag(data.posts));
  });

});

// New Post
$("form input, form textarea, #search").on("input",function(e){
  if($(this).data("lastval")!= $(this).val()) {
    if ($(this).val().length >= 3){
      if ($("#save_post_alert").css("display") == "block") display_alert("#save_post_alert","hide");
    }
  }
});

$("form").submit(function(event){
  event.preventDefault();
  var posting = $.post("/add_post", $(this).serialize());

  posting.done(function(data) {
    $("#save_post_alert").text("Listo!");
    display_alert("show");
  });

  posting.fail(function(data){
    var msg_error = "<ol>" + array_extract_to(data,container.errors,"<li>","</li>") + "</ol>";
    $("#save_post_alert").html(msg_error);
  });

});

// animations
function display_alert(action){
  var top = parseInt($("#save_post_alert").css("top").replace("px",""));

  if (action == "show") {
    $(".sidenav").animate({top: ((top + 72) + "px")});
    $("#save_post_alert").removeClass("hide");
    $("#save_post_alert").addClass("show");
    $("#save_post_alert").fadeTo("slow", 1);
  } else {
    $(".sidenav").animate({top: ((top - 72) + "px")});
    $("#save_post_alert").fadeTo("slow", 0, function(){
      $("#save_post_alert").removeClass("show");
      $("#save_post_alert").addClass("hide");
    });
  }
};
// html construct

function construct_pots_from_tag(posts) {
  var html = ""; var tag = "";
  search_term = search_term == null ? "Ultimos posts" : "Post para: " + search_term
  
  posts.forEach(function(data) {

    var date = new Date(data.post.created_at);
    date = date.getFullYear() + " " + (date.getMonth() + 1) + " " + date.getDate();

    var tags = "";
    data.tags.forEach(function(tag){
      tags += " <a class='label label-primary' href='"+ tag +"'>" + tag + "</a>"
    });

    html += "<h4><small>"+ search_term +"</small></h4>" +
    "<hr>" +
    "<h4>" + data.post.title + "</h4>" +
    '<h5><span class="glyphicon glyphicon-time"></span> Comentado en: ' + date + "</h5>" +
    "<h5>" +
    tags +
    "</h5>" +
    "<br>" +
    "<p>" + data.post.body + "</p>" +
    "<hr>";
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

function array_extract_to(data, element_open, element_close) {
  var out = "";

  data.errs.forEach( function(str) {
    out += element_open + srt + element_close;
  });

  return out;
};

});
