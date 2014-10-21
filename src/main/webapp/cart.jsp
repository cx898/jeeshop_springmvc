<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="net.jeeshop.services.front.product.bean.Product"%>
<%@page import="net.jeeshop.services.front.product.ProductService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
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

<!DOCTYPE html>
<html class="no-js">
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
</head>

<body>
	<%@ include file="indexMenu.jsp"%>
	<form action="#" namespace="/" method="post" theme="simple">
		<div class="container" style="min-height: 200px;">
			<div class="row">
				<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
					<span class="label label-success" style="font-size:100%;">
						1.查看购物车
					</span>
					&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
					<span class="label label-default" style="font-size:100%;">
						2.确认订单信息
					</span>
					&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
					<span class="label label-default" style="font-size:100%;">
						3.确认收货
					</span>
					&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
					<span class="label label-default" style="font-size:100%;">
						4.评价
					</span>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-12" style="border: 0px solid;text-align: left;">
					<c:choose>
						<c:when test="${sessionScope.myCart!=null and sessionScope.myCart.productList.size!=0}">
						   <h3 style="font-weight: bold;">购物车中的商品</h3>
						<hr style="margin: 0px;margin-bottom: 10px;">
						<table id="result_table" class="table table-bordered">
							<tr style="background-color: #dff0d8">
								<th width="400px">商品名称</th>
								<th >单价(元)</th>
								<th >数量</th>
	<!-- 							<th >优惠方式(元)</th> -->
								<th >小计(元)</th>
								<th >操作</th>
							</tr>
							 <c:forEach items="${sessionScope.myCart.productList}" var="product">  
							  <tr>
							   <td style="display: none;">&nbsp;<c:out escapeXml="false" value="${product.id}" /></td>
								<td>&nbsp;<a target="_blank" href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${product.id}" />.html">
								<c:out escapeXml="false" value="${product.name}" /></a>
									<c:if test="${product.exchangeScore!=0}">
										<p>
											<span id="totalExchangeScoreSpan" 
											class="label label-default">兑换积分:<c:out escapeXml="false" value="${product.exchangeScore}" />
											</span>
										</p>
									</c:if>
									<c:if test="buySpecInfo!=null">
										<br>商品规格：<c:out escapeXml="false" value="${product.buySpecInfo.specColor}"/>,
										<c:out escapeXml="false" value="${product.buySpecInfo.specSize}"/>
									</c:if>
								</td>
								<td>&nbsp;
								
								<c:choose>
									<c:when test="${product.exchangeScore!=0 }">
									   <span style="text-decoration: line-through;">
									</c:when>
									<c:otherwise>
									  <span>
									</c:otherwise>
								</c:choose>
										<c:out escapeXml="false" value="${product.nowPrice}" />
									</span>
								</td>
								<td>
									<span onclick="subFunc(this,true)" style="cursor: pointer;"><img src="<%=request.getContextPath() %>/resource/images/minimize.png" style="vertical-align: middle;"/></span>
									<input style="text-align: center;" name="inputBuyNum" value="<c:out escapeXml="false" value="${product.buyCount}" />" size="4" maxlength="4" pid="<c:out escapeXml="false" value="${product.id}" />"/>
									<a name="stockErrorTips" productid="<c:out escapeXml="false" value="${product.id}" />" href="#" data-toggle="tooltip" title="" data-placement="right" ></a>
									
									<span onclick="addFunc(this,true)" style="cursor: pointer;"><img src="<%=request.getContextPath() %>/resource/images/maximize.png" style="vertical-align: middle;"/></span>
								</td>
								<td total0="total0">&nbsp;
									<c:out escapeXml="false" value="${product.total0}" />
								</td>
								<td><a href="<%=request.getContextPath() %>/cart/delete.html?id=<c:out escapeXml="false" value="${product.id}" />">删除</a></td>
							  </tr>
							 </c:forEach>
							</table>
							<div style="border: 0px solid;float: right;margin-right: 20px;">
								<div class="row">
									<h4>合计：<span style="color: red;font-weight: bold;" id="totalPayMonery"><c:out escapeXml="false" value="${sessionScope.myCart.amount}"/></span>
									</h4>
								</div>
								
								<div class="row">
									<c:if test="${sessionScope.myCart.totalExchangeScore!=0}">
										<h4>所需积分：<span style="color: red;font-weight: bold;" id="totalExchangeScore"><c:out escapeXml="false" value="${sessionScope.myCart.totalExchangeScore}"/></span>
										</h4>
									</c:if>
								</div>
								
								<div class="row">
									<a href="<%=request.getContextPath()%>/order/confirmOrder.html" data-toggle="show" data-placement="top" class="btn btn-success" id="confirmOrderBtn" onclick="return confirmOrder()" disabled="disabled">
										<span class="glyphicon glyphicon-ok"></span>提交订单
									</a>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						  <div class="bs-callout bs-callout-danger author" style="text-align: left;font-size: 22px;margin: 2px 0px;">
							<span class="glyphicon glyphicon-info-sign"></span>&nbsp;您的购物车是空的，赶紧去看看有什么好宝贝吧...
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</form>
<%@ include file="foot.jsp"%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script> --%>
<script src="<%=request.getContextPath() %>/resource/js/product.js"></script>
<script type="text/javascript">
$(function() {
	$("div[address=address]").click(function(){
		$("div[address=address]").removeClass("alert-info");
		
		$(this).addClass("alert-info");
		$(this).find("input[type=radio]").attr("checked",true);
	});
	
	$("#confirmOrderBtn").removeAttr("disabled");
});

//提交订单事件
function confirmOrder(){
	var submitFlg = true;
	
	//如果存在错误，则直接抖动
	$("input[name='inputBuyNum']").each(function(){
		var _tips_obj = $(this).parent().find("a[name=stockErrorTips]");
		//if(_tips_obj.is(":visible")){
		console.log(_tips_obj.attr("data-original-title"));
		var _tipsTitle = _tips_obj.attr("data-original-title");
		if(_tipsTitle && _tipsTitle!=''){
			_tips_obj.tooltip('show');
			submitFlg = false;
		}
	});
	console.log("submitFlg="+submitFlg);
	
	//ajax检查购物车中商品的数量是否合法
	var aaa=checkStockLastTime();
	console.log("aaa="+aaa);
	if(!aaa){console.log("not ok");
		return false;
	}
	//submitFlg = false;
	return submitFlg;
}
	

</script>
</body>
</html>
