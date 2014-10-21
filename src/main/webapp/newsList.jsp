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
<html>
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

.title1{
	display: block;
	width: 600px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
</style>

</head>

<body>
<div id="wrap">
	<%@ include file="/indexMenu.jsp"%>

	<div class="container">
	
		<div class="row">
			<div class="col-xs-9">
				<div class="row">
					<div class="col-xs-12">
						<ol class="breadcrumb">
						  <li><a href="<%=request.getContextPath() %>">首页</a></li>
						  <li class="active">公告新闻</li>
						</ol>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12">
						<!-- 新闻列表 -->
						<table class="table">
							<tr>
								<td colspan="2"><h5><b>公告新闻列表</b></h5></td>
							</tr>
							<c:forEach items="${pager.list}" var="item">
							  <tr>
								<td>
									<a href="<%=request.getContextPath() %>/news/<c:out escapeXml="false" value="${item.id}"/>.html" title="<c:out escapeXml="false" value="${item.title}"/>">
										<c:out escapeXml="false" value="${item.title}" />
									</a>
								</td>
								<td>
									<c:out escapeXml="false" value="${item.createtime}" />
								</td>
							  </tr>
							</c:forEach>
						</table>
												
						<c:if test="${pager.list==null or pager.list.size==0 }">
						没有找到<font color='red'><%=request.getAttribute("key")!=null?request.getAttribute("key").toString():"" %></font>相关的宝贝!
						<%request.setAttribute("key",null); %>
						</c:if>
						<div class="row" style="margin-top: 10px;">
							<div class="col-xs-12" style="border: 0px solid;text-align: right;">
								<c:if test="${pager.list!=null and pager.list.size!=0}">
									<%@ include file="pager.jsp"%>
								</c:if>
							</div>
						</div>
				
					</div>
				</div>
				
			</div>
			
			<!-- 右边公共部分 -->
			<div class="col-xs-3">
				<div class="row">
				<%@ include file="/index_notice_slide.jsp"%>
				</br>
				<%@ include file="productlist_left_picScroll.jsp"%>
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
function defaultProductImg(){ 
	var img=event.srcElement; 
	img.src="<%=SystemManager.systemSetting.getDefaultProductImg() %>"; 
	img.onerror=null; //控制不要一直跳动 
}
</script>
</body>
</html>
