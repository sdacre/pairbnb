$( document ).ready(function() {
	console.log( "ready!" );
	$('.carousel').carousel();
	$( '.item:first' ).addClass( 'active');
	$(".error").append("<p>Please fill all fields</p>");
});

