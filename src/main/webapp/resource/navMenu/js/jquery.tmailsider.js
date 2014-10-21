/*
	Author:It小莫(liyu);
	date:2013-05-7;
	QQ:414329354;
	blog:http://www.smallmo.com/;
*/
(function($) {
	$.fn.sliders = function(options) {
		var opts = $.extend( {}, $.fn.sliders.defaults, options);
		var that = this;
		var left=false;
		var right=true;
		var scrollTimeOut=null;
		var Z_MenuList = $(that).find('.items');
		var mList = $(Z_MenuList).find('ul li');
		var isIE = navigator.userAgent.indexOf('MSIE') != -1;
		//显示
		$(that).find('a.bleft').on('click',function(){
			if(left){
				mList.find('p').removeClass('scroll');
				$(this).parent().removeClass('bleft').addClass('bright');
				left=false;
				right=true;
			}
		})
		$(that).find('a.bright').on('click',function(){
			if(right){
				mList.find('p').addClass('scroll');
				$(this).parent().removeClass('bright').addClass('bleft');
				left=true;
				right=false;
			}
		});
		//阻止冒泡
		mList.each(function(index,elem){	
			 $(this).on('mouseover',function(event){
				event.stopPropagation();
				$(that).children('.box').hide().children('.hide').hide();
				$(that).children('.box').show().children('.hide').eq(index).show();				  
			 })					
		})
		$(document).on('mouseover',function(){
			$(that).children('.box').hide().children('.hide').hide();								
		})
		$(that).children('.box').on('mouseover',function(event){
			event.stopPropagation();								
		})
		// 折叠
		function OpenOrCloseMenu(l) {
			for(var i = 0; i < l; i++) {
				if(i < mList.length) {
					var thisLi = $(mList[i]);
					if(isIE){//IE的靠边站
						$(thisLi).find('p').slideDown(1000);
					}else{
						$(thisLi).find('p').addClass('scroll');
					}
				}
			}
			for(var i = mList.length - 1; i >= l; i--) {
				if(i >= 0) {
					var thisLi = $(mList[i]);
					if(isIE){//IE的靠边站
						$(thisLi).find('p').slideUp(1000);
					}else{
						$(thisLi).find('p').removeClass('scroll');
					}
				}
			}
		};
		// 滚定折叠
		$(window).scroll(function() {
			var sTop = $(window).scrollTop();
			if(sTop>parseInt($(that).css('top'))){
				$(that).css('top','0');
			}else{
				$(that).css('top','93px');
			}
			if(right){
				clearTimeout(scrollTimeOut);
				if(sTop >= opts.cTop) {
					var l = parseInt((sTop - opts.fTop - opts.cTop)/opts.unitHeight);
					scrollTimeOut =window.setTimeout(function() {
						OpenOrCloseMenu(l);
					},200);
				} else {
					scrollTimeOut = window.setTimeout(function() {
						OpenOrCloseMenu(0);
					},200);
				}		
			}
		});
	};
	// 默认配置项
	$.fn.sliders.defaults = {
		fTop: 60, // 距离顶部距离
		cTop: 100, // 滚动条滚动多少像素后开始折叠的高度
		unitHeight: 80// 每滚动多少距离折叠一个
	};
})(jQuery);