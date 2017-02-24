$( document ).ready(function() {
	console.log( "ready!" );
	$(function(){
	     $('.carousel').carousel();
	     $( '.item:first' ).addClass( 'active');
	});

});
