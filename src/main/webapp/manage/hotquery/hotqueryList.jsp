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
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
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
</head>

<body>
	<form action="hotquery" namespace="/manage" method="post" theme="simple" id="form" name="form">
<%-- 		<input type="hidden" value="${e.type}" name="type" /> --%>
<%-- 		<input type="hidden" value="<c:out value="${e.catalogID}"/>" id="catalogID"/> --%>
		<input type="hidden" name="type" value="" />
		<input type="hidden" value="" id="catalogID"/>
		
		<table class="table table-bordered">
			<tr>
				<td colspan="16">
					<button method="${ctx}/manage/hotquery/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
						
					<a href="${ctx}/manage/hotquery/toAdd.action?type=" class="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</a>
						
					<button method="${ctx}/manage/hotquery/deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
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
				<th width="20px"><input type="checkbox" id="firstCheckbox" /></th>
				<th width="100px">ID</th>
				<th>热门查询关键字</th>
				<th>链接</th>
				<th width="60px;">操作</th>
			</tr>
			
			<c:forEach items="${pager.list}" var="hotq">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<c:out value="${hotq.id}"/>" /></td>
					<td ><c:out value="${hotq.id}"/></td>
					<td class="aCss">
					  <a href="${ctx}/manage/hotquery/toEdit.action?id=${hotq.id}" ><c:out value="${hotq.key1}"/></a>
					</td>
					<td>&nbsp;<a target="_blank" href="<c:out value="${hotq.url}" />"><c:out value="${hotq.url}" /></a></td>
					<td>
						<a href="${ctx}/manage/hotquery/toEdit.action?id=${hotq.id}">编辑</a>
					</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="17" style="text-align: center;font-size: 12px;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
		
	</form>
	

</body>
</html>
