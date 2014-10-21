<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!-- <html class="no-js"> -->
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<style type="text/css">
.centerImageCss{
	width: 560px;
	height: 180px;
}
</style>
</head>

<body>
	<%@ include file="/indexMenu.jsp"%>
<div id="wrap" style="margin-top: 0px;">
	<div class="container" style="margin-top: 0px;padding-top: 0px;">
		<div class="row">
			<div class="well well-lg">
			  <h4>恭喜:账号注册成功!</h4>
			  <p>
			  	确认信已经成功发送到你的邮箱khkhkh@qq.com了
				查看收件箱...点击确认信中的链接地址，就可以完成注册了！
				如果你很长时间还没有收到ITeye的确认信，请... 
				确认邮件是否被你提供的邮箱系统自动拦截，或被误认为垃圾邮件放到垃圾箱了
				如果你确认邮箱地址正确，可以请求再次发送确认信
				如果还不能解决你的问题，可以发邮件给ITeye管理员寻求帮助：webmasteriteye.com
			  </p>
			  <p><a class="btn btn-primary btn-sm" role="button">再次发送确认信</a></p>
			</div>
		</div>
		<!-- 
		<div class="row">
			<div class="col-md-2" style="min-height: 100px;border: 0px solid red;">
			</div>
			<div class="col-md-8" style="min-height: 100px;border: 0px solid red;">
				<div class="alert alert-info" style="font-size: 18px;">恭喜:账号注册成功!</div>
			</div>
			<div class="col-md-2" style="min-height: 100px;border: 0px solid red;">
			</div>
		</div>
		 -->
	</div>
</div>
	
<%@ include file="/foot.jsp"%>
<%@ include file="/resource/common_js.jsp"%>
</body>
</html>
