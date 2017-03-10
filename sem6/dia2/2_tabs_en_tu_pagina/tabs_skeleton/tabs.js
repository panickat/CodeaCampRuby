$(document).ready(function () {

$("#tab1").removeClass("tab")

  $(".tabs").click(function(item){

    var current_tab = $(item.target).attr("href");
    if (current_tab == null) {return}

    $(current_tab).removeClass("tab");
    //children li de this
    $("li", this).each( function(index, element){

      tab = $(element).children("a").attr("href");
      if (tab == current_tab) {
        $(element).addClass("active")
      } else {
        $(tab).addClass("tab");
        $(this).removeClass("active");
      };

    });

  });

});
