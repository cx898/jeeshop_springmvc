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
	<s:form action="task!selectList" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td colspan="28">
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
				<th nowrap="nowrap">任务代号</th>
				<th nowrap="nowrap">任务名称</th>
				<th nowrap="nowrap">睡眠时间</th>
				<th nowrap="nowrap">睡眠单位</th>
				<th nowrap="nowrap">下次执行任务的时间</th>
				<th nowrap="nowrap">当前状态</th>
				<th nowrap="nowrap">操作</th>
			</tr>
			<s:iterator value="pager.list">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<s:property value="id"/>" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="code" />
						<br>
						<s:property value="clz" />
					</td>
					<td nowrap="nowrap">&nbsp;<s:property value="name" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="sleep" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="unit" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="nextWorkTime" /></td>
					<td nowrap="nowrap">&nbsp;<s:property value="currentStatus" /></td>
					<td nowrap="nowrap">
						<s:if test="currentStatus.equals(\"wait\") or currentStatus.equals(\"stop\")">
							<s:a target="_blank" href="task!startTask.action?e.code=%{code}">立即执行</s:a>
						</s:if>
						<s:elseif test="currentStatus.equals(\"run\")">
							<s:a target="_blank" href="task!stopTask.action?e.code=%{code}">立即终止</s:a>
						</s:elseif>
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
