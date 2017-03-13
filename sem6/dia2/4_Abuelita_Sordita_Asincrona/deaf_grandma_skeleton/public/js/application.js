$(document).ready(function() {


  $( "#frm" ).submit(function( event ) {

    event.preventDefault();
    var posting = $.post( "/abuelita", $(this).serialize());

    posting.done(function( data ) {
      $("#grandma_says").text(data);
      $("#answer_line").fadeTo( "slow", 1 );
    });

  });

jQuery('#frm > input').on('input', function() {
    $("#answer_line").fadeTo( "slow", 0 );
  });

});
