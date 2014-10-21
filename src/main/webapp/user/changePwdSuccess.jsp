<%@page import="net.jeeshop.core.util.TokenUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
</head>

<body>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-3">
				<%@ include file="userLeft.jsp"%>
			</div>
			
			<div class="col-xs-9">
				<div class="row">
					<div class="col-xs-12">
						<ol class="breadcrumb">
						  <li class="active">修改密码</li>
						</ol>
					</div>
				</div>
				
				<hr>
				
				<div class="row">
					<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
						<div class="panel panel-default">
				              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
				              		<span class="glyphicon glyphicon-ok"></span>恭喜您：新密码修改成功！
				              </div>
						</div>
						<hr>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
<%@ include file="/foot.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript">
$(function() {
});
</script>
</body>
</html>
