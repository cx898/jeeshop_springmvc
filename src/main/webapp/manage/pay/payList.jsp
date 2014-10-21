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
	<form action="pay" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td colspan="6">
					<button method="${ctx}/manage/pay/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
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
				<th style="display: none;">编号</th>
				<th >名称</th>
				<th >代码</th>
				<th >卖家账号</th>
				<th >排序</th>
				<th >状态</th>
				<th width="50px">操作</th>
			</tr>
			 <c:forEach items="${pager.list}" var="pay">  
			  <tr>
			    <td><input type="checkbox" name="ids"
						value="<c:out value='${pay.id}' />" /></td>
				<td style="display: none;">&nbsp;<c:out value='${pay.id}' /></td>
				<td>&nbsp;<c:out value="${pay.name}" /></td>
				<td>&nbsp;<c:out value="${pay.code}" /></td>
				<td>&nbsp;<c:out value="${pay.seller}" /></td>
				<td>&nbsp;<c:out value="${pay.order1}" /></td>
				<td>&nbsp;
					<c:choose>
						<c:when test="${pay.status == 'y' }">
						   <img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						</c:when>
						<c:otherwise>
						  <img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
						</c:otherwise>
					</c:choose>
				</td>
				<td><a href="${ctx}/manage/pay/toEdit.action?e.id='${pay.id}'">编辑</a></td>
			  </tr>
			 </c:forEach>			
			<tr>
				<td colspan="17" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</form>
</body>
</html>
