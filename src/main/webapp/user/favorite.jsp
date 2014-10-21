<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>

</head>
<body>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-3">
				<%@ include file="userLeft.jsp"%>
			</div>
			<div class="col-xs-9">
				<div class="row">
				
					<c:choose>
						<c:when test="${pager.list!=null and pager.pagerSize>=1}">
						   <table class="table table-bordered">
						<tr>
							<td>商品</td>
							<td width="100px">收藏日期</td>
						</tr>
							 <c:forEach items="${pager.list}" var="fav">  
							  <tr>
									<td>
										<a href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${fav.productID}" />.html" target="_blank" title="<c:out escapeXml="false" value="${fav.product.name}" />">
											<img class="err-product" onerror="defaultProductImg()" style="width: 50px;height: 50px;border: 0px;" alt="" src="<%=SystemManager.systemSetting.getImageRootPath() %><c:out escapeXml="false" value="${fav.product.picture}" />" />
										</a>
										<div style="display: inline-block;">
											<c:out value="${fav.product.name}"/><br>
											<c:out value="${fav.product.nowPrice}"/>
										</div>
									</td>
									<td><c:out value="${fav.createtime}"/></td>
							  </tr>
							 </c:forEach>
					</table>
						</c:when>
						<c:otherwise>
						  	<div class="col-xs-12">
							<div class="row">
								<div class="col-xs-12">
									<ol class="breadcrumb">
									  <li class="active">搜藏夹</li>
									</ol>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
									<div class="panel panel-default">
							              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
								              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
								              		<span class="glyphicon glyphicon-user"></span>亲，您暂时没有收藏任何商品哦，赶紧去收藏几个吧！
								              </div>
							              </div>
									</div>
									<hr>
								</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/foot.jsp"%>
<script type="text/javascript">
$(function() {
});
</script>
</body>
</html>
