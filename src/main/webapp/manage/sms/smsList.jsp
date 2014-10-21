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
	<s:form action="sms!selectList" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td style="text-align: right;" nowrap="nowrap">手机号码</td>
				<td style="text-align: left;"><s:textfield name="e.phone" class="search-query input-small"
						id="phone" /></td>
			</tr>
			<tr>
				<td colspan="8">
					<s:submit method="selectList" value="查询" class="btn btn-primary"/>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">手机号码</th>
				<th nowrap="nowrap">短息内容</th>
				<th nowrap="nowrap">发送时间</th>
				<th nowrap="nowrap">类型</th>
				<th nowrap="nowrap">发送状态</th>
				<th style="width: 115px;">操作</th>
			</tr>
			<s:iterator value="pager.list">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<s:property value="id"/>" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="phone" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="content" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="sendTime" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="type" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="returnCode" /></td>
					<td nowrap="nowrap">
						<s:if test="e.returnCode<=0">
							<s:a href="sms!updateSendSMS.action?e.id=%{id}">重发</s:a>
						</s:if>
					</td>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="16" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</s:form>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
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
</script>
</body>
</html>
