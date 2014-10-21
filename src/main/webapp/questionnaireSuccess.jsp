<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="net.jeeshop.services.front.product.bean.Product"%>
<%@page import="net.jeeshop.services.front.product.ProductService"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.FrontContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<c:choose>
	<c:when test="${e.title==null or e.title==''}">
	   <title><c:out value="${e.name}" escapeXml="false"/></title>
	</c:when>
	<c:otherwise>
	  	<title><c:out value="${e.title}" escapeXml="false"/></title>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${e.description==null or e.description==''}">
	   <meta name="description" content="<c:out value="${e.name}" escapeXml="false"/>" />
	</c:when>
	<c:otherwise>
	  <meta name="description" content="<c:out value="${e.description}" escapeXml="false"/>" />
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${e.keywords==null or e.keywords==''}">
	   <meta name="keywords"  content="<c:out value="${e.name}" escapeXml="false"/>" />
	</c:when>
	<c:otherwise>
	  <meta name="keywords"  content="<c:out value="${e.keywords}" escapeXml="false"/>" />
	</c:otherwise>
</c:choose>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resource/images/favicon.png">
<%@ include file="/resource/common_css.jsp"%>
<style type="text/css">
.topCss {
	height: 28px;
	line-height: 28px;
	background-color: #f8f8f8;
	border-bottom: 1px solid #E6E6E6;
	padding-left: 9px;
	font-size: 14px;
	font-weight: bold;
	position: relative;
	margin-top: 0px;
}
</style>
<script>
function defaultProductImg(){ 
	var img=event.srcElement; 
	img.src="<%=SystemManager.systemSetting.getDefaultProductImg() %>"; 
	img.onerror=null; //控制不要一直跳动 
}
</script>
</head>

<body>
	<div id="wrap">
		<%@ include file="indexMenu.jsp"%>
		<div class="container">

			<div class="row">
				<!-- 问卷题目列表 -->
				感谢您参与了本次问卷调查！您将有机会抽取奖品！
			</div>
		</div>
	</div>
	<%@ include file="foot.jsp"%>
<script>
$(function() {
});
</script>
</body>
</html>
