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
	<form action="${ctx}/manage/email/selectList.action" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td style="text-align: right;" nowrap="nowrap">账号</td>
				<td style="text-align: left;">
				<input type="text" name="account" id="account" value="${e.account}" class="search-query input-small"/>
				</td>
				<td style="text-align: right;" nowrap="nowrap">发送状态</td>
				<td style="text-align: left;">
					<select id="sendStatus" name="sendStatus" class="input-medium">
							<option value=''></option>
							<option value='y' <c:if test='${e.sendStatus=="y"}'>selected='selected'</c:if>>发送成功</option>
							<option value='n' <c:if test='${e.sendStatus=="n"}'>selected='selected'</c:if>>发送失败</option>
					</select>					
				</td>
			</tr>
			<tr>
				<td colspan="28">
					<button method="${ctx}/manage/email/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;"><%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">帐号</th>
				<th nowrap="nowrap">模板名称</th>
				<th nowrap="nowrap">创建时间</th>
				<th nowrap="nowrap">发送状态</th>
				<th nowrap="nowrap">链接状态</th>
			</tr>
			<c:forEach items="${pager.list}" var="email">  
			  <tr>
		   		<td><input type="checkbox" name="ids" value="<c:out value="id}"/>" /></td>
				<td nowrap="nowrap">&nbsp;
					<a target="_blank" href="${ctx}/manage/account/show.action?account=${email.account}">
					<c:out value="${email.account}" /> </a>
				</td>
				<td nowrap="nowrap">&nbsp;
					<c:out value="${email.notifyTemplateName}" />
				</td>
				<td nowrap="nowrap">&nbsp;<c:out value="createdate" /></td>
				<td nowrap="nowrap">&nbsp;
					<c:choose>
						<c:when test="${email.sendStatus == 'y'}">
						   <img alt="发送成功" src="<%=request.getContextPath() %>/resource/images/action_check.gif">发送成功
						</c:when>
						<c:when test="${email.sendStatus == 'n'}">
						   <img alt="发送失败" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">发送失败
						</c:when>
						<c:otherwise>
						       发送中...
						</c:otherwise>
					</c:choose>					
				</td>
				<td nowrap="nowrap">&nbsp;
					<c:choose>
						<c:when test="${email.status == 'y'}">
						   <img alt="已失效" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">已失效
						</c:when>
						<c:when test="${email.status == 'n'}">
						   <img alt="未失效" src="<%=request.getContextPath() %>/resource/images/action_check.gif">未失效
						</c:when>
						<c:otherwise>
						       发送中...
						</c:otherwise>
					</c:choose>	
				</td>
			  </tr>
			</c:forEach>
			<tr>
				<td colspan="16" style="text-align: center;"><%@ include file="/manage/system/pager.jsp"%></td>
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
