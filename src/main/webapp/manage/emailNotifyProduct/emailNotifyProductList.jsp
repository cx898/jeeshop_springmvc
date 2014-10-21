<%@page import="net.jeeshop.core.ManageContainer"%>
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
</head>

<body>
	<form action="emailNotifyProduct" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td style="text-align: right;" nowrap="nowrap">账号</td>
				<td style="text-align: left;">
				<input type="text" id="account" name="account" class="search-query input-small" value="${e.account}" />
				</td>
				<td style="text-align: right;" nowrap="nowrap">接收到货的邮箱</td>
				<td style="text-align: left;">
				<input type="text" id="receiveEmail" name="receiveEmail" value="${e.receiveEmail}" class="input-small">
				</td>
				<td style="text-align: right;" nowrap="nowrap">是否已发送通知</td>
				<td style="text-align: left;">
					<select id="status" name="status" class="input-medium">
							<option value=''></option>
							<option value='y' <c:if test='${e.status=="y"}'>selected='selected'</c:if>>是</option>
							<option value='n' <c:if test='${e.status=="n"}'>selected='selected'</c:if>>否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="28">
					<button method="${ctx}/manage/emailNotifyProduct/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					<button method="${ctx}/manage/emailNotifyProduct/autoNotify.action" class="btn btn-success" onclick="submitNotValid2222(this)">
						<i class="icon-ok icon-white"></i> 触发通知
					</button>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;"> <%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		
		<div class="alert alert-info">
			发送失败3次的系统将不再尝试发送!
		</div>
		
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">帐号</th>
				<th nowrap="nowrap">接收到货的邮箱</th>
				<th nowrap="nowrap">商品ID</th>
				<th nowrap="nowrap">商品名称</th>
				<th nowrap="nowrap">申请时间</th>
				<th nowrap="nowrap">通知时间</th>
				<th nowrap="nowrap">是否已发送通知</th>
			</tr>
			
			 <c:forEach items="${pager.list}" var="emailNotiProdu">  
			  <tr>
		   		<td><input type="checkbox" name="ids" value="<c:out value="${emailNotiProdu.id}"/>" /></td>
				<td nowrap="nowrap">
					<a target="_blank" href="${ctx}/manage/account/show.action?account=${emailNotiProdu.account}">
					<c:out value="${emailNotiProdu.account}" />
					</a>
				</td>
				<td nowrap="nowrap">&nbsp;<c:out value="receiveEmail" /></td>
				<td nowrap="nowrap">&nbsp;
					<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/product/toEdit.action?id=
					<c:out value="${emailNotiProdu.productID}" />.html" target="_blank">
						<c:out value="productID" />
					</a>
				</td>
				<td nowrap="nowrap">&nbsp;
					<a href="<%=SystemManager.systemSetting.getWww()%>/product/<c:out value="${emailNotiProdu.productID}" />.html"
					 target="_blank" title="<c:out value="${emailNotiProdu.productName}" />">
					<c:out value="productName" /></a>
				</td>
				<td nowrap="nowrap">&nbsp;<c:out value="createdate" /></td>
				<td nowrap="nowrap">&nbsp;<c:out value="notifydate" /></td>
				<td nowrap="nowrap" style="text-align: center;">
					
					<c:choose>
						<c:when test="${emailNotiProdu.status =='y'}">
						   <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						</c:when>
						<c:otherwise>
						  <img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
							(失败:<c:out value="${emailNotiProdu.sendFailureCount}" />次)
						</c:otherwise>
					</c:choose>
				</td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="16" style="text-align: center;"><%@ include file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
	});
	function deleteSelect() {
		if ($("input:checked").size() == 0) {
			return false;
		}
		return confirm("确定删除选择的记录?");
	}
</script>
</body>
</html>
