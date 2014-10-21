<%@page import="net.jeeshop.core.util.TokenUtil"%>
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
<style type="text/css">
.totalPayMonery{
	color: red;font-weight: bold;font-size:22px;
}
</style>
</head>

<body>
<div id="wrap">
	<%@ include file="indexMenu.jsp"%>
	<form action="${ctx}/order/pay.html" namespace="/" method="post" theme="simple" onsubmit="return submitOrder();">
		<div class="container">
			<div class="row">
				<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
					<span class="label label-default" style="font-size:100%;">
						1.查看购物车
					</span>
					&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
					<span class="label label-success" style="font-size:100%;">
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
			<hr style="margin-bottom: 5px;">
			
			<div class="panel panel-primary">
				<div class="panel-heading">订单确认</div>
				
				<ul class="list-group">
					<li class="list-group-item">
						<a id="addressTips" href="#" data-toggle="tooltip" title="请选择收货地址！">
							<span class="glyphicon glyphicon-user"></span>&nbsp;请选择收货地址
						</a>
					</li>
					<li class="list-group-item">
					
					
					
					<c:if test="${sessionScope.myCart!=null and sessionScope.myCart.addressList.size!=0 }">
						<c:choose>
						
						<c:when test="${sessionScope.myCart!=null and sessionScope.myCart.addressList.size!=0 }">
							<div class="row">
								<div class="col-xs-12" style="line-height: 20px;" id="adressListDiv">
									<c:forEach items="${sessionScope.myCart.addressList}" var="addr">
									   <c:choose>
									     <c:when test="${addr.id == sessionScope.myCart.defaultAddessID }">
									        <div address="address" class="col-xs-3 alert alert-info" style="border: 1px solid;text-align: left;margin-right: 10px;width: 200px;line-height: 20px;cursor: pointer;">
												<c:out value="${addr.name}" escapeXml="false"/>,<c:out escapeXml="false" value="${addr.phone}"/>
												<input type="radio" name="${e.selectAddressID}" checked="checked"  value="<c:out escapeXml="false" value="${addr.id}"/>"/>
												<br>
												<c:out escapeXml="false" value="${addr.address}"/><br>
											</div>
									     </c:when>
									   	 <c:otherwise>
									   	    <div address="address" class="col-xs-3 alert" style="border: 1px solid;text-align: left;margin-right: 10px;width: 200px;line-height: 20px;cursor: pointer;">
												<c:out escapeXml="false" value="${addr.name}"/>,<c:out value="${addr.phone}" escapeXml="false"/>
												<input type="radio" name="${e.selectAddressID}" value="<c:out escapeXml="false" value="${addr.id}"/>"/>
												<br>
												<c:out value="${addr.address}" escapeXml="false"/><br>
											</div>
									   	 </c:otherwise>
									   </c:choose>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${sessionScope.user_info !=null }">
								<div class="bs-callout bs-callout-danger author" style="text-align: left;font-size: 14px;margin: 2px 0px;">
									暂时还没有收获地址！<a style="text-decoration: underline;" href="<%=request.getContextPath() %>/user/address.html">点此设置</a>
								</div>
							</c:if>
						</c:otherwise>
						</c:choose>
					</c:if>
					
					
					
					</li>
					<li class="list-group-item">
						<a href="#" data-toggle="tooltip" title="请选择配送方式！" id="expressTips">
							<span class="glyphicon glyphicon-send"></span>&nbsp;请选择配送方式
						</a>
					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="col-xs-12">
								<!-- 
								<div class="alert alert-danger fade in">
							        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
							        <strong>提示：</strong>请选择配送方式!
							      </div>
								 -->
								<%application.setAttribute("expressMap", SystemManager.expressMap); %>
								<table class="table table-bordered table-hover" id="expressTable">
									<c:forEach items="${applicationScope.expressMap}" var="expre">
										<tr style="cursor: pointer;">
											<td width="400px">
											<input type="radio" name="e.expressCode" value="<c:out escapeXml="false" value="${expre.key}" />" fee="<c:out escapeXml="false" value="${expre.value.fee}" />"/>
											<c:out escapeXml="false" value="${expre.value.name}" /></td>
											<td><c:out escapeXml="false" value="${expre.value.fee}" /></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</li>
					<li class="list-group-item"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;购买到的商品</li>
					<li class="list-group-item">
						<div class="row">
							<div class="col-xs-12">
								<table class="table table-bordered table-hover">
									<tr>
										<th width="400px">商品名称</th>
										<th >单价(元)</th>
										<th >数量</th>
			<!-- 							<th >优惠方式(元)</th> -->
										<th >小计(元)</th>
									</tr>
									<c:forEach items="${sessionScope.myCart.productList }" var="prodt">
										<tr>
											<td style="display: none;">&nbsp;<c:out escapeXml="false" value="${prodt.id }" /></td>
											<td>&nbsp;<a target="_blank" href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${prodt.id}" />.html"><c:out escapeXml="false" value="${prodt.name}" /></a>
												<a name="stockErrorTips" productid="<c:out escapeXml="false" value="${prodt.id}" />" href="#" data-toggle="tooltip" title="" data-placement="right" data-original-title="商品库存不足20个，"></a>
												<c:if test="${prodt.exchangeScore!=0 }">
													<p>
														<span id="totalExchangeScoreSpan" class="label label-default">兑换积分:<c:out escapeXml="false" value="${prodt.exchangeScore}" />
														</span>
													</p>
												</c:if>
											</td>
											<td>
												<c:choose>
												<c:when test="${prodt.totalExchangeScore!=0}">
													<span style="text-decoration: line-through;">
												</c:when>
												<c:otherwise>
													<span>
												</c:otherwise>
												</c:choose>
													<c:out escapeXml="false" value="${prodt.nowPrice}" />
												</span>
											</td>
											<td>
												<c:out escapeXml="false" value="${prodt.buyCount}" />												
											</td>
											<td>&nbsp;<c:out escapeXml="false" value="total0" /></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</li>
				</ul>
				
				<div class="panel-footer primary" align="right">
					<div class="row">
						<div class="col-xs-12">
							<input id="productTotalMonery" type="hidden" value="<c:out escapeXml="false" value="${sessionScope.myCart.amount}"/>"/>		
							合计：<span class="totalPayMonery" id="totalPayMonery"><c:out escapeXml="false" value="${sessionScope.myCart.amount}"/></span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${sessionScope.myCart.totalExchangeScore!=0}">
								<h4>所需积分：<span style="color: red;font-weight: bold;" id="totalExchangeScore"><c:out escapeXml="false" value="${sessionScope.myCart.totalExchangeScore}"/></span>
								</h4>
							</c:if>
						</div>
					</div>
							
					<div class="row">
						<div class="col-xs-6">
							<input name="e.otherRequirement" class="form-control" placeholder="此处您可以输入您的附加要求，以便我们提供更好的服务。" size="50" maxlength="50"/>	
						</div>
						<div class="col-xs-6">
							<button type="submit" class="btn btn-success" value="提交订单" id="confirmOrderBtn" disabled="disabled">
								<span class="glyphicon glyphicon-ok"></span>提交订单
							</button>
						</div>
					</div>
				</div>
			</div>			
			
		</div>
	</form>
</div>
<%@ include file="foot.jsp"%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script> --%>
<script type="text/javascript">
$(function() {
	$("div[address=address]").click(function(){
		$("div[address=address]").removeClass("alert-info");
		
		$(this).addClass("alert-info");
		$(this).find("input[type=radio]").attr("checked",true);
	});
	
	$("#expressTable tr").each(function(){
		var _tr = $(this);
		_tr.click(function(){
			var _radio = _tr.find("input[type=radio]");
			console.log("选中的快递费用为="+_radio.attr("fee"));
			_radio.attr("checked",true);
			var _totalPayMonery = parseFloat($("#productTotalMonery").val())+parseFloat(_radio.attr("fee"));
			$("#totalPayMonery").text(_totalPayMonery.toFixed(2));
			
			$('#expressTips').tooltip('hide');
		});
	});
	
	$("#confirmOrderBtn").removeAttr("disabled");
});

function submitOrder(){
	console.log("提交订单...");
	//console.log($("#adressListDiv").find(":checked").size());
	//console.log($("#expressTable").find(":checked").size());
	var submitFlg = true;
	if($("#adressListDiv").find(":checked").size()==0){
		$('#addressTips').tooltip('show');
		submitFlg =false;
	}else{
		$('#addressTips').tooltip('hide');
	}
	if($("#expressTable").find(":checked").size()==0){
		$('#expressTips').tooltip('show');
		submitFlg =false;
	}else{
		$('#expressTips').tooltip('hide');
	}
	console.log("提交订单...submitFlg= " + submitFlg);
	if(!submitFlg){
		return false; 
	}
	//ajax验证待提交支付的商品库存数量是否存在超卖或下架之类的情况
	//tips
	//$("a[name=stockErrorTips]").tooltip('show');
	var aaa=checkStockLastTime();
	console.log("aaa="+aaa);
	if(!aaa){console.log("not ok");
		return false;
	}
	console.log("ok");
	return true;
}

</script>
</body>
</html>
