<%@page import="net.jeeshop.core.oscache.FrontCache"%>
<%@page import="net.jeeshop.services.front.attribute.bean.Attribute"%>
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
	border-color: #f40;
}
.attr_css{
	font-size: 100%;
	float: left;
}
.left_product{
	font-size: 12px;max-height: 35px;overflow: hidden;text-overflow: ellipsis;-o-text-overflow: ellipsis;
}

.left_title {
	display: block;
	/* width: 280px; */
	overflow: hidden;
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}

img.err-product {
<%if(StringUtils.isNotBlank(SystemManager.systemSetting.getDefaultProductImg())){%>
background: url(<%=SystemManager.systemSetting.getDefaultProductImg()%>) no-repeat 50% 50%;
<%}%>
}


.lazy {
  display: none;
}

</style>
<script type="text/javascript">
function defaultProductImg(){ 
	var img=event.srcElement; 
	img.src="<%=SystemManager.systemSetting.getDefaultProductImg()%>"; 
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
					<c:if test="${e.mainCatalogName!=null }">
						<div style="border: 0px solid;text-align: left;">
							<div>
								<ol class="breadcrumb" style="margin-bottom: 0px;">
								  <li><c:out escapeXml="false" value="${e.mainCatalogName}"/></li>
								  <c:if test="${e.childrenCatalogName!=null }">
									  <li class="active"><a href="#"><c:out escapeXml="false" value="${e.childrenCatalogName }"/></a></li>
								  </c:if>
								</ol>
							</div>
						</div>
					</c:if>
				</div>
				
				<!-- 条件搜索栏 -->
				<div class="row" style="margin: 10px 0px;">
					<div class="col-xs-12">
						<%
							List<Catalog> _children = null;
							List<Attribute> attrs = null;
							try{
								if(request.getAttribute("catalogCode")!=null){
									String _catalogCode = request.getAttribute("catalogCode").toString();
									//out.println("_catalogCode="+_catalogCode);
									Catalog _catalog = SystemManager.catalogsCodeMap.get(_catalogCode);//SystemManager.catalogsMap.get(Integer.valueOf(_catalogID));
									if(_catalog.getChildren()==null || _catalog.getChildren().size()==0){
										request.setAttribute("attrs", FrontCache.loadAttrByCatalogID(Integer.valueOf(_catalog.getId())));
										//request.setAttribute("_children", null);
									}else{
										request.setAttribute("attrs", null);
									}
									request.setAttribute("_children", _children = FrontCache.loadCatalogChildren(FrontCache.getPid(_catalog.getId())));
								}
							}catch(Exception e){
								e.printStackTrace();	
							}
						%>
						
						
						<c:if test="${requestScope._children!=null and requestScope._children.size != 0}">
							<div>
								<span style="margin:5px;font-weight: bold;">分类</span>
								<c:forEach items="${requestScope._children}" var="row">
								 <c:choose>
								   <c:when test="${row.code == catalogCode }">
								       <span class="label label-success" style="margin:5px;font-size:100%;">
											<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${row.code}" />.html"><c:out escapeXml="false" value="${row.name}" /></a>
										</span>
								   </c:when>
								   <c:otherwise>
								       <span class="label label-info2" style="margin:5px;font-size:100%;">
											<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${row.code}" />.html"><c:out escapeXml="false" value="${row.name}" /></a>
									   </span>
								   </c:otherwise>
								 </c:choose>
								</c:forEach>
							</div>
						</c:if>
						
						
						<c:if test="${requestScope.attrs!=null and requestScope.attrs.size!=0}">
							
							<div class="panel panel-default" style="margin:10px 0px;">
					              <div class="panel-body" style="font-weight: normal;text-align: center;">
<%-- 					              	    <span style="margin:5px;font-weight: bold;">属性</span> --%>
										<div style="padding-left: 0px;">
											<c:forEach items="requestScope.attrs" var="row">
											  <div class="row" style="margin-bottom: 5px;">
													<div class="col-xs-2" style="text-align: right;">
														<c:out escapeXml="false" value="${row.name}"/>：
													</div>
													<div class="col-xs-10" style="text-align: left;margin-left: -20px;">
														<c:forEach items="${row.attrList}" var="row2">
														  <c:choose>
														      <c:when test="${row2.id == attributeID }">
														        <span class="label label-success attr_css">
																		<a href="<%=request.getContextPath() %>/catalog/attr/<c:out escapeXml="false" value="${row2.id}" />.html?orderBy=<c:out escapeXml="false" value="${row2.orderBy}" />"><c:out escapeXml="false" value="${row2.name}" /></a>
																</span>
														      </c:when>
															  <c:otherwise>
															    <span class="label label-info2 attr_css">
																		<a href="<%=request.getContextPath() %>/catalog/attr/<c:out escapeXml="false" value="${row2.id}" />.html?orderBy=<c:out escapeXml="false" value="${row2.orderBy}" />"><c:out escapeXml="false" value="${row2.name}" /></a>
																</span> 
															  </c:otherwise>
														  </c:choose>
														</c:forEach>
														<br>
													</div>
												</div>
											</c:forEach>
						              </div>
					              </div>
							</div>
						</c:if>
					</div>
				</div>
		
				<!-- 排序栏 -->
				<c:if test="${productList !=null and productList.size !=0 }">
					<div class="row" style="margin: 0px;">
						<div class="col-xs-12">
							<span class="attr_css" style="margin:5px;font-weight: bold;">排序</span>
							<c:choose>
							<c:when test="${orderBy==1 }">
								<span class="label label-success attr_css" style="margin:5px;">
									<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${catalogCode }" />.html?orderBy=1&attributeID=<c:out escapeXml="false" value="${attributeID}" />">热门</a>
								</span>
							</c:when>
							<c:otherwise>
								<span class="label attr_css" style="margin:5px;">
									<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${catalogCode}" />.html?orderBy=1&attributeID=<c:out escapeXml="false" value="${attributeID}" />">热门</a>
								</span>
							</c:otherwise>
							</c:choose>
							
							<c:choose>
							<c:when test="${orderBy==2 }">
								<span class="label label-success attr_css" style="margin:5px;">
									<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${catalogCode}" />.html?orderBy=2&attributeID=<c:out escapeXml="false" value="${attributeID}" />">价格</a>
								</span>
							</c:when>
							<c:otherwise>
								<span class="label attr_css" style="margin:5px;">
									<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${catalogCode}" />.html?orderBy=2&attributeID=<c:out escapeXml="false" value="${attributeID}" />">价格</a>
								</span>
							</c:otherwise>
							</c:choose>
							
							<c:choose>
							<c:when test="${orderBy==3 }">
								<span class="label label-success attr_css" style="margin:5px;">
									<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="catalogCode" />.html?orderBy=3&attributeID=<c:out escapeXml="false" value="attributeID" />">最新</a>
								</span>
							</c:when>
							<c:otherwise>
								<span class="label attr_css" style="margin:5px;">
									<a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="catalogCode" />.html?orderBy=3&attributeID=<c:out escapeXml="false" value="attributeID" />">最新</a>
								</span>
							</c:otherwise>
							</c:choose>
							
						</div>
					</div>
					<div ><hr style="clear: both;"></div>
				</c:if>
				
				
				<div class="row">
					<!-- 商品展示 -->
					<div >
					<c:forEach items="${productList}" var="item">
					  <div class="col-xs-3" style="padding: 5px;text-align: center;">
							<div class="thumbnail" style="width: 100%; display: block;">
								<div style="height: 200px;border: 0px solid;text-align: center;">
									<a href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${item.id}" />.html" target="_blank">
										<img class="lazy" style="border: 0px;display: block;margin: auto;max-height: 100%;max-width: 100%;"  
										border="0" src="<%=SystemManager.systemSetting.getDefaultProductImg()%>" 
										data-original="<%=SystemManager.systemSetting.getImageRootPath()%><c:out escapeXml="false" value="${item.picture}" />">
									</a>
								</div>
								<div style="height: 40px;text-align: center;">
									<div class="col-xs-12 left_product">
										<div class="row">
											<a style="cursor: pointer;margin: auto;" href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${item.id}" />.html" target="_blank" 
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
							</div>
						</div>
					</c:forEach>
					</div>
					<c:if test="${ productList==null or productList.size==0 }">
						抱歉，没有找到<font color='#f40'><%=request.getAttribute("key")!=null?request.getAttribute("key").toString():"" %></font>相关的宝贝!
						<%request.setAttribute("key",null); %>
						<br>
						
						<div class="row">
							<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
								<div class="panel panel-default">
						              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
						              	  <div class="panel-body" style="font-size: 16px;font-weight: normal;">
							              	 <span class="glyphicon glyphicon-ok"></span>
											 <span class="text-success">您可以尝试换一个关键词或者换一个分类。</span>
							              </div>
						              </div>
								</div>
								<hr>
							</div>
						</div>
					</c:if>
				</div>
				<div class="row" style="margin-top: 10px;">
					<div class="col-xs-12" style="border: 0px solid;text-align: right;">
						<c:if test="${ productList!=null and productList.size !=0}">
							<%@ include file="pager.jsp"%>
						</c:if>
					</div>
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
