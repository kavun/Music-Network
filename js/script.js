// author: Kevin Reed http://www.kevreed.com/

var leftWidth = $("#left").width();

$(window).load( function() {
	var width = $(window).width() - leftWidth;
	$("#container").width(width);
} );
$(window).resize( function() {
	var width = $(window).width() - leftWidth;
	$("#container").width(width);
} );

function goTo(url) {
	window.location=url;
}