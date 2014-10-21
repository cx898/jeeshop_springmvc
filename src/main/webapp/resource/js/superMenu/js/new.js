$(document).ready(function(){
    $('.sidelist').mousemove(function(){
    	//console.log("wwww = " + $("#sidebar").width());
    	var ww = $("#sidebar").width();
    	//var cc = $("#sidebar").width()+"px";
    	$(this).find('.i-list').css("left",ww+"px")
    	//.css("width",ww+"px")
    	.show();
		$(this).find('h3').addClass('hover').css("width",ww+1+"px");
	});
	$('.sidelist').mouseleave(function(){
	$(this).find('.i-list').hide();
	$(this).find('h3').removeClass('hover');
	});
});

//slideUp