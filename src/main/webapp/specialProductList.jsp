<%@page import="net.jeeshop.services.front.attribute.bean.Attribute"%>
<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="net.jeeshop.services.front.product.bean.Product"%>
<%@page import="net.jeeshop.services.front.product.ProductService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.core.FrontContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<style type="text/css">
img{border: 0px;}

.thumbnail_css{
	border-color: red;
}
.attr_css{
	font-size: 100%;
	float: left;
}
.left_product{
	font-size: 12px;max-height: 35px;overflow: hidden;text-overflow: ellipsis;-o-text-overflow: ellipsis;
}
.lazy {
  display: none;
}
</style>
<script type="text/javascript">
function defaultProductImg(){ 
	var img=event.srcElement; 
	img.src="<%=SystemManager.systemSetting.getDefaultProductImg() %>"; 
	img.onerror=null; //控制不要一直跳动 
}
</script>
</head>

<body>
	<%@ include file="/indexMenu.jsp"%>

	<div class="container">
	
		<div class="row">
			
			<div class="col-xs-3" style="margin-top: -15px;">
					<%@ include file="/catalog_superMenu.jsp"%>
					</br>
					<%@ include file="productlist_left_picScroll.jsp"%>
			</div>
			<div class="col-xs-9">
				<!-- 导航栏 -->
				<div class="row">
					<%
						Map<String,String> map = new HashMap<String,String>();
						map.put("hot", "热门");
						map.put("sale", "特价");
						map.put("newest", "新品");
						application.setAttribute("map", map);
					%>
					<div>
						<span style="margin:5px;font-weight: bold;">类型：</span>
						<c:forEach items="${applicationScope.map}" var="row">
							<c:choose>
							<c:when test="${row.key == 'special' }">
						      	<span class="label label-success" style="margin-right:5px;font-size:100%;">
									<a href="<%=request.getContextPath() %>/special/<c:out escapeXml="false" value="${row.key}"/>.html"><c:out escapeXml="false" value="${row.value}" /></a>
								</span>
							</c:when>
							<c:otherwise>
							    <span class="label" style="margin-right:5px;font-size:100%;">
									<a href="<%=request.getContextPath() %>/special/<c:out escapeXml="false" value="${row.key}"/>.html"><c:out escapeXml="false" value="${row.value}" /></a>
								</span>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<hr>
				</div>
				
				<div class="row">
					<c:forEach items="${productList}" var="item">
						<div class="col-xs-3" style="padding: 5px;text-align: center;">
							<div class="thumbnail" style="width: 100%; display: block;">
								<div style="height: 150px;border: 0px solid;">
									<a href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${item.id}" />.html" target="_blank">
										<img class="lazy" style="border: 0px;display: block;margin: auto;max-height: 100%;max-width: 100;"  
										border="0" src="<%=SystemManager.systemSetting.getDefaultProductImg()%>" 
										data-original="<%=SystemManager.systemSetting.getImageRootPath()%><c:out escapeXml="false" value="${item.picture}" />">
									</a>
								</div>
								<div style="height: 40px;">
									<div class="col-xs-12 left_product">
										<div class="row">
											<a style="cursor: pointer;" href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${item.id}" />.html" target="_blank" 
											title="<c:out escapeXml="false" value="${item.name}" />">
												<c:out escapeXml="false" value="${item.name}" />
											</a>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<b style="font-weight: bold;color: #cc0000;">
											￥<c:out escapeXml="false" value="${item.nowPrice}" />
										</b>
									</div>
									<div class="col-xs-6">
										<b style="text-decoration: line-through;font-weight: normal;font-size: 11px;color: #a5a5a5;">
											￥<c:out escapeXml="false" value="${item.price}" />
										</b>
									</div>
								</div>
								<div class="row" style="display: none;">
									<div class="col-xs-12">
										<c:choose>
										  <c:when test="${item.isnew == 1 }">
										     <div>1天前上架</div>
										  </c:when>
										  <c:otherwise>
										     <div>活动已结束!</div>
										  </c:otherwise>
										</c:choose>
										
										<c:choose>
										 <c:when test="${item.sale == 1 }">
										     <div>还剩余12小时结束</div>
										  </c:when>
										  <c:otherwise>
										     <div>活动已结束!</div>
										  </c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<c:if test="${productList==null or productList.size==0  }">
					没有找到<font color='red'><%=request.getAttribute("key")!=null?request.getAttribute("key").toString():"" %></font>相关的宝贝!
					<%request.setAttribute("key",null); %>
					</c:if>
				</div>
				<br style="clear: both;">
				<div style="text-align: right;">
					<c:if test="${productList!=null and productList.size != 0}">
						<%@ include file="pager.jsp"%>
					</c:if>
				</div>
		
			</div>
		</div>
	</div>
	
<%@ include file="foot.jsp"%>
<%@ include file="index_superSlide_js.jsp"%>
<script type="text/javascript">
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
