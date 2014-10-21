<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 图标 -->
<div id="site-navbar" style="position: fixed;z-index: 2000;right: 35px; bottom: 100px;">
<!-- <div id="site-navbar" style="position: fixed; border: 0; z-index: 2000; padding: 0; margin: 0; right: 135px; bottom: 100px;"> -->
	<div class="panel panel-default">
		<div class="panel-heading" style="display: none;">
			<a href="#here" title="快速回复"><img src="<%=request.getContextPath() %>/resource/images/comment_new.gif"/></a>
		</div>
		<div class="panel-body" style="cursor: pointer;" id="returnTop" href="#toTop" onclick="scrollWindow()">
			<a href="#toTop" name="toTop" title="返回顶部"><span class="glyphicon glyphicon-plane"></span></a>
<%-- 			<a href="#toTop" name="toTop" title="返回顶部"><img src="<%=request.getContextPath() %>/resource/images/arrow_large_up.png"/></a> --%>
		</div>
		<div class="panel-footer" style="display: none;cursor: pointer;">
			<a style="width: 100%;height: 100%;border: 1px solid red;" title="返回列表" onclick="javascript:history.back();"><img src="<%=request.getContextPath() %>/resource/images/box.gif"/></a>
		</div>
	</div>
</div>
<style type="text/css">
.thumbnail_css22{
	background-color:Red;
}
</style>
<script type="text/javascript">
$(function() {
	$("#returnTop").hover(function() {
		//$(this).addClass("thumbnail_css22");
	}, function() {
		//$(this).removeClass("thumbnail_css22");
	});
	
	//$('#returnTop').click(function() {
        //scoll the page back to the top
       // $(document).scrollTo(0,2000);
    //});
	
	
});

function scrollWindow(){
	window.scrollTo(0,0);
}
</script>