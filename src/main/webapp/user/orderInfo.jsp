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
<style type="text/css">
.centerImageCss{
	width: 560px;
	height: 180px;
}
</style>
<script>
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
			<div class="col-xs-3">
				<%@ include file="userLeft.jsp"%>
			</div>
			
			<div class="col-xs-9">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading"><b>订单详情</b></div>
						<div class="panel-body" style="line-height: 30px;">
							<table>
								<tr>
									<td align="right">订单编号：</td>
									<td><c:out value="${e.id}" /></td>
								</tr>
								<tr>
									<td align="right">创建日期：</td>
									<td><c:out value="${e.createdate}" /></td>
								</tr>
								<tr>
									<td align="right">订单总金额：</td>
									<td style="font-weight: 700;font-size: 16px;color: #f50;"><c:out value="${e.amount}" /></td>
								</tr>
								<tr>
									<td align="right">配送费：</td>
									<td style="font-weight: 700;font-size: 16px;color: #f50;"><c:out value="${e.fee}" /></td>
								</tr>
								<tr>
									<td align="right">配送方式：</td>
									<td><c:out value="${e.expressName}" /></td>
								</tr>
							</table>
						</div>
						<ul class="list-group">
							<li class="list-group-item"><b>配送信息：</b>
								<c:out value="${e.ordership.shipname}" />,
								<c:out value="${e.ordership.shipaddress}" />,
								<c:out value="${e.ordership.phone}" />,
								<c:out value="${e.ordership.zip}" />
							</li>
							
							<c:if test="${status=='send' or status='sign' }">
								<li class="list-group-item">
									<b>快递信息：</b>
									<a target="_blank" href="http://www.kuaidi100.com/chaxun?com=<c:out value="e.expressCompanyName" />&nu=<c:out value="e.expressNo" />">快递物流</a>
									<div style="display: none;">
										<c:choose>
										<c:when test="${e.kuaid100Info!=null }">
											<c:out value="${e.kuaid100Info.message}" /><br>
											<c:out value="${e.kuaid100Info.status}" /><br>
											<c:out value="${e.kuaid100Info.state}" /><br>
											
											<c:if test="${e.kuaid100Info.data!=null }">
												<c:forEach items="${ e.kuaid100Info.data }" var="data">
												  <c:out value="time" /><c:out value="${data.context}" /><br>
												</c:forEach>
											</c:if>
										</c:when>
										<c:otherwise>
											没有查询到快递信息.
										</c:otherwise>
										</c:choose>
									</div>
								</li>
							</c:if>
						</ul>
						<table class="table ">
							<tr>
								<th style="text-align: left;">商品</th>
								<th style="text-align: center;" nowrap="nowrap">数量</th>
								<th style="text-align: center;" nowrap="nowrap">单价</th>
							</tr>
							<c:forEach items="${e.orders }" var="tmp">
								<tr>
									<td>
										<div style="width:50px;height: 50px;border: 0px solid;float: left;margin-left: 20px;">
											<a href="<%=request.getContextPath() %>/product/<c:out value="${tmp.productID}" />.html" target="_blank">
												<img style="width: 100%;height: 100%;border: 0px;" alt="" src="<%=SystemManager.systemSetting.getImageRootPath()%><c:out value="${tmp.picture}" />" onerror="defaultProductImg()"/>
											</a>
										</div>
										<div style="float: left;">&nbsp;<c:out value="${tmp.productName}" /></div>
									</td>
									<td style="text-align: center;">&nbsp;<c:out value="${tmp.productNumber}" /></td>
									<td style="text-align: center;">&nbsp;<c:out value="${tmp.price}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
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
