// http://codea.mx/

$(".flexslider .slide.slide-1").css("background","url(https://pbs.twimg.com/profile_banners/73992972/1428610116/1500x500)");

$("section").each(function(){
  $(this).on("mouseover", function(){
    $(this).animate(
      {
        opacity: 0,
        width:0,
        heigth:0
      }
      ,1500, function(){
        $(this).css("display","none")
      })
    });
  });
