<%@page import="net.jeeshop.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
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
	<form action="${ctx}/manage/user" namespace="/" method="post" theme="simple">
		<table class="table table-bordered table-condensed">
			<tr>
				<td style="text-align: right;">状态</td>
				<td style="text-align: left;"></td>
				<td><select id="status" name="status" class="input-small">
						<option value=''></option>
						<option value='y' <c:if test='${e.status=="y"}'>selected='selected'</c:if>>启用</option>
						<option value='n' <c:if test='${e.status=="n"}'>selected='selected'</c:if>>禁用</option>
				</select></td>
			</tr>
			<tr>
				<tr>
			<td colspan="11">
				<%if(PrivilegeUtil.check(request.getSession(), "user/selectList.action")){%>
					<button method="${ctx}/manage/user/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "user/insert.action")){%>
					<a href="${ctx}/manage/user/toAdd.action" method="toAdd" class="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</a>
				<%} %>
				<%if(PrivilegeUtil.check(request.getSession(), "user/deletes.action")){%>
				<%} %>
				
				
				<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
				</div>
			</td>
		</tr>
	</table>
	
	<table class="table table-bordered table-hover">
		<thead>
			<tr style="background-color: #dff0d8">
			<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
			<th style="display: none;">id</th>
			<th>帐号</th>
			<th>昵称</th>
			<th>创建时间</th>
			<th>角色</th>
			<th>状态</th>
			<th nowrap="nowrap">操作</th>
		</tr></thead>
           <c:forEach items="${pager.list}" var="user">
			<tr >
				<td><c:if test="${user.id}!=1"><input type="checkbox" name="ids" value="${user.id}"/></c:if></td>
				<td  style="display: none;">&nbsp;${user.id}</td>
				<td>&nbsp;${user.username}</td>
				<td>&nbsp;${user.nickname}</td>
				<td>&nbsp;${user.createtime}</td>
				<td>&nbsp;${user.role_name}</td>
				<td>
					<c:if test="${user.status == 'y'}">
						<img src="${ctx}/resource/images/action_check.gif">
					</c:if>
					<c:if test="${user.status == 'n'}">
						<img src="${ctx}/resource/images/action_delete.gif">
					</c:if>
				</td>
				<td>
					<a href="${ctx}/manage/user/toEdit.action?id=${user.id}">编辑</a>
				</td>
			</tr>
			</c:forEach>
		
		<tr><td colspan="16" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
		</tr>
	</table>
</form>
</body>
</html>
