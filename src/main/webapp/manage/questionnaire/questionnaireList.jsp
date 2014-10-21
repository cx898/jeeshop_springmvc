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
	<s:form action="questionnaire" namespace="/manage" method="post"
		theme="simple">
		<table class="table table-bordered">
			<tr>
				<td style="text-align: right;">问卷标题</td>
				<td style="text-align: left;"><s:textfield name="e.title" class="search-query input-small"
						id="title" /></td>
				<td style="text-align: right;">状态</td>
				<td style="text-align: left;">
					<s:select list="#{'':'','y':'已启用','n':'已禁用'}" id="status" name="e.status"  class="input-medium" 
						listKey="key" listValue="value"  />
				</td>
				<td style="text-align: right;">创建时间</td>
				<td style="text-align: left;" colspan="3">
					<input id="d4311" class="Wdate search-query input-small" type="text" name="e.startDate"
					value="<s:property value="e.startDate" />"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4312" class="Wdate search-query input-small" type="text" name="e.endDate" 
					value="<s:property value="e.endDate" />"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
						</td>
			</tr>
			<tr>
				<td colspan="16">
					<s:submit method="selectList" value="查询" class="btn btn-primary"></s:submit>
					<s:submit method="toAdd" action="questionnaire" value="添加" class="btn btn-success" />
					<s:submit method="deletes" onclick="return deleteSelect('确定删除选择的记录?');" value="删除" class="btn btn-danger" />
<%-- 							<s:submit method="updateInBlackList" onclick="return updateInBlackList();" value="加入黑名单" class="btn btn-warning" /> --%>
					<s:submit method="setStatusY" value="显示" onclick="return deleteSelect('确定让选择的记录审核通过?这样选择的记录将会出现在门户上。');" class="btn btn-warning" />
					<s:submit method="setStatusN" value="不显示" class="btn btn-warning" onclick="return deleteSelect('执行该操作后,选择的记录将不会出现在门户上。确定要执行?');"/>
				
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th>ID</th>
				<th>问卷名称</th>
				<th>创建时间</th>
				<th>创建人</th>
				<th>最后修改时间</th>
				<th>最后修改人</th>
				<th>是否启用</th>
				<th>显示日期</th>
				<th style="width: 60px;">操作</th>
			</tr>
			<s:iterator value="pager.list">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<s:property value="id"/>" /></td>
					<td>&nbsp;<s:property value="id" /></td>
					<td>&nbsp;
						<s:a href="questionnaire!toEdit.action?e.id=%{id}" >
						<s:property value="title" /></s:a>
					</td>
					<td>&nbsp;<s:property value="createdate" /></td>
					<td>&nbsp;
						<s:a href="user!toEdit.action?e.username=%{createAccount}" >
							<s:property value="createAccount" />
						</s:a>
					</td>
					<td>&nbsp;<s:property value="updatedate" /></td>
					<td>&nbsp;
						<s:a href="user!toEdit.action?e.username=%{updateAccount}" >
							<s:property value="updateAccount" />
						</s:a>
					</td>
					<td>&nbsp;
						<s:if test="status.equals(\"y\")">
							<img alt="启用" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						</s:if>
						<s:else>
							<img alt="禁用" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
						</s:else>
					</td>
					<td>&nbsp;<s:property value="lastLoginIp" />
						<s:property value="showStartDate" />~<s:property value="showEndDate" />
					</td>
					<td><s:a href="questionnaire!toEdit.action?e.id=%{id}">编辑</s:a>|
						<a href="<%=SystemManager.systemSetting.getWww() %>/question/show.html?id=<s:property value="id" />" target="_blank">查看</a>
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
</body>
</html>
