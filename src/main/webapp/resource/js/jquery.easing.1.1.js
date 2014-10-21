/* 
 * Please note: 
 * This is not the easing plugin, for that you need to go to 
 * http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js 
 * Many thanks,
 * George
 */

if ( ! window.jQuery) {
	document.write('<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min.js">\x3C/script>');
	document.write('<script src="//gsgd.co.uk/sandbox/jquery/easing.notification.2.js">\x3C/script>');
}
else
{
	jQuery(function() {
		jQuery('body').append('<div style="z-index:1000;text-align:center;font-family:sans-serif;color:#FFF !important;font-size:24px !important;position:absolute;top:50px;left:0px;margin:0 !important;padding:0px !important;width:100%;background:rgb(0,0,0);background:rgba(0,0,0,0.8);border-top:5px solid #FF0;border-bottom:5px solid #FF0;"><p style="margin:10px 5px !important;padding:0 !important;line-height:28px;position:relative;color:#FFF !important;">Please stop hotlinking <a style="color:#FF0 !important" target="_new" href="https://github.com/gdsmith/jquery.easing">my easing script</a> &mdash; use a real <a style="color:#FF0 !important" target="_new" href="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js">CDN</a> instead. Many thanks <span id="gsgd_hotlink_2" alt="close" title="close" style="cursor:pointer;font-size:18px !important;position:absolute;top:5px;right:5px;background:#C00 !important; color:#FFF !important;width:18px !important;height:18px !important;line-height:16px !important;border-radius:9px;">&#215;</span></p></div>');
		jQuery('#gsgd_hotlink_2').click(function(){jQuery(this).parents('div').fadeOut('slow', function() {jQuery(this).remove()});});
	});
}
