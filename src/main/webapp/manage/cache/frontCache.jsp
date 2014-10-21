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
	<table class="table table-bordered">
		<tr>
			<td colspan="8"><a href="<%=SystemManager.systemSetting.getWww() %>/interface/cache_manager.jsp?key=loadAll" target="_blank"
				class="btn btn-success">通知门户加载全部数据到内存</a></td>
		</tr>
	</table>
</body>
</html>
