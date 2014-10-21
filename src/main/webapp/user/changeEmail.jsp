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
						  <li>个人资料</li>
						  <li class="active">修改邮箱</li>
						</ol>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
						<span class="label label-success" style="font-size:100%;">
							1.填写账户信息
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							2.身份验证
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							3.完成
						</span>
					</div>
				</div>
				<hr>
				
				<div class="row">
					<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
						<div class="panel panel-default">
				              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
				              		<form role="form" id="form" class="form-horizontal" action="/user/doChangeEmail.html" theme="simple">   
									  <%String token = TokenUtil.getInstance().generateToken(request.getSession());%>
								      <input type="hidden" value="<%=token%>" name="token"/>
									  <input type="hidden" name="id" value="<c:out value="${sessionScope.user_info.id}"/>"/>
									  <div class="form-group">
									    <label for="account" class="col-lg-2 control-label">登陆密码：</label>
									    <div class="col-lg-6">
										    <input type="text" name="password" type="text" class="form-control" id="password" 
					 					    data-rule="登陆密码:required;length[6~20];password;remote[user/checkPassword.html]" placeholder="请输入登陆密码" />
									    </div>
									  </div>
									  <div class="form-group">
									    <label for="account" class="col-lg-2 control-label">邮箱：</label>
									    <div class="col-lg-6">
										    <input type="text" name="newEmail" type="text" class="form-control" id="newEmail" 
					 					    data-rule="邮箱:required;newEmail;remote[user/changeEmailCheck.html]" placeholder="请输入邮箱" />
									    </div>
									  </div>
									  
									  <div class="form-group">
									    <div class="col-lg-offset-2 col-lg-6">
									      <input type="submit" type="submit" class="btn btn-success btn-sm" value="提交"/>
									    </div>
									  </div>
									</form>
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
