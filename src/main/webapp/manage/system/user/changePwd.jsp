<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/base.css"  type="text/css">
	
	<%@ include file="/manage/system/common.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		 $("#username").focus();
	});

	function onSubmit() {
		if ($.trim($("#username").val()) == "") {
			alert("帐号不能为空!");
			return false;
		}
		if ($.trim($("#password").val()) == "") {
			alert("密码不能为空!");
			return false;
		}
		if ($.trim($("#rid").val()) == "") {
			alert("请选择角色!");
			return false;
		}
	}
</script>
</head>

<body>
		<div id="contians_div">
			<div id="context_div">
				<div class="alert alert-success">
					<s:property value="errorMsg"/>
				</div>
			</div>
		</div>
</body>
</html>
