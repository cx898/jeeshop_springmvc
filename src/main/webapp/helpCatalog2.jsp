<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->

<div class="panel panel-primary">
	<div class="panel-heading">帮助中心</div>
  <div class="panel-body">
    	<ul>
    	<c:forEach items="${applicationScope.newCatalogs}" var="help">
    	   <li class="list-item0">
				<h5>
					<c:out escapeXml="false" value="${help.name}" />
				</h5>
				<c:forEach items="${help.news}" var="item">
				  <div style="margin-left: 20px;">
					<a href="<%=request.getContextPath()%>/help/<c:out escapeXml="false" value="${item.code}" />.html"><c:out escapeXml="false" value="${item.title}"/></a>
				 </div>
				</c:forEach>
			</li>
    	</c:forEach>
    	</ul>
  </div>
</div>


