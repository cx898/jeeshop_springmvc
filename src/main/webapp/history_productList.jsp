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
<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 浏览过的商品历史列表，仅限于当前session中存储 -->
<div class="row" >
	<h4 class="topCss">浏览过的商品</h4>
</div>
<c:forEach var="item" items="${sessionScope.history_product_map}">
<div class="row">
		<div class="col-xs-3">
			<a href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${item.value.id}" />.html" target="_blank" title="<c:out escapeXml="false" value="${item.value.name}" />">
				<img class="lazy" style="border: 0px;display: block;margin: auto;width: 50px;height: 50px;" 
									src="<%=SystemManager.systemSetting.getDefaultProductImg()%>" 
									data-original="<%=SystemManager.systemSetting.getImageRootPath() %><c:out escapeXml="false" value="${item.value.picture}" />" />
			</a>
		</div>
		<div class="col-xs-9">
			<h4>
				<div class="left_product">
					<a title="<c:out escapeXml="false" value="${item.value.name}" />" href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${item.value.id}" />.html" target="_blank">
						<c:out escapeXml="false" value="${item.value.name}" />
					</a>
				</div>
			</h4>
			<div class="row">
				<div class="col-xs-6">
					<b style="font-weight: bold;color: #cc0000;">
						￥<c:out escapeXml="false" value="${item.value.nowPrice}" />
					</b>
				</div>
				<div class="col-xs-6">
					<b style="text-decoration: line-through;font-weight: normal;font-size: 11px;color: #a5a5a5;">
						￥<c:out escapeXml="false" value="${item.value.price}" />
					</b>
				</div>
			</div>
		</div>
	</div>
	<br>
</c:forEach>