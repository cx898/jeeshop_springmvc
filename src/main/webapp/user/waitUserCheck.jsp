<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ page session="false"%>
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
	
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
						<span class="label label-default" style="font-size:100%;">
							1.填写账户信息
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-success" style="font-size:100%;">
							2.身份验证
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							3.设置新密码
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							4.完成
						</span>
					</div>
				</div>
				<hr>
				
				<div class="panel panel-success">
					<div class="panel-heading" style="text-align: left;">
		                <h3 class="panel-title">
		                	找回密码
		                </h3>
		              </div>
		              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
		              	 <span class="glyphicon glyphicon-ok"></span>
		              	 <span class="text-success">验证邮件已发送，请您登录邮箱完成身份验证！</span>
		              </div>
				</div>
				<hr>
			</div>
		</div>
	</div>
	<%@ include file="/foot.jsp"%>
	<%@ include file="/resource/common_html_validator.jsp"%>
</body>
</html>
