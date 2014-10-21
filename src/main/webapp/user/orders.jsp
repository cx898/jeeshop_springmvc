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
.simpleOrderReport{
font-weight: 700;font-size: 16px;color: #f50;
}
</style>
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
					<c:when test="${ pager.list!=null and pager.pagerSize>=1 }">
						<div class="panel panel-default">
							<div class="panel-heading"><span class="glyphicon glyphicon-th"></span>我的订单列表</div>
							<div class="panel-body">
								<c:choose>
								<c:when test="orderSimpleReport!=null">
									<c:if test="${ orderSimpleReport.orderCompleteCount!=0 }">
										<span class="glyphicon glyphicon-ok"></span>&nbsp;<span class="simpleOrderReport"><c:out value="${orderSimpleReport.orderCompleteCount}"/></span>个交易完成.
									</c:if>
									<c:if test="${ orderSimpleReport.orderCancelCount!=0 }">
										<span class="glyphicon glyphicon-remove"></span>&nbsp;<span class="simpleOrderReport"><c:out value="${orderSimpleReport.orderCancelCount}"/></span>个取消.
									</c:if>
									<c:if test="${orderSimpleReport.orderWaitPayCount!=0 }">
										<span class="glyphicon glyphicon-time"></span>&nbsp;<span class="simpleOrderReport"><c:out value="${orderSimpleReport.orderWaitPayCount}"/></span>个等待付款.
									</c:if>
								</c:when>
								<c:otherwise>
									无任何订单数据！
								</c:otherwise>
								</c:choose>
							</div>
							<table class="table">
								<tr>
									<td colspan="21"><span class="text-primary">【确认收货】操作只能登陆支付宝来进行。</span></td>
								</tr>
								<tr>
									<th style="text-align: left;">
										商品</th>
									<th style="text-align: center;" nowrap="nowrap">数量</th>
									<th style="text-align: center;" nowrap="nowrap">单价</th>
									<th style="text-align: center;" nowrap="nowrap">订单状态</th>
									<th style="text-align: center;width: 100px;">操作</th>
								</tr>
								
								<c:forEach items="${pager.list}" var="ord">
									<tr class="warning">
										<td colspan="11">
											<div class="row">
												<div class="col-xs-3">
													订单号:<c:out value="${ord.id}" escapeXml="false"/>
												</div>
												<div class="col-xs-3">
													成交时间:<c:out value="${ord.createdate}" escapeXml="false"/>
												</div>
												<div class="col-xs-3">
													合计:<b class="simpleOrderReport"><c:out value="${ord.amount}" escapeXml="false"/></b>
												</div>
												<div class="col-xs-3">
													<c:if test="${ord.score !=0 }">
														<span class="label label-default">获赠：<c:out value="score" escapeXml="false"/>个积分</span>
													</c:if>
												</div>
											</div>
										</td>
									</tr>
									
									
									<c:forEach items="${ord.orders}" varStatus="vs_inner" var="innerOrd">
										<tr>
											<td>&nbsp;
												<div style="width:50px;height: 50px;border: 0px solid;float: left;margin-left: 20px;">
													<a href="<%=request.getContextPath() %>/product/<c:out value="${innerOrd.productID}" />.html" target="_blank" title="<c:out value="${innerOrd.productName}" />">
														<img style="width: 100%;height: 100%;border: 0px;" alt="" src="<%=SystemManager.systemSetting.getImageRootPath()%><c:out value="${innerOrd.picture}" />" onerror="nofind()"/>
													</a>
												</div>
												<div style="float: left;">&nbsp;<c:out value="${innerOrd.productName}" /></div>
											</td>
											<td style="text-align: center;">&nbsp;<c:out value="${innerOrd.productNumber}" /></td>
											<td style="text-align: center;">&nbsp;<c:out value="${innerOrd.price}" /></td>
											<c:if test="${vs_inner.index == 0 }">
												<td style="text-align: center;border-left:1px solid #ddd;vertical-align: middle;" rowspan="<c:out value="${innerOrd.quantity}" />">
													<c:choose>
													<c:when test="${innerOrd.paystatus == 'y'} ">
														<c:choose>
														<c:when test="${innerOrd.status == 'init'}">
															等待发货
														</c:when>
														<c:when test="${innerOrd.status=='pass'}">
															等待发货
														</c:when>
														<c:when test="${innerOrd.status=='send'}">
															已发货
														</c:when>
														<c:when test="${innerOrd.status=='sign'}">
															已签收
														</c:when>
														<c:otherwise>
															交易完成
														</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${innerOrd.status=='cancel'}">
														已取消
													</c:when>
													<c:otherwise>
														等待付款
													</c:otherwise>
													</c:choose>
													<br>
													
													<c:if test="${innerOrd.status =='file' }">
														<c:choose>
														<c:when test="${innerOrd.isComment=='y'}">
															已评价<br>
														</c:when>
														<c:otherwise>
														</c:otherwise>
														</c:choose>
													</c:if>
												</td>
											</c:if>
											
											
											<c:if test="${vs_inner.index == 0 }">
												<td style="text-align: center;border-left:1px solid #ddd;vertical-align: middle;" rowspan="<c:out value="${innerOrd.quantity}" />">
													<c:choose>
													<c:when test="${innerOrd.paystatus=='y'}">
														<c:choose>
														<c:when test="${innerOrd.status=='init'}">
															<!-- 等待发货 -->
														</c:when>
														<c:when test="${innerOrd.status=='pass'}">
															<!-- 等待发货 -->
														</c:when>
														<c:when test="${innerOrd.status=='send'}">
															<a target="_blank" href="http://www.alipay.com" class="btn btn-primary btn-sm">确认收货</a>
														</c:when>
														<c:when test="${innerOrd.status=='sign'}">
															<!-- 已签收 -->
														</c:when>
														<c:otherwise>
															<!-- 交易完成 -->
														</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${innerOrd.status=='cancel'}">
														<!-- 已取消 -->
													</c:when>
													<c:otherwise>
														<a target="_blank" href="<%=request.getContextPath()%>/order/toPay.html?id=<c:out value="${innerOrd.id}"/>" class="btn btn-success btn-sm">确认付款</a>
													</c:otherwise>
													</c:choose>
													<br>
													
													<c:if test="${innerOrd.status=='sign' or innerOrd.status=='file'}">
														<c:choose>
														<c:when test="${innerOrd.closedComment=='y'}">
															<!-- 已评价 -->
														</c:when>
														<c:otherwise>
															<a target="_blank" href="<%=request.getContextPath()%>/order/rate.html?orderid=<c:out value="${innerOrd.id}"/>" class="btn btn-danger btn-sm">我来评价</a><br>
														</c:otherwise>
														</c:choose>
													</c:if>
													<a target="_blank" href="<%=request.getContextPath()%>/order/orderInfo.html?id=<c:out value="${innerOrd.id}" />">订单详情</a>
													<br>
													<c:if test="${innerOrd.status=='send' or innerOrd.status=='sign'} ">
														<a target="_blank" href="http://www.kuaidi100.com/chaxun?com=<c:out value="${e.expressCompanyName}" />&nu=<c:out value="${e.expressNo}" />">快递物流</a>
													</c:if>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:forEach>
							</table>
						</div>
						
						<div style="text-align: right;"><%@ include file="/pager.jsp"%></div>
					</c:when>
					<c:otherwise>
						
						<div class="col-xs-12">
							<div class="row">
								<div class="col-xs-12">
									<ol class="breadcrumb">
									  <li class="active">我的订单</li>
									</ol>
								</div>
							</div>
							
							<hr>
							
							<div class="row">
								<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
									<div class="panel panel-default">
							              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
								              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
								              		<span class="glyphicon glyphicon-user"></span>亲，你还没有任何订单信息！赶紧去下个单吧。
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
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript">
$(function() {
});
</script>
</body>
</html>
