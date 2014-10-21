<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
</head>

<body>
<s:form action="account" namespace="/manage" theme="simple" id="form">

<div id="tabs">
	<ul>
		<li><a href="#tabs-1">基本信息</a></li>
	</ul>
	<div id="tabs-1">
		<div class="alert alert-info" style="margin-bottom: 2px;text-align: left;">
			<strong>后台管理人员信息：</strong>
		</div>
		<table class="table table-bordered">
					<tr style="display: none;">
						<td>id</td>
						<td><input type="hidden" name="id" value="${e.id}" label="id" id="id"/></td>
					</tr>
					<tr>
						<td style="text-align: right;width: 200px;">昵称</td>
						<td style="text-align: left;"><c:out value="${e.nickname}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">账号</td>   
						<td style="text-align: left;"><c:out value="${e.account}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">城市</td>
						<td style="text-align: left;"><c:out value="${e.city}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">联系地址</td>
						<td style="text-align: left;"><c:out value="${e.address}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">证件号码</td>
						<td style="text-align: left;"><c:out value="${e.postcode}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">证件类型</td>
						<td style="text-align: left;"><c:out value="${e.cardType}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">等级</td>
						<td style="text-align: left;"><c:out value="${e.grade}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">消费额</td>
						<td style="text-align: left;"><c:out value="${e.amount}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">电话</td>
						<td style="text-align: left;"><c:out value="${e.tel}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">Email地址</td>
						<td style="text-align: left;"><c:out value="${e.email}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">是否冻结</td>
						<td style="text-align: left;">
							<c:choose>
							  <c:when test="${e.freeze==1}">
							  是
							  </c:when>
							  <c:otherwise>
							    否
							  </c:otherwise>
							</c:choose>
						</td>
					</tr>
					
					<tr>
						<td style="text-align: right;">最后登陆时间</td>
						<td style="text-align: left;"><c:out value="${e.lastLoginTime}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">最后登陆时间</td>
						<td style="text-align: left;"><c:out value="${e.lastLoginIp}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">注册日期</td>
						<td style="text-align: left;"><c:out value="${e.regeistDate}"/></td>
					</tr>
					<tr>
						<td style="text-align: right;">会员类型</td>
						<td style="text-align: left;"><c:out value="${e.accountType}"/></td>
					</tr>
				</table>
	</div>
</div>
</s:form>

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/jquery-1.5.1.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>

<script type="text/javascript">
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
	
});

</script>
</body>
</html>
