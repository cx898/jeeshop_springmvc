<%@page import="net.jeeshop.services.front.product.bean.Product"%>
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


<style>

.fdsfsdf{
	-moz-box-shadow:5px 5px 5px #ccc;              
    -webkit-box-shadow:5px 5px 5px #ccc;           
    box-shadow:5px 5px 5px #ccc;    
}
</style>
<%
String queryType = request.getParameter("queryType");
//out.println("queryType="+queryType);
String _indexProductList_title = null;
List<Product> _productList = SystemManager.activityProductMap.get(queryType);
if(_productList==null || _productList.size()==0){
	//out.println("_productList=0");
	request.setAttribute("_activity_indexProductList_productList", null);
}else{
	//out.println("_productList="+_productList.size());
	request.setAttribute("_activity_indexProductList_productList", _productList);
}


if(StringUtils.isBlank(queryType)){
	throw new NullPointerException("queryType is null");
}else if(queryType.equals("r")){
	_indexProductList_title = "降价促销";
}else if(queryType.equals("d")){
	_indexProductList_title = "打折促销";
}else if(queryType.equals("s")){
	_indexProductList_title = "买就赠送双倍积分";
}
request.setAttribute("queryType", queryType);
%>

<!-- 首页不同商品的展示 -->
<c:choose>
<c:when test="${_activity_indexProductList_productList != null}">

	<div class="row" class="col-xs-12" style="padding: 5px;">
		<div class="alert alert-success" style="margin-bottom: 5px;margin-top: 5px;display: none;">
			<c:choose>
				<c:when test="${queryType == 'y'}">
				   <span class="glyphicon glyphicon-arrow-down"></span>
				</c:when>
				<c:when test="${queryType == 'd'}">
				   <span class="glyphicon glyphicon-flash"></span>
				</c:when>
				<c:when test="${queryType == 's'}">
				   <span class="glyphicon glyphicon-plus"></span>
				</c:when>
			</c:choose>
			
			&nbsp;<%=_indexProductList_title %>
<%-- 			<a href="<%=request.getContextPath() %>/special/<%=queryType %>.html" target="_blank"> --%>
<%-- 				<span style="float:right">[更多]</span> --%>
<!-- 			</a> -->
		</div>
		<div class="page-header fdsfsdf" style="border-bottom: 2px solid #e33a3d;margin: 20px 0 20px;">
		  <h5>
			<c:choose>
				<c:when test="${queryType == 'y'}">
				   <span class="glyphicon glyphicon-arrow-down"></span>
				</c:when>
				<c:when test="${queryType == 'd'}">
				   <span class="glyphicon glyphicon-flash"></span>
				</c:when>
				<c:when test="${queryType == 's'}">
				   <span class="glyphicon glyphicon-plus"></span>
				</c:when>
			</c:choose>
		  <strong><%=_indexProductList_title %></strong></h5>
<%-- 		  <h3><strong><small><%=_indexProductList_title %></small></strong></h3> --%>
		</div>

	</div>
<div class="row" style="border:0px solid red;">
		
		 <c:forEach items="${_activity_indexProductList_productList}" var="row">  
		   <div class="col-xs-3" style="padding: 5px;text-align: center;">
				<div class="thumbnail" style="width: 100%; display: block;margin-bottom: 10px;">
					<div style="height: 200px;border: 0px solid;">
						<a href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${row.id}" />.html" target="_blank">
							<img class="lazy" style="border: 0px;display: block;margin: auto;max-height: 100%;max-width: 100%;"  
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
						
						<c:choose>
							<c:when test="${queryType == 'd'}">
							   <span class="badge pull-left">折扣价
									<b style="font-weight: bold;">
										￥<c:out escapeXml="false" value="${row.finalPrice}" />
									</b>
								</span>
							</c:when>
							<c:when test="${queryType == 'r'}">
									<c:choose>
										<c:when test="${expire}">
										   <span class="label label-default">促销价
												<b style="font-weight: bold;">
													￥<c:out escapeXml="false" value="${row.finalPrice}" />
												</b>
											</span>
										</c:when>
										<c:otherwise>
											  <span class="label label-danger">促销价
													<b style="font-weight: bold;">
														￥<c:out escapeXml="false" value="${row.finalPrice}" />
													</b>
												</span>
										</c:otherwise>
									</c:choose>
							</c:when>
							<c:when test="${queryType == 's'}">
							   <b style="font-weight: bold;">
									￥<c:out escapeXml="false" value="${row.nowPrice}" />
								</b>
							</c:when>
						</c:choose>
							
						</div>
						<div class="col-xs-6" style="text-align: right;">
							<b style="text-decoration: line-through;font-weight: normal;font-size: 11px;color: #a5a5a5;">
								￥<c:out escapeXml="false" value="${row.price}" />
							</b>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12">
					
					<c:choose>
						<c:when test="${expire}">
						   活动已到期
						</c:when>
						<c:otherwise>
		  					<c:choose>
								<c:when test="${queryType == 'd'}">
								   还剩<div style="display: inline;" timer="activityEndDateTime" activityEndDateTime="<c:out escapeXml="false" value="${row.activityEndDateTime}" />"></div>
									<span class="badge pull-right" style="background-color:red;"><c:out escapeXml="false" value="${row.discountFormat}" />折</span>
								</c:when>
								<c:when test="${queryType == 'r'}">
								还剩<div style="display: inline;" timer="activityEndDateTime" activityEndDateTime="<c:out escapeXml="false" value="${row.activityEndDateTime}" />"></div>   
								</c:when>
								<c:when test="${queryType == 's'}">
								还剩<div style="display: inline;" timer="activityEndDateTime" activityEndDateTime="<c:out escapeXml="false" value="${row.activityEndDateTime}" />"></div>
									<span class="label label-success">双倍积分</span>   
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
						</div>
					</div>
					
				</div>
			</div>
		 </c:forEach>
	</div>
</c:when>
<c:otherwise>
<!-- 	此活动暂未发布商品！敬请期待！ -->
</c:otherwise>
</c:choose>