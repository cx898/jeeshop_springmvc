<%@page import="net.jeeshop.services.manage.order.bean.Order"%>
<%@page import="net.jeeshop.core.KeyValueHelper"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<style>
.simpleOrderReport{
	font-weight: 700;font-size: 16px;color: #f50;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<form action="order" namespace="/manage" method="post" theme="simple" name="form1">
	<input type="hidden" name="id" value="${e.id}"/>
		<div id="buttons" style="text-align: center;border-bottom: 1px solid #ccc;padding: 5px;">
		<div id="updateMsg"><font color='red'><c:out value="${updateMsg}" /></font></div>
			
			<c:choose>
				<c:when test="${e.paystatus == 'y'}">
				   <c:choose>
						<c:when test="${e.status == 'init'}">
						   <a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
							value="已审核" class="btn btn-primary"><%=Order.order_status_pass_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
							value="已发货" class="btn" disabled="disabled"><%=Order.order_status_send_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
							value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
							value="已归档" class="btn" disabled="disabled"><%=Order.order_status_file_chinese %></a>	
							
							<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning"/>
							<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning"/>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" 
							onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
						</c:when>
						<c:when test="${e.status == 'pass'}">
						   <a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
							value="已审核" class="btn" disabled="disabled"><%=Order.order_status_pass_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
							value="已发货" class="btn btn-primary" disabled="disabled"><%=Order.order_status_send_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
							value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
							value="已归档" class="btn" disabled="disabled"><%=Order.order_status_file_chinese %></a>	
							
							<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning" disabled="disabled"/>
							<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning" disabled="disabled"/>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" 
							onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
						</c:when>
						<c:when test="${e.status == 'send'}">
						   <a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
							value="已审核" class="btn" disabled="disabled"><%=Order.order_status_pass_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
							value="已发货" class="btn" disabled="disabled"><%=Order.order_status_send_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
							value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
							value="已归档" class="btn" disabled="disabled"><%=Order.order_status_file_chinese %></a>	
							
							<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning" disabled="disabled"/>
							<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning" disabled="disabled"/>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" disabled="disabled" 
							onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
						</c:when>
						<c:when test="${e.status == 'sign'}">
						   <a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
							value="已审核" class="btn" disabled="disabled"><%=Order.order_status_pass_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
							value="已发货" class="btn" disabled="disabled"><%=Order.order_status_send_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
							value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
							value="已归档" class="btn btn-primary"><%=Order.order_status_file_chinese %></a>	
							
							<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning" disabled="disabled"/>
							<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning" disabled="disabled"/>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" disabled="disabled" 
							onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
						</c:when>
						<c:when test="${e.status == 'cancel'}">
						   <a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
							value="已审核" class="btn" disabled="disabled"><%=Order.order_status_pass_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
							value="已发货" class="btn" disabled="disabled"><%=Order.order_status_send_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
							value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
							value="已归档" class="btn btn-primary"><%=Order.order_status_file_chinese %></a>	
							
							<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning" disabled="disabled"/>
							<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning" disabled="disabled"/>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" disabled="disabled" 
							onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
						</c:when>
						<c:when test="${e.status == 'file'}">
						   <a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
							value="已审核" class="btn" disabled="disabled"><%=Order.order_status_pass_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
							value="已发货" class="btn" disabled="disabled"><%=Order.order_status_send_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
							value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
							value="已归档" class="btn" disabled="disabled"><%=Order.order_status_file_chinese %></a>	
							
							<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning" disabled="disabled"/>
							<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning" disabled="disabled"/>
							<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" disabled="disabled" 
							onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${e.status == 'cancel'}">
				   <a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
					value="已审核" class="btn" disabled="disabled"><%=Order.order_status_pass_chinese %></a>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
					value="已发货" class="btn" disabled="disabled"><%=Order.order_status_send_chinese %></a>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
					value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
					value="已归档" class="btn btn-primary"><%=Order.order_status_file_chinese %></a>	
					
					<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning" disabled="disabled"/>
					<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning" disabled="disabled"/>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" disabled="disabled" 
					onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
				</c:when>
				<c:otherwise>
				  	<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=pass" onclick="return onSubmit(this);" 
					value="已审核" class="btn" disabled="disabled"><%=Order.order_status_pass_chinese %></a>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=send" onclick="return onSubmit(this);" 
					value="已发货" class="btn" disabled="disabled"><%=Order.order_status_send_chinese %></a>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=sign" onclick="return onSubmit(this);" 
					value="已签收" class="btn" disabled="disabled"><%=Order.order_status_sign_chinese %></a>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=file" onclick="return onSubmit(this);" 
					value="已归档" class="btn btn-primary"><%=Order.order_status_file_chinese %></a>	
					
					<input type="button" id="addPayBtn" onclick="return addPayFunc(this);" value="添加支付记录" class="btn btn-warning"/>
					<input type="button" id="updatePayMoneryBtn" onclick="return updatePayMoneryFunc(this);" value="修改订单总金额" class="btn btn-warning"/>
					<a href="${ctx}/manage/order/updateOrderStatus.action?id=<c:out value="${e.id}"/>&status=cancel" 
					onclick="return onSubmit(this);" value="取消订单" class="btn btn-danger"><%=Order.order_status_cancel_chinese %></a>
				</c:otherwise>
			</c:choose>
		</div>
	<div id="addPayDiv" style="display: none;">
		<table class="table">
			<tr>
				<td colspan="2">
					<h4>添加支付记录</h4>
				</td>
			</tr>
			<tr>
				<td>支付方式</td>
				<td>
					<select name="e.orderpay.paymethod">
						<option value="zfb">支付宝</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>支付金额</td>
				<td>
					<input name="e.orderpay.payamount">
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td>
					<div class="controls"><input name="e.orderpay.remark" value="后台添加"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" method="insertOrderpay"  onclick="return onSubmit(this);" value="确认" class="btn btn-primary" />
					<input id="cancelPayBtn" type="button" value="取消" class="btn"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="updatePayMoneryDiv" style="display: none;">
		<table class="table">
			<tr>
				<td colspan="2">
					<h4>修改订单总金额</h4>
				</td>
			</tr>
			<tr>
				<td>支付金额</td>
				<td>
					<input name="e.amount">
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td>
					<div class="controls"><input name="updatePayMoneryRemark" placeholder="修改订单金额备注"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" method="updatePayMonery" onclick="javascript:return confirm('确认本次操作?');" 
					value="确认" class="btn btn-primary" />
					<input id="cancelUpdatePayMoneryBtn" type="button" value="取消" class="btn"/>
				</td>
			</tr>
		</table>
	</div>

	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">订单信息</a></li>
			<li><a href="#tabs-2">订单明细
			<c:if test="${e.lowStocks =='y' }"><font color="red">【缺货】</font></c:if>
			</a></li>
			<li><a href="#tabs-3">订单日志</a></li>
		</ul>
		<div id="tabs-1">
			<c:if test="${e.refundStatusStr !=null and e.refundStatusStr!=''}">
				<div class="alert alert-danger" style="margin-bottom: 2px;">
					<strong>退款状态：</strong><c:out value="${e.refundStatusStr}"/>(<c:out value="${e.refundStatus}"/>)
					<br>
					【请立刻去<a href="http://www.alipay.com" target="_blank">支付宝</a>处理此订单的退款事宜】
				</div>
			</c:if>
			<div class="alert alert-info" style="margin-bottom: 2px;">
				<strong>订单信息</strong>
				<c:if test="${e.score>0}">
					<span class="badge badge-success" style="margin-left:20px;">赠送<c:out value="${e.score}" />个积分点</span>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${e.amountExchangeScore>0}">
					<span class="badge badge-default" style="margin-left:20px;">消耗掉会员<c:out value="${e.amountExchangeScore}" />
					个积分点</span>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${e.hasGift}">
					<span class="badge badge-success" style="margin-left:20px;">【订单含赠品】</span>
				</c:if>
			</div>
			<table class="table table-bordered">
				<tr>
					<th>订单编号</th>
					<th>数量</th>
					<th>创建日期</th>
					<th>订单状态</th>
					<th>支付状态</th>
					<th>订单总金额</th>
					<th>商品总金额</th>
					<th>总配送费</th>
<!-- 					<th>支付方式</th> -->
<!-- 					<th>订单备注</th> -->
					<th>收货人信息</th>
					<th>收货人地址</th>
					<th>物流信息</th>
				</tr>
				<tr>
					<td>&nbsp;<c:out value="${e.id}" /></td>
					<td>&nbsp;<c:out value="${e.quantity}" /></td>
					<td>&nbsp;<c:out value="${e.createdate}" /></td>
					<td>
					<c:choose>
						<c:when test="${e.status == 'sign' or e.status == 'file'}">
						   <span class="badge badge-success"><c:out value="${e.statusStr}" /></span>
						</c:when>
						<c:otherwise>
						  <span class="badge badge-important"><c:out value="${e.statusStr}" /></span>
						</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:choose>
						<c:when test="${e.paystatus == 'y'}">
						   <span class="badge badge-success"><c:out value="${e.paystatusStr}" /></span>
						</c:when>
						<c:otherwise>
						  <span class="badge badge-important"><c:out value="${e.paystatusStr}" /></span>
						</c:otherwise>
					</c:choose>	
					</td>
					<td>&nbsp;<span class="simpleOrderReport"><c:out value="${e.amount}" /></span>
						<c:if test="${e.updateAmount == 'y'}"><font color="red">【修】</font></c:if>
					</td>
					<td>&nbsp;<c:out value="${e.ptotal}" /></td>
					<td>&nbsp;<c:out value="${e.fee}" /></td>
					<td>
						姓名：<c:out value="${e.ordership.shipname}" /><br>
						性别：<c:out value="${e.ordership.sex}" /><br>
						手机：<c:out value="${e.ordership.phone}" /><br>
						座机：<c:out value="${e.ordership.tel}" /><br>
					</td>
					<td style="width: 200px;">
						省份：<c:out value="${e.ordership.province}" /><br>
						城市：<c:out value="${e.ordership.city}" /><br>
						区域：<c:out value="${e.ordership.area}" /><br>
						详细地址：<c:out value="${e.ordership.shipaddress}" /><br>
						邮编：<c:out value="${e.ordership.zip}" /><br>
						备注：<c:out value="${e.ordership.remark}" /><br>
						
					<c:choose>
						<c:when test="${e.status == 'init'}">
						   <a class="btn" href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order/selectOrdership.action?orderid=<c:out value="${e.id}" />">修改收货人配送信息</a>
						</c:when>
						<c:otherwise>
						   <a class="btn" href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order/selectOrdership.action?orderid=<c:out value="${e.id}" />" disabled="disabled" onclick="javascript:return false;">修改收货人配送信息</a>
						</c:otherwise>
					</c:choose>
					</td>
					<td style="width: 150px;">
						<c:out value="${e.expressCode}" /><br>
						<c:out value="${e.expressCompanyName}" /><br>
						物流单号：<c:out value="${e.expressNo}" /><br>
					</td>
				</tr>
				<c:if test="${e.otherRequirement!=null}">
					<tr>
						<td colspan="20">附加要求:<c:out value="${e.otherRequirement}"/></td>
					</tr>
				</c:if>
			</table>
			
			<div class="alert alert-success" style="margin-bottom: 2px;">
				<strong>订单支付记录</strong>
			</div>
			<table class="table table-bordered">
				<tr>
					<th width="50px">序号</th>
					<th nowrap="nowrap">商户订单号</th>
					<th nowrap="nowrap">支付方式</th>
					<th nowrap="nowrap">支付金额</th>
					<th nowrap="nowrap">支付时间</th>
					<th nowrap="nowrap">支付状态</th>
					<th nowrap="nowrap">支付宝交易号</th>
					<th nowrap="nowrap">备注</th>
				</tr>
				
				 <c:forEach items="${e.orderpayList}" var="order" varStatus="vs">  
				  	<tr>
						<td>&nbsp;<c:out value="${vs.index+1}" /></td>
						<td>&nbsp;<c:out value="${order.id}" /></td>
						<td><c:out value="${order.paymethod}" />
							<c:choose>
								<c:when test="${order.paymethod == 'n'}">
								   <%=KeyValueHelper.get("orderpay_paymethod_n")%>
								</c:when>
								<c:otherwise>
								  <%=KeyValueHelper.get("orderpay_paymethod_y")%>
								</c:otherwise>
							</c:choose>
						</td>
						<td>&nbsp;<c:out value="${order.payamount}" /></td>
						<td>&nbsp;<c:out value="${order.createtime}" /></td>
						<td>
							<c:choose>
								<c:when test="${order.paystatus == 'n'}">
								   <%=KeyValueHelper.get("orderpay_paystatus_n")%>
								</c:when>
								<c:otherwise>
								  <span class="badge badge-success"><%=KeyValueHelper.get("orderpay_paystatus_y")%></span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>&nbsp;<c:out value="${order.tradeNo}" /></td>
						<td>&nbsp;<c:out value="${order.remark}" /></td>
					</tr>
				 </c:forEach>
			</table>
		</div>
		
		<div id="tabs-2">
			<table class="table table-bordered">
				<tr style="background-color: #dff0d8">
					<th width="50px">序号</th>
					<th>商品编号</th>
					<th>商品名称</th>
					<th>购买的商品规格</th>
<!-- 					<th>赠送积分</th> -->
					<th>数量</th>
					<th>单价</th>
<!-- 					<th>配送费</th> -->
					<th>小计</th>
				</tr>
				
				 <c:forEach items="${e.orderdetail}" var="odetail" varStatus="vs">  
				  <tr>
				   		<td>&nbsp;<c:out value="${vs.index+1}" /></td>
						<td nowrap="nowrap">
							<a target="_blank" style="text-decoration: underline;" 
							href="${ctx}/manage/product/toEdit.action?id=${odetail.productID}">
								<c:out value="${odetail.productID}" /> </a>
							<c:if test="${odetail.lowStocks == 'y' }"><font color="red">【缺货】</font></c:if>
						</td>
						<td><a target="_blank" style="text-decoration: underline;" 
						href="<%=SystemManager.systemSetting.getWww()%>/product/<c:out value="${odetail.productID}" />.html"><c:out value="${odetail.productName}"/></a>
							<br>
							<c:if test="${odetail.giftID !=null and odetail.giftID!='' }">
								<a target="_blank" style="text-decoration: underline;" href="${ctx}/manage/gift/show.action?id=${odetail.giftID}">
									【查看赠品】
								</a>
							</c:if>
						</td>
						<td>&nbsp;<c:out value="${odetail.specInfo}" /></td>
						<td>&nbsp;<c:out value="${odetail.number}" /></td>
						<td>&nbsp;￥<c:out value="${odetail.price}" /></td>
						<td>&nbsp;￥<c:out value="${odetail.total0}" /></td>
						</td>
				  </tr>
				 </c:forEach>
			</table>
		</div>
		
		<div id="tabs-3">
			<table class="table table-bordered">
				<tr style="background-color: #dff0d8">
					<th width="50px">序号</th>
					<th>操作人</th>
					<th>操作人类型</th>
					<th>时间</th>
					<th>日志</th>
				</tr>
				
				 <c:forEach items="${e.orderlogs}" var="orderlog" varStatus="vs">  
				  <tr>
				   <td>&nbsp;<c:out value="${vs.index+1}" /></td>
				   <td nowrap="nowrap">&nbsp;
						<c:choose>
							<c:when test="${orderlog.accountType == 'w'}">
							   <a target="_blank" href="${ctx}/manage/account/show.action?account=${orderlog.account}"><c:out value="${orderlog.account}" /></a>
							</c:when>
							<c:when test="${orderlog.accountType == 'm'}">
							   <a target="_blank" href="${ctx}/manage/user/show.action?account=${orderlog.account}"><c:out value="${orderlog.account}" /></a>
							</c:when>
							<c:when test="${orderlog.accountType == 'p'}">
							   第三方支付系统
							</c:when>
							<c:otherwise>
							  未知
							</c:otherwise>
						</c:choose>
					</td>
					<td>&nbsp;
						
						<c:choose>
							<c:when test="${orderlog.accountType == 'w'}">客户
							</c:when>
							<c:when test="${orderlog.accountType == 'm'}"><%=SystemManager.systemSetting.getSystemCode() %>(系统)
							</c:when>
							<c:when test="${orderlog.accountType == 'p'}">支付宝
							</c:when>
							<c:otherwise>未知</c:otherwise>
						</c:choose>
						</td>
						<td>&nbsp;<c:out value="${orderlog.createdate}" /></td>
						<td>&nbsp;<c:out value="${orderlog.content}" /></td>
				  </tr>
				 </c:forEach>
			</table>
		</div>
	</div>
</form>

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/jquery-1.5.1.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>


<script>
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
	$("#cancelPayBtn").click(function(){
		$("#addPayDiv").slideUp();
		$("#addPayBtn").show();
		//$("#buttons").find("input[type=button]").each(function(){
			//$(this).attr("disabled","");
		//});
		return false;
	});
	$("#cancelUpdatePayMoneryBtn").click(function(){
		$("#updatePayMoneryDiv").slideUp();
		$("#updatePayMoneryBtn").show();
		return false;
	});
});
function addPayFunc(){
	$("#addPayDiv").slideDown();
	$("#addPayBtn").hide();
	//$("#buttons").find("input[type=button]").each(function(){
		//$(this).attr("disabled","disabled");
	//});
	return false;
}
function updatePayMoneryFunc(){
	$("#updatePayMoneryDiv").slideDown();
	$("#updatePayMoneryBtn").hide();
	return false;
}
function onSubmit(obj){
	//if(confirm("确认本次操作?")){
		//document.form1.action = "order!"+$(obj).attr("method")+".action";
		//document.form1.submit();
	//}
	if($(obj).attr("disabled")=='disabled'){//alert("disabled不可点击"+$(obj).attr("disabled"));
		return false;
	}
	return confirm("确认本次操作?");
}
</script>
</body>
</html>
