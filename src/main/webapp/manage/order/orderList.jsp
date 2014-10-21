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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.titleCss {
	background-color: #e6e6e6;
	border: solid 1px #e6e6e6;
	position: relative;
	margin: -1px 0 0 0;
	line-height: 32px;
	text-align: left;
}

.aCss {
	overflow: hidden;
	word-break: keep-all;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 12px;
}

.liCss {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	height: 30px;
	text-align: left;
	margin-left: 10px;
	margin-right: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		function c1(f) {
			$(":checkbox").each(function() {
				$(this).attr("checked", f);
			});
		}
		$("#firstCheckbox").click(function() {
			if ($(this).attr("checked")) {
				c1(true);
			} else {
				c1(false);
			}
		});
	});
	function deleteSelect() {
		if ($("input:checked").size() == 0) {
			return false;
		}
		return confirm("确定删除选择的记录?");
	}
	function updateInBlackList() {
		if ($("input:checked").size() == 0) {
			return false;
		}
		return confirm("确定将选择的记录拉入新闻黑名单吗?");
	}
</script>
</head>

<body>
	<form action="order" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td>订单号</td>
				<td><input type="text" name="id" value="${e.id}" class="search-query input-small"/></td>
				<td>订单状态</td>
				<td>
					<select id="status" name="status" class="search-query input-small">
							<option value=''></option>
							<option value='init' <c:if test='${e.status=="init"}'>selected='selected'</c:if>>未审核</option>
							<option value='pass' <c:if test='${e.status=="pass"}'>selected='selected'</c:if>>已审核</option>
							<option value='send' <c:if test='${e.status=="send"}'>selected='selected'</c:if>>已发货</option>
							<option value='sign' <c:if test='${e.status=="sign"}'>selected='selected'</c:if>>已签收</option>
							<option value='cancel' <c:if test='${e.status=="cancel"}'>selected='selected'</c:if>>已取消</option>
							<option value='file' <c:if test='${e.status=="file"}'>selected='selected'</c:if>>已归档</option>
					</select>
				</td>
				<td>支付状态</td>
				<td>
				<select id="paystatus" name="paystatus" class="search-query input-small">
						<option value=''></option>
						<option value='n' <c:if test='${e.paystatus=="n"}'>selected='selected'</c:if>>未支付</option>
						<option value='y' <c:if test='${e.paystatus=="y"}'>selected='selected'</c:if>>完全支付</option>
				</select>
				</td>
				<td>用户账号</td>
				<td>
				<input type="text" name="account" value="${e.account}" class="search-query input-small"/>
				</td>
				<td>时间范围</td>
				<td><input id="d4311" class="Wdate search-query input-small" type="text" name="startDate"
					value="<c:out value="${e.startDate}" />"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4312" class="Wdate search-query input-small" type="text" name="endDate" 
					value="<c:out value="${e.endDate}" />"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
				</td>
			</tr>
			<tr>
				<td>退款状态</td>
				<td colspan="21">
				<select id="refundStatus" name="refundStatus" class="input-small">
					<option value=''></option>
					<option value='WAIT_SELLER_AGREE' <c:if test='${e.refundStatus=="WAIT_SELLER_AGREE"}'>selected='selected'</c:if>>等待卖家同意退款</option>
					<option value='WAIT_BUYER_RETURN_GOODS' <c:if test='${e.refundStatus=="WAIT_BUYER_RETURN_GOODS"}'>selected='selected'</c:if>>卖家同意退款，等待买家退货</option>
					<option value='WAIT_SELLER_CONFIRM_GOODS' <c:if test='${e.refundStatus=="WAIT_SELLER_CONFIRM_GOODS"}'>selected='selected'</c:if>>买家已退货，等待卖家收到退货</option>
					<option value='REFUND_SUCCESS' <c:if test='${e.refundStatus=="REFUND_SUCCESS"}'>selected='selected'</c:if>>退款成功，交易关闭</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="14">
						<button method="${ctx}/manage/order/selectList.action" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;"><%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
				
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th>订单号</th>
				<th>订单总金额</th>
				<th>商品总金额</th>
				<th>配送费</th>
				<th>数量</th>
				<th>会员</th>
<!-- 				<th>折扣</th> -->
				<th>创建日期</th>
				<th>订单状态</th>
				<th>支付状态</th>
				<th width="60px">操作</th>
			</tr>
			 
			 <c:forEach items="${pager.list}" var="order">  
			  <tr>
		   		<td><input type="checkbox" name="ids" value="<c:out value="${order.id}"/>" /></td>
				<td>
					<c:out value="${order.id}" />
					<c:if test="${order.lowStocks == 'y'}"><font color="red">【缺货】</font></c:if>
				</td>
				<td><c:out value="${order.amount}" />
					<c:if test="${order.updateAmount == 'y' }"><font color="red">【修】</font></c:if>
				</td>
				<td><c:out value="${order.ptotal}" /></td>
				<td><c:out value="fee" /></td>
				<td align="center"><c:out value="${order.quantity}" /></td>
				<td><a target="_blank" href="${ctx}/manage/account/show.action?account=${order.account}">
				<c:out value="${order.account}" /></a></td>
				<td><c:out value="${order.createdate}" /></td>
				<td><c:out value="${order.statusStr}" />
					<c:choose>
						<c:when test="${order.status == 'cancel'}">
						   <img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
						</c:when>
						<c:when test="${order.status == 'file'}">
						   <img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						</c:when>
						<c:when test="${order.status == 'init'}">
						   <img src="<%=request.getContextPath() %>/resource/images/action_add.gif">
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</td>
				<td><c:out value="${e.paystatusStr}" />
					<c:choose>
						<c:when test="${order.paystatus == 'y'}">
						   <img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						</c:when>
						<c:when test="${order.paystatus == 'n'}">
						   <img src="<%=request.getContextPath() %>/resource/images/action_add.gif">
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</td>
				<td><a target="_blank" href="${ctx}/manage/order/toEdit.action?id=${order.id}">编辑</a>|
				<a target="_blank" href="${ctx}/manage/order/toPrint.action?id=${order.id}">打印</a>
				</td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="55" style="text-align: center;"><%@ include file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
		<div class="alert alert-info" style="text-align: left;font-size: 14px;margin: 2px 0px;">
			图标含义：<BR>
			<img alt="新增" src="<%=request.getContextPath() %>/resource/images/action_add.gif">：未审核、未支付
			<img alt="已上架" src="<%=request.getContextPath() %>/resource/images/action_check.gif">：已归档
			<img alt="已下架" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">：已取消
		</div>
	</form>
</body>
</html>
