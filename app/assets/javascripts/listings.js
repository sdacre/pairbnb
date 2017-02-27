$( document ).ready(function() {
	console.log( "ready!" );
	$('.carousel').carousel();
	$( '.item:first' ).addClass( 'active');
});
