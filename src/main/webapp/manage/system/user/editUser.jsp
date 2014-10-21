<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
.td_right {
	text-align: right;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#username").focus();
	});
</script>
</head>

<body>
	<c:choose>
		<c:when test="${e.id=='' ||e.id==null }">
			<c:set var="formAction" value="'insert'" />
		</c:when>
		<c:otherwise>
			<c:set var="formAction" value="'111'" />
		</c:otherwise>
	</c:choose>
	<form action="" namespace="/" theme="simple" id="form">
		<table class="table table-bordered">
			<tr>
				<td colspan="2"
					style="background-color: #dff0d8; text-align: center;"><strong>帐号编辑</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<th>id</th>
				<td><input type="hidden" name="id" value="${e.id}" /></td>
			</tr>
			<tr>
				<th class="td_right">帐号</th>
				<td style="text-align: left;"><c:choose>
						<c:when test="${e.id=='' ||e.id==null }">
							<input type="textfield" name="username" id="username"
								value="${e.username}"
								data-rule="帐号:required;username;length[4~20];remote[${ctx}/manage/user/unique.action]" />
						</c:when>
						<c:otherwise>
							${e.username}
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th class="td_right">昵称</th>
				<td style="text-align: left;"><input type="textfield"
					value="${e.nickname}" name="nickname" id="nickname"
					data-rule="昵称:required;nickname;length[2~20];remote[${ctx}/manage/user/unique.action]" />
				</td>
			</tr>

			<c:choose>
				<c:when test="${e.id=='' ||e.id==null }">
					<tr>
						<th class="td_right">密码</th>
						<td style="text-align: left;"><input type="password"
							name="password" data-rule="密码:required;password;length[6~20];"
							id="password" /></td>
					</tr>
					<tr>
						<th class="td_right">确认密码</th>
						<td style="text-align: left;"><input type="password"
							name="newpassword2" data-rule="确认密码:required;match(password)"
							id="newpassword2" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th class="td_right">密码</th>
						<td style="text-align: left;"><input type="password"
							name="password" data-rule="密码:password;length[6~20];"
							id="password" /> <br>(不输入表示不修改密码)</td>
					</tr>
					<tr>
						<th class="td_right">确认密码</th>
						<td style="text-align: left;"><input type="password"
							name="newpassword2" data-rule="确认密码:match(password)"
							id="newpassword2" /></td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<th class="td_right">选择角色</th>
				<td style="text-align: left;"><select name="rid" id="rid" val="${e.rid}">
						<c:forEach items="${roleList}" var="role">
							<option value="${role.id}" <c:if test='${role.id == e.rid}'>selected='selected'</c:if> >${role.role_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<c:if
				test="${e.username==null || e.username=='' || e.username=='admin'}">
				<tr>
					<th class="td_right">状态</th>
					<td><select id="status" name="status" class="input-small">
							<option value=''></option>
							<option value='y'
								<c:if test='${e.status=="y"}'>selected='selected'</c:if>>启用</option>
							<option value='n'
								<c:if test='${e.status=="n"}'>selected='selected'</c:if>>禁用</option>
					</select></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" style="text-align: center;"><c:choose>
						<c:when test="${e.id=='' ||e.id==null }">
							<button method="${ctx}/manage/user/insert.action"
								class="btn btn-success">
								<i class="icon-ok icon-white"></i> 新增
							</button>
						</c:when>
						<c:otherwise>
							<button method="${ctx}/manage/user/update.action"
								class="btn btn-success">
								<i class="icon-ok icon-white"></i> 保存
							</button>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</form>
</body>
</html>
