<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
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
				<div class="row">
					<div class="col-xs-9">
							<div class="row" style="border:0px solid red;padding: 5px;">
								<%@ include file="/index_center_slide.jsp"%>
							</div>
					</div>
					<div class="col-xs-3">
<!-- 							<div style="border:1px solid red;"></div> -->
							<div class="row" style="border:0px solid red;padding: 5px;">
								<%@ include file="/index_notice_slide.jsp"%>
							</div>
					</div>
				</div>
				
<!-- 				<div class="row" style="display: none;"> -->
<!-- 					<div class="col-md-12"> -->
<%-- 						<%@ include file="/index_center_picBtn_slide.jsp"%> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				
				<!-- 轮播插件展示商品-->
<!-- 				<div class="row" style="margin-top: 0px;display: none;"> -->
<!-- 					<div class="col-md-12"> -->
<%-- 						<%@ include file="/index_product_slide2.jsp"%> --%>
<%-- 						<%@ include file="/index_product_slide.jsp"%> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				
				<%String indexProductListUrl = "index_productList.jsp?queryType=hot";%>
				<jsp:include flush="true" page="<%=indexProductListUrl %>"></jsp:include>
				
				<%indexProductListUrl = "index_productList.jsp?queryType=sale";%>
				<jsp:include flush="true" page="<%=indexProductListUrl %>"></jsp:include>
				
				<%indexProductListUrl = "index_productList.jsp?queryType=newest";%>
				<jsp:include flush="true" page="<%=indexProductListUrl %>"></jsp:include>
<%-- 				<%@ include file="/index_productList.jsp?queryType=hot"%> --%>
			</div>
			
		</div>
	</div>
	<%@ include file="foot.jsp"%>
	<%@ include file="index_superSlide_js.jsp"%>
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
