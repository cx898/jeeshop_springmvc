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
</head>

<body>
<form action="indexImg" namespace="/manage" method="post" theme="simple">
			<table class="table table-bordered">
				<tr>
					<td colspan="4">
						<a href="${ctx}/manage/indexImg/selectList.action" class="btn btn-primary">
							<i class="icon-search icon-white"></i> 查询
						</a>
						<a href="${ctx}/manage/indexImg/toAdd.action" class="btn btn-success">
							<i class="icon-plus-sign icon-white"></i> 添加
						</a>
						<button method="${ctx}/manage/indexImg/deletes.action" class="btn btn-danger" 
						onclick="return submitIDs(this,'确定删除选择的记录?');">
							<i class="icon-remove-sign icon-white"></i> 删除
						</button>
						<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
								<%@ include file="/manage/system/pager.jsp"%>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="alert alert-info">
				注意：图片尺寸请尽量保持在630*180，否则超出的部分会显示不出来。
			</div>
			
			<table class="table table-bordered">
				<tr style="background-color: #dff0d8">
					<th width="20"><input type="checkbox" id="firstCheckbox"/></th>
					<th style="display: none;">id</th>
					<th nowrap="nowrap">标题</th>
					<th>图片</th>
					<th>排序</th>
					<th style="width: 50px;">操作</th>
				</tr>
				
				 <c:forEach items="${pager.list}" var="indexImg">  
				  <tr>
				   		<td><input type="checkbox" name="ids" value="<c:out value="${indexImg.id}"/>"/></td>
						<td style="display: none;">&nbsp;<c:out value="${indexImg.id}"/></td>
						<td>&nbsp;<c:out value="${indexImg.title}"/></td>
						<td>&nbsp;
							<a href="<%=SystemManager.systemSetting.getImageRootPath() %><c:out value="${indexImg.picture}"/>" target="_blank">
								<img style="max-width: 100px;max-height: 100px;" alt="" 
								src="<%=SystemManager.systemSetting.getImageRootPath() %><c:out value="${indexImg.picture}"/>">
							</a>
							<br>
							<div>图片链接：</div>
							<a target="_blank" href="<c:out value="${indexImg.link}"/>"><c:out value="${indexImg.link}"/></a>
						</td>
						<td>&nbsp;<c:out value="${indexImg.order1}"/></td>
						<td>
							<a href="${ctx}/manage/indexImg/toEdit.action?id=${indexImg.id}">编辑</a>
						</td>
				  </tr>
				 </c:forEach>				
				<tr>
						<td colspan="16" style="text-align: center;"><%@ include file="/manage/system/pager.jsp"%></td>
					</tr>
			</table>
</form>
</body>
</html>
