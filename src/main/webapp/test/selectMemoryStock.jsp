<%@page import="net.jeeshop.services.front.product.bean.ProductStockInfo"%>
<%@page import="java.util.concurrent.ConcurrentMap"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.centerImageCss{
	width: 560px;
	height: 180px;
}
</style>
</head>

<body style="text-align: center;">
	<table class="table table-bordered" style="width: 90%;margin: auto;">
		<tr>
			<td>商品ID</td>
			<td>商品库存数</td>
			<td>库存是否有所改变</td>
		</tr>
		<%
		ConcurrentMap<String, ProductStockInfo> productStockMap = SystemManager.productStockMap;
		System.out.println(""+productStockMap.size());
		request.setAttribute("productStockMap", productStockMap);
		%>
		<tr>
			<td colspan="3">
				商品数：<c:out value="${fn:length(requestScope.productStockMap)}"/>
			</td>
		</tr>
		<c:choose>
		  <c:when test="${requestScope.productStockMap!=null}">
		    <c:forEach items="${productStockMap}" var="row">
		       <tr>
					<td><c:out value="${row.value.id}"/></td>
					<td><c:out value="${row.value.stock}"/></td>
					<td><c:out value="${row.value.changeStock}"/></td>
				</tr>
		    </c:forEach>
		  </c:when>
		  <c:otherwise>
		  </c:otherwise>
		</c:choose>
	</table>
</body>
</html>
