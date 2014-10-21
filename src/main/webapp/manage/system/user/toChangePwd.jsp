<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript">
	$(function() {
		 $("#password").focus();
	});

	function onSubmit() {
		if ($.trim($("#password").val()) == "") {
			alert("旧密码不能为空!");
			$("#password").focus();
			return false;
		}
		if ($.trim($("#newpassword").val()) == "") {
			alert("密码不能为空!");
			$("#newpassword").focus();
			return false;
		}
		if ($.trim($("#newpassword2").val()) == "") {
			alert("密码不能为空!");
			$("#newpassword2").focus();
			return false;
		}
		if ($.trim($("#newpassword2").val()) != $.trim($("#newpassword").val())) {
			alert("两次输入的密码不一致!");
			return false;
		}
	}
</script>
</head>

<body style="text-align: center;">
	<form action="user!updateChangePwd.action" namespace="/" theme="simple">
		<table class="table table-bordered" >
			<tr>
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>修改密码</strong>
				</td>
			</tr>
			<tr style="display:none;">
				<th>id</th>
				<td><input type="hidden" name="id" value="${e.id}"/></td>
			</tr>
			<tr>
				<th style="text-align: right;">旧密码</th>
				<td style="text-align: left;">
				<input type="password" name="password" id="password"
				data-rule="旧密码:required;password;length[6~20];remote[${ctx}/manage/user/checkOldPassword.action]"  />
			</tr>
			<tr>
				<th style="text-align: right;">新密码</th>
				<td style="text-align: left;">
				<input type="password" name="newpassword" id="newpassword"
				data-rule="新密码:required;newpassword;length[6~20];"  />
				</td>
			</tr>
			<tr>
				<th style="text-align: right;">确认新密码</th>
				<td style="text-align: left;">
				<input type="password" name="newpassword2" id="newpassword2"
				data-rule="确认密码:required;match(newpassword)"  />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button method="${ctx}/manage/user/updateChangePwd.action" class="btn btn-success">
						<i class="icon-ok icon-white"></i> 确认修改
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
