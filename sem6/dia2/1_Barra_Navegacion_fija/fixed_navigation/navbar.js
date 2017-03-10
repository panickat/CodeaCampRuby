var timer;

 $(window).bind('scroll',function () {
     clearTimeout(timer);
     timer = setTimeout( refresh , 100 );
 });

 var refresh = function () {

  var scroll = $(window).scrollTop();

     if (scroll < 25) {
       $( ".top-nav" ).fadeTo( "slow", 1 );

     } else if (scroll >= 25 ) {

       $( ".top-nav" ).fadeTo( "slow", 0.75 );
     }
 };
