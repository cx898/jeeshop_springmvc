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
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<style type="text/css">
.centerImageCss{
	width: 560px;
	height: 180px;
}
</style>
</head>

<body>
<div id="wrap">
	<%@ include file="/indexMenu.jsp"%>
	<div class="container">
		
		<div class="row">
			<div class="col-xs-3">
				<%@ include file="/helpCatalog2.jsp"%>
			</div>
			<c:choose>
			<c:when test="${helpCode =='index'}">
				<div class="col-xs-9">
					<div class="row">
						<strong>帮助中心首页</strong>
					</div>
					<div class="row"><hr></div>
					<div class="row">
						帮助中心首页内容
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-xs-9">
					<!-- 导航写 -->
					<div class="row">
						<div class="col-xs-12">
							<ol class="breadcrumb">
							  <li><a href="<%=request.getContextPath() %>">首页</a></li>
									<c:choose>
										<c:when test="${helpCode == 'index'}">
										   <li class="active">帮助中心</li>
										</c:when>
										<c:otherwise>
										    <li><a href="<%=request.getContextPath() %>/help/index.html">帮助中心</a></li>
								  			<li class="active"><c:out value="${news.title}" escapeXml="false"/></li>
										</c:otherwise>
									</c:choose>
							</ol>
						</div>
					</div>
		
					<div class="row">
						<div class="col-xs-12">
							<strong><c:out value="${news.title}" escapeXml="false"/></strong>
							<hr>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<%String newsInfoUrl = request.getAttribute("newsInfoUrl").toString();%>
							<jsp:include flush="true" page="<%=newsInfoUrl %>"></jsp:include>
						</div>
					</div>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>	
	<%@ include file="foot.jsp"%>
</body>
</html>
