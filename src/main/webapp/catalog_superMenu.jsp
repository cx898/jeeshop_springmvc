<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="net.jeeshop.services.front.catalog.bean.Catalog"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="java.util.LinkedList"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.Collections"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="java.util.List"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/js/superMenu/css/css.css"
	type="text/css">

<div id="sidebar">
	 <c:forEach items="${applicationScope.catalogs}" var="superType">  
	  <div class="sidelist">
			<span>
				<h3>
					<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${superType.code}" />.html"><c:out escapeXml="false" value="${superType.name}" /></a>
				</h3>
			</span>
			<div class="i-list">
				<ul>
					 <c:forEach items="${superType.children}" var="smallType">  
					  <li>
		          			<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${smallType.code}" />.html"><c:out escapeXml="false" value="${smallType.name}" /></a>
						</li>
					 </c:forEach>
				</ul>
				<div style="clear: both;"></div>
				
				<c:if test="${superType.superMenuProducts!=null}">
					<div style="border-top: 1px solid #f40;clear: both;" class="hotText">
						<div style="font-weight: bold;padding-top: 5px;padding-bottom: 5px;">推荐热卖：</div>
						
					 <c:forEach items="${superType.superMenuProducts}" var="product">  
					  <div style="margin-top: 5px;">
								&gt;<a title="<c:out escapeXml="false" value="${product.name}" />" target="_blank" href="<%=SystemManager.systemSetting.getWww() %>/product/<c:out escapeXml="false" value="${product.id}" />.html">
									<c:out escapeXml="false" value="${product.name}" />
								</a>
							</div>
					 </c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	 </c:forEach>
</div>