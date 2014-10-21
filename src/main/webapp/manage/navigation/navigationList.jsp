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
	<form action="navigation" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td colspan="6">
					<button method="${ctx}/manage/navigation/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					<a href="${ctx}/manage/navigation/toAdd.action" class="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</a>
					<button method="${ctx}/manage/navigation/deletes.action" class="btn btn-danger" 
					onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
					</button>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		<div class="alert alert-info" style="margin-bottom: 2px;text-align: left;">友情链接会自动显示到门户的最底部。友情链接的地址不要以“http://”开头。</div>
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th style="display: none;">编号</th>
				<th >名称</th>
				<th >链接</th>
				<th >打开方式</th>
				<th >位置</th>
				<th >顺序</th>
				<th nowrap="nowrap">操作</th>
			</tr>
			<c:forEach items="${pager.list}" var="navigation">  
			  <tr>
			   		<td><input type="checkbox" name="ids" value="<c:out value="${navigation.id}"/>" /></td>
					<td style="display: none;">&nbsp;<c:out value="${navigation.id}" /></td>
					<td>&nbsp;<a href="http://<c:out value="${navigation.http}"/>" target="_blank"><c:out value="${navigation.name}" /></a></td>
					<td>&nbsp;<c:out value="${navigation.http}" /></td>
					<td>&nbsp;<c:out value="${navigation.target}" /></td>
					<td>&nbsp;<c:out value="${navigation.position}" /></td>
					<td>&nbsp;<c:out value="${navigation.order1}" /></td>
					<td><a href="${ctx}/manage/navigation/toEdit.action?id=${navigation.id}">编辑</a></td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="71" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>

	</form>
</body>
</html>
