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
	<form action="express" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td colspan="8">
					<button method="${ctx}/manage/express/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					
					<a href="${ctx}/manage/express/toAdd.action" method="toAdd" class="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</a>
					
					<button method="${ctx}/manage/express/deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
					</button>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">快递编码</th>
				<th nowrap="nowrap">名称</th>
				<th nowrap="nowrap">费用</th>
				<th nowrap="nowrap">顺序</th>
				<th style="width: 115px;">操作</th>
			</tr>
			 <c:forEach items="${pager.list}" var="express">  
			  <tr>
			    <td><input type="checkbox" name="ids" value="<c:out value='${express.id}' />" /></td>
			    <td nowrap="nowrap">&nbsp;<c:out value="${express.code}" /></td>
					<td nowrap="nowrap">&nbsp;<c:out value="${express.name}" /></td>
					<td nowrap="nowrap">&nbsp;<c:out value='${express.fee}' /></td>
					<td nowrap="nowrap">&nbsp;<c:out value='${express.order1}' /></td>
					<td nowrap="nowrap">
					<a href="${ctx}/manage/express/toEdit.action?id=<c:out value='${express.id}' />">编辑</a>
					</td>
			  </tr>
			 </c:forEach>	
			<tr>
				<td colspan="16" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</form>
</body>
</html>
