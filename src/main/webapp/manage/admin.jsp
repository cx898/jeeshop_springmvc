<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<style type="text/css">
.f {
	font-size: 12px;
	font-family: serif;
	color: red;
}
.len{
	width: 160px;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#username").focus();
		
		if (top.location != self.location){     
			top.location=self.location;     
		}
	});
</script>
</head>
<body >
<jsp:forward page="system/index.jsp"></jsp:forward>
</body>
</html>
