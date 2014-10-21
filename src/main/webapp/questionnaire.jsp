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

<link rel="shortcut icon" href="<%=SystemManager.systemSetting.getShortcuticon()%>">
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
				<%
					//request.setAttribute("_question", SystemManager.question);
				%>
				<form action="/question/submitQuestion.html" namespace="/" theme="simple" id="form">
				<div class="panel panel-default">
					    <div class="panel-heading"><c:out value="e.title" escapeXml="false"/></div>
					  		<div class="panel-body">
					    	<p><c:out value="e.title2" escapeXml="false"/></p>
					    </div>
					 <c:forEach items="${e.questionnaireItemMap}" var="item" varStatus="vs">  
					  <ul class="list-group">
						<li class="list-group-item">
							<c:out value="${vs.index+1}" escapeXml="false"/>
							<c:out escapeXml="false" value="${item.value.subject}" /><br>
							<div style="margin-left: 20px;">
								<div style="display: table-row;">
								
								<c:choose>
									<c:when test="${item.value.display == 'inline'}">
									    <c:forEach items="item.value.optionList" var="option" varStatus="vsInner">
									      <div class="pull-left" style="margin-right: 30px;">
												<c:if test="${!option.value.type == 'text' }">
													<c:out escapeXml="false" value="#ii.index+1" />)、
												</c:if>
												<c:choose>
													<c:when test="${!option.value.type == 'radio' }">
													   <input type="radio" name="<c:out escapeXml="false" value="${option.value.id}" />"/>
													</c:when>
													<c:when test="${!option.value.type == 'radio' }">
													   <input type="checkbox" name="<c:out escapeXml="false" value="${option.value.id}" />"/>
													</c:when>
													<c:otherwise>
														<!--  rows cols 没有值，自己选填的 -->
													   <textarea rows="3" cols="3">${option.value.id}</textarea>
													</c:otherwise>
												</c:choose>
												<c:if test="${!option.value.type == 'text' }">
													<c:out escapeXml="false" value="option" />
												</c:if>
											</div>
									    </c:forEach>
									</c:when>
									<c:otherwise>
									  
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</li>
					</ul>
					</c:forEach>
				<div class="panel-footer" style="text-align: center;">
					<input type="submit" method="submitQuestion" action="questionnaire"  onclick="return onSubmit(this);" 
					value="提交问卷" class="btn btn-warning btn-sm"/>
				</div>
				</div>
				</form>
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
