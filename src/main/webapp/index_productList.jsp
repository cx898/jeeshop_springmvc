<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String queryType = request.getParameter("queryType");
//out.println("queryType="+queryType);
String _indexProductList_title = null;
if(StringUtils.isBlank(queryType)){
	throw new NullPointerException("queryType is null");
}else if(queryType.equals("hot")){
	_indexProductList_title = "热门商品";
	request.setAttribute("_indexProductList_productList", SystemManager.hotProducts);
}else if(queryType.equals("sale")){
	_indexProductList_title = "特价商品";
	request.setAttribute("_indexProductList_productList", SystemManager.saleProducts);
}else if(queryType.equals("newest")){
	_indexProductList_title = "最新商品";
	request.setAttribute("_indexProductList_productList", SystemManager.newProducts);
}
%>

<!-- 首页不同商品的展示 -->

	<div class="row" class="col-xs-12" style="padding: 5px;">
		<div class="alert alert-info" style="margin-bottom: 5px;margin-top: 5px;">
			<%=_indexProductList_title %>
			<a href="<%=request.getContextPath() %>/special/<%=queryType %>.html" target="_blank">
				<span style="float:right">[更多]</span>
			</a>
		</div>
	</div>
<div class="row" style="border:0px solid red;">
		
		 <c:forEach items="${_indexProductList_productList}" var="row">  
		  <div class="col-xs-3" style="padding: 5px;text-align: center;">
				<div class="thumbnail" style="width: 100%; display: block;margin-bottom: 10px;">
					<div style="height: 200px;border: 0px solid;">
						<a href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${row.id}" />.html" target="_blank">
							
							<img class="lazy err-product22" style="border: 0px;display: block;margin: auto;max-height: 100%;max-width: 100;"  
							border="0" src="<%=SystemManager.systemSetting.getDefaultProductImg()%>" 
							data-original="<%=SystemManager.systemSetting.getImageRootPath()%><c:out escapeXml="false" value="${row.picture}" />">
						</a>
					</div>
					<div style="height: 40px;">
						<div class="col-xs-12 left_product">
							<div class="row">
								<a style="cursor: pointer;" href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${row.id}" />.html" target="_blank" 
								title="<c:out escapeXml="false" value="${row.name}" />">
									<c:out escapeXml="false" value="${row.name}" />
								</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<b style="font-weight: bold;color: #cc0000;">
								￥<c:out escapeXml="false" value="${row.nowPrice}" />
							</b>
						</div>
						<div class="col-xs-6">
							<b style="text-decoration: line-through;font-weight: normal;font-size: 11px;color: #a5a5a5;">
								￥<c:out escapeXml="false" value="${row.price}" />
							</b>
						</div>
					</div>
				</div>
			</div>
		 </c:forEach>
	</div>


