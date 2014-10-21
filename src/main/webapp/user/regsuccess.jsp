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
			<div class="row" style="margin-top: 10px;">

				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
							<span class="label label-default" style="font-size:100%;">
								1.填写注册信息 
							</span>
<%-- 							&nbsp;<span class="glyphicon glyphicon-arrow-right"></span> --%>
							&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
							<span class="label label-success" style="font-size:100%;">
								2.邮箱验证 
							</span>
<%-- 							&nbsp;<span class="glyphicon glyphicon-arrow-right"></span> --%>
							&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
							<span class="label label-default" style="font-size:100%;">
								3.注册成功 
							</span>
						</div>
					</div>
					<hr>
					
					<div class="panel panel-success">
						<div class="panel-heading" style="text-align: left;">
			                <h3 class="panel-title">
			                	<span class="glyphicon glyphicon-user"></span>&nbsp;用户注册
			                </h3>
			              </div>
			              <div class="panel-body" style="font-weight: normal;text-align: center;">
			              	  <div class="panel-body " style="font-size: 14px;font-weight: normal;">
				              	 <span class="glyphicon glyphicon-ok text-success"></span>
								 <span class="text-success" style="font-size: 22px;">邮件已发送，请立刻去验证。</span>
								 <hr>
								 <div style="text-align: left;padding-left:100px;">
								 	<dl>
									  <dt>如果您长时间未收到邮件，您可以：</dt>
									  <dd>1、登陆注册时填写的邮箱，检查是否被当成垃圾邮件处理了。</dd>
									  <dd>2、您可以点击<span class="glyphicon glyphicon-share-alt"></span><a href="<%=SystemManager.systemSetting.getWww()%>/user/sendEmailAgain.html?uid=<%=request.getSession().getAttribute("uid").toString()%>">再次发送</a></dd>
									  <dd>如果已上都不能解决您的问题，请联系<%=SystemManager.systemSetting.getSystemCode() %>管理员寻求帮助：
									 	<%=SystemManager.systemSetting.getEmail() %></dd>
									</dl>
								 </div>
				              </div>
			              </div>
					</div>
					<hr>
					<%
					//检查是否是从注册成功后的跳转,不是则直接报错,主要是禁止直接访问该页面.
					//String checkEmail = request.getSession().getAttribute("checkEmail").toString();
					//if(!checkEmail.equals("checkEmail")){
						//throw new NullPointerException("error");
					//}
					%>
				</div>
			</div>
		</div>
	<%@ include file="/foot.jsp"%>
</body>
</html>
