<%@page import="net.jeeshop.core.ManageContainer"%>
<%@page import="net.jeeshop.core.system.bean.User"%>
<%@page import="net.jeeshop.core.PrivilegeUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#result_table tr").mouseover(function(){
		$(this).addClass("over");}).mouseout(function(){
		$(this).removeClass("over");});
	
	//全选、反选
	$("#checkAll").click(function() {
        $('input[type=checkbox]').attr("checked",$(this).attr("checked")?true:false); 
    });
});
function deleteSelect(){
	if($("input:checked").size()==0){
		return false;
	}
	return confirm("确定删除选择的记录?");
}
</script>
</head>

<body>
<form action="role" namespace="/manage" method="post" theme="simple">
			<table class="table table-bordered">
				<tr  >
					<td>
						<%if(PrivilegeUtil.check(request.getSession(), "role/selectList.action")){%>
							<a href="${ctx}/manage/role/selectList.action" method="selectList" class="btn btn-primary">
								<i class="icon-search icon-white"></i> 查询
							</a>
						<%} %>
						<%if(PrivilegeUtil.check(request.getSession(), "role/insert.action")){%>
							<a href="${ctx}/manage/role/toAdd.action" method="selectList" class="btn btn-success">
								<i class="icon-search icon-white"></i> 添加
							</a>
						<%} %>
						<%if(PrivilegeUtil.check(request.getSession(), "role/deletes.action")){%>
						<%} %>
						
						<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
								<%@ include file="/manage/system/pager.jsp"%>
						</div>
					</td>
				</tr>
			</table>
			
			<table class="table table-bordered table-hover">
				<tr style="background-color: #dff0d8">
					<th width="20">
						<input type="checkbox" id="checkAll"/>
					</th>
					<th  style="display: none;">rid</th>
					<th>角色名称</th>
					<th>角色描述</th>
					<th>数据库权限</th>
					<th>状态</th>
					<th width="50px">操作</th>
				</tr>
				<c:forEach items="${pager.list}" var="role"> 
					<tr>
						<td>
						<c:if test="${role.id !=1 }"><input type="checkbox" name="ids" value="${role.id}"/></c:if>
						</td>
						
						<td  style="display: none;">&nbsp;${role.rid}</td>
						<td>&nbsp;${role.role_name}</td>
						<td>&nbsp;${role.role_desc}</td>
						<td>&nbsp;${role.role_dbPrivilege}</td>
						<td>&nbsp;
							
						<c:choose>
							<c:when test="${role.status== 'y'}">
							   <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
							</c:when>
							<c:otherwise>
							  <img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
							</c:otherwise>
						</c:choose>
							
							
						</td>
						<td>
							<!-- 系统角色只能是超级管理员编辑 -->
								<%
									User user = (User)request.getSession().getAttribute(ManageContainer.manage_session_user_info);
									if(user.getUsername().equals("admin")){
								%>
								<a href="${ctx}/manage/role/toEdit.action?id=${role.id}">编辑</a>
								<%} %>
						</td>
					</tr>
				</c:forEach>
				<tr>
								<td colspan="15" style="text-align:center;"><%@ include file="/manage/system/pager.jsp"%></td>
							</tr>
			</table>
</form>
</body>
</html>
