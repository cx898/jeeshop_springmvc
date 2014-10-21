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
	<form action="${ctx}/manage/account/selectList" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td style="text-align: right;" nowrap="nowrap">账号</td>
				<td style="text-align: left;">
				<input type="text" id="account" class="search-query input-small" name="account" value="${e.account}" />
				</td>
				<td style="text-align: right;" nowrap="nowrap">昵称</td>
				<td style="text-align: left;">
				<input type="text" id="nickname" class="input-small" name="nickname" value="${e.nickname}">
				</td>
				<td style="text-align: right;" nowrap="nowrap">会员等级</td>
				<td style="text-align: left;">
				<select id="rank" name="rank" class="input-medium">
							<option value=''></option>
							<option value='R1' <c:if test='${e.rank=="R1"}'>selected='selected'</c:if>>普通会员</option>
							<option value='R2' <c:if test='${e.rank=="R2"}'>selected='selected'</c:if>>铜牌会员</option>
							<option value='R3' <c:if test='${e.rank=="R3"}'>selected='selected'</c:if>>银牌会员</option>
							<option value='R4' <c:if test='${e.rank=="R4"}'>selected='selected'</c:if>>金牌会员</option>
							<option value='R5' <c:if test='${e.rank=="R5"}'>selected='selected'</c:if>>钻石会员</option>
				</select>
				<td style="text-align: right;" nowrap="nowrap">状态</td>
				<td style="text-align: left;">
					<select id="freeze" name="freeze" class="input-medium">
							<option value=''></option>
							<option value='y' <c:if test='${e.freeze=="y"}'>selected='selected'</c:if>>已冻结</option>
							<option value='n' <c:if test='${e.freeze=="n"}'>selected='selected'</c:if>>未冻结</option>
					</select>
				</td>
				<td style="text-align: right;" nowrap="nowrap">注册日期</td>
				<td style="text-align: left;" colspan="3" nowrap="nowrap">
					<input id="d4311" class="Wdate search-query input-small" type="text" name="startDate"
					value="<c:out value="${e.startDate}" />"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4312" class="Wdate search-query input-small" type="text" name="endDate" 
					value="<c:out value="${e.endDate}" />"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
						</td>
			</tr>
			<tr>
				<td colspan="28">
					<button method="${ctx}/manage/account/selectList.action" class="btn btn-primary" onclick="selectList(this)">
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
				<th nowrap="nowrap">登陆方式</th>
				<th nowrap="nowrap">帐号</th>
				<th nowrap="nowrap">昵称</th>
				<th nowrap="nowrap">会员等级</th>
				<th nowrap="nowrap">邮箱</th>
				<th nowrap="nowrap">注册日期</th>
				<th nowrap="nowrap">最后登录时间</th>
				<th nowrap="nowrap">最后登录IP</th>
				<th nowrap="nowrap">是否冻结</th>
<!-- 				<th width="150px">冻结时间</th> -->
				<th nowrap="nowrap">操作</th>
			</tr>
			<c:forEach items="${pager.list}" var="account">  
			  <tr>
			   <td><input type="checkbox" name="ids" value="<c:out value='${account.id}' />" /></td>
			   <td nowrap="nowrap" align="center">
				<c:choose>
					<c:when test="${account.accountType == 'qq'}">
					   <img alt="" src="<%=request.getContextPath() %>/resource/images/mini_qqLogin.png">
					</c:when>
					<c:when test="${account.accountType == 'sinawb'}">
					   <img alt="" src="<%=request.getContextPath() %>/resource/images/mini_sinaWeibo.png">
					</c:when>
					<c:when test="${account.accountType == 'alipay'}">
					   <span class="badge badge-warning">alipay</span>
					</c:when>
					<c:otherwise>
					  <span class="badge badge-warning">jeeshop</span>
					</c:otherwise>
				</c:choose>
			</td>
			<td nowrap="nowrap">&nbsp;<c:out value="${account.account}" /></td>
			<td nowrap="nowrap">&nbsp;<c:out value="${account.nickname}" /></td>
			<td nowrap="nowrap">&nbsp;<c:out value="${account.rankName}" /></td>
			<td nowrap="nowrap">&nbsp;<c:out value="${account.email}" /></td>
			<td nowrap="nowrap">&nbsp;<c:out value="${account.regeistDate}" /></td>
			<td nowrap="nowrap">&nbsp;<c:out value="${account.lastLoginTime}" /></td>
			<td nowrap="nowrap">&nbsp;<c:out value="${account.lastLoginIp}" /></td>
			<td nowrap="nowrap">&nbsp;
				<c:choose>
					<c:when test="${account.freeze == 'y'}">
					   <img alt="" src="<%=request.getContextPath() %>/resource/images/login.gif">
					</c:when>
					<c:when test="${account.freeze == 'n'}">
					   <img alt="" src="<%=request.getContextPath() %>/resource/images/mini_sinaWeibo.png">
					</c:when>
					<c:otherwise>
					  <span class="badge badge-warning">异常</span>
					</c:otherwise>
				</c:choose>
			</td>
					<td nowrap="nowrap">
						<a target="_blank" href="${ctx}/manage/account/show.action?account=${account.account}">查看</a>
						<a href="${ctx}/manage/account/toFreeze.action?id=${account.id}">冻结</a>
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
