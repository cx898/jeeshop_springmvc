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
	<form action="accountRank" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td colspan="8">
					<a method="selectList" href="${ctx}/manage/accountRank/selectList.action" class="btn btn-primary">
					<i class="icon-search icon-white"></i> 查询 </a>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">code</th>
				<th nowrap="nowrap">等级名称</th>
				<th nowrap="nowrap">积分范围</th>
				<th style="width: 115px;">操作</th>
			</tr>
			 <c:forEach items="${pager.list}" var="ar">  
			  <tr>
		   		<td><input type="checkbox" name="ids" value="<c:out value="${ar.id}" />" /></td>
				<td nowrap="nowrap">&nbsp;<c:out value="${ar.code}" /></td>
				<td nowrap="nowrap">&nbsp;<c:out value="${ar.name}" /></td>
				<td nowrap="nowrap">&nbsp;<c:out value="${ar.minScore}" />~<c:out value="${ar.maxScore}" /></td>
				<td nowrap="nowrap">
					<a href="${ctx}/manage/accountRank/toEdit.action?id=${ar.id}">编辑</a>
				</td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="16" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</form>
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
