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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
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
	<form action="keyvalue" namespace="/manage" method="post" theme="simple">
				<table class="table table-bordered">
					<tr>
						<td style="text-align: right;">键</td>
						<td style="text-align: left;"><input type="text" name="key1" value="${e.key1}" />
						</td>
						<td style="text-align: right;">值</td>
						<td style="text-align: left;"><input type="text" name="value" value="${e.value}"/>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<button method="${ctx}/manage/keyvalue/selectList.action" class="btn btn-primary" onclick="selectList(this)">
								<i class="icon-search icon-white"></i> 查询
							</button>
							
							<a href="${ctx}/manage/keyvalue/toAdd.action" method="toAdd" class="btn btn-success">
								<i class="icon-plus-sign icon-white"></i> 添加
							</a>
							
							<button method="${ctx}/manage/keyvalue/deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
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
						<th style="display: none;">编号</th>
						<th >键</th>
						<th >值</th>
						<th >操作</th>
					</tr>
					<c:forEach items="${pager.list}" var="keyvalue">  
					  <tr>
					    <td><input type="checkbox" name="ids" value="<c:out value='${keyvalue.id}' />" /></td>
					    <td style="display: none;">&nbsp;<c:out value="${keyvalue.id}" /></td>
						<td>&nbsp;<c:out value="${keyvalue.key1}" /></td>
						<td>&nbsp;<c:out value="${keyvalue.value}" /></td>
						<td>
						<a href="${ctx}/manage/keyvalue/toEdit.action?id=<c:out value='${keyvalue.id}' />" >编辑</a>
						</td>
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
