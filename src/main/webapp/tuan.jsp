<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<%
String responsive = request.getParameter("responsive");
System.out.println("responsive="+responsive);
if(StringUtils.isNotBlank(responsive)){
	request.getSession().setAttribute("responsive", responsive);
}else{
	request.getSession().setAttribute("responsive", "n");
}
%>

<meta property="qc:admins" content="50702666757625530706654" />
<meta property="wb:webmaster" content="28e244326adb6a77" />
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<style type="text/css">
.alert123{
/* 	padding: 10px; */
	margin-bottom: 5px;margin-top: 10px;margin-right: -15px;
}
.product_css{
	height: 200px;border: 0px solid #ccc;
}
.left_product{
	font-size: 12px;max-height: 35px;overflow: hidden;text-overflow: ellipsis;-o-text-overflow: ellipsis;
}
img{border: 0px;}

.thumbnail_css{
	border-color: red;
}
img.err-product {
<%if(StringUtils.isNotBlank(SystemManager.systemSetting.getDefaultProductImg())){%>
background: url(<%=SystemManager.systemSetting.getDefaultProductImg()%>) no-repeat 50% 50%;
<%}%>
}
.lazy {
  display: none;
}
</style>
<script>
function defaultProductImg(){ 
	var img=event.srcElement; 
	img.src="<%=SystemManager.systemSetting.getDefaultProductImg()%>"; 
	img.onerror=null; //控制不要一直跳动 
}
</script>
</head>

<body >
	<%
	request.getSession().setAttribute(net.jeeshop.core.FrontContainer.selectMenu, "tuan");
	%>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container" >
		<div class="row">
			<!-- 左侧导航栏、热卖商品、文章、事项 -->
			<div class="col-xs-3" style="margin-top: -15px;">
				<%@ include file="/catalog_superMenu.jsp"%>
				</br>
				<%@ include file="productlist_left_picScroll.jsp"%>
			</div>
			<!-- 右侧。滚动图片、新闻活动、首页商品展示 -->
			<div class="col-xs-9" style="margin-top: -10px;">
				<%String indexProductListUrl = "/front/activityTuan_common_productList.jsp?queryType=j";%>
				<jsp:include flush="true" page="<%=indexProductListUrl %>"></jsp:include>
			</div>
			
		</div>
	</div>
	<%@ include file="foot.jsp"%>
	<%@ include file="index_superSlide_js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/front.js"></script>
<script>
$(function() {
	//商品鼠标移动效果
	$("div[class=thumbnail]").hover(function() {
		$(this).addClass("thumbnail_css");
	}, function() {
		$(this).removeClass("thumbnail_css");
	});
	
});
</script>
</body>
</html>
