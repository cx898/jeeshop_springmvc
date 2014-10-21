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
<style>
	#advert img{
		max-width: 300px;
		max-height: 477px;
		border:0px;
	}
</style>
</head>

<body>

	<%request.getSession().setAttribute(FrontContainer.selectMenu,FrontContainer.not_select_menu); %>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-4" style="background-color:#fff;border:0px;">
				<div id="advert" style="text-align: right;">
<%-- 					<%@ include file="/advert/advert_register_page.jsp"%> --%>

					<div style="margin-top: 100px;text-align: right;font-weight: 600" >
						<div class="panel panel-default">
							<div class="panel-heading">也可以这样登陆：</div>
						  <div class="panel-body">
						    
						    
						    <div>
								<a href="<%=request.getContextPath() %>/user/qqLogin.html" title="使用QQ号登陆">
			              		<img src="<%=SystemManager.systemSetting.getWww()%>/resource/images/qqLogin.png">
			              	</a>
							</div>
			              	<br>
	              	
			              	<div>
				              	<a  href="<%=request.getContextPath() %>/user/sinawb.html" title="使用新浪微博账号登陆">
				              		<img src="<%=SystemManager.systemSetting.getWww()%>/resource/images/sinawbLogin.png">
				              	</a>
			              	</div>
			              	<br>
	              	
			              	<div>
				              	<a href="alipayFastLogin.html" title="使用支付宝快捷登陆">
									<img src="<%=SystemManager.systemSetting.getWww() %>/resource/images/alipay_fastlogin.jpg" alt="支付宝快捷登陆">
								</a>
			              	</div>
							<br>
					
						  </div>
						</div>
					</div>
					
				</div>
			</div>		
			<div class="col-xs-8">
				<div class="row">
					<div class="col-md-12" style="font-size: 14px;font-weight: normal;margin-left: 50px;">
						<span class="label label-success" style="font-size:100%;">
							1.填写注册信息 
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							2.邮箱验证 
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
							3.注册成功 
						</span>
					</div>
				</div>
				<hr>
				<form role="form" id="form" class="form-horizontal" action="${ctx}/user/doRegister.html" theme="simple" >   
				  <div class="form-group">
				    <label for="nickname" class="col-md-2 control-label">昵称</label>
				    <div class="col-md-6">
					    <input  name="nickname" type="text" class="form-control" id="nickname" placeholder="请输入昵称" 
					    data-rule="昵称:required;nickname;length[2~10];remote[${ctx}/user/unique.html]" maxlength="100"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="account" class="col-md-2 control-label">账号</label>
				    <div class="col-md-6">
					    <input  name="account" type="text" class="form-control" id="account" placeholder="请输入账号" 
					    data-rule="账号:required;account;length[3~10];remote[${ctx}/user/unique.html]" maxlength="100" />
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="password" class="col-md-2 control-label">密码</label>
				    <div class="col-md-6">
					    <input  name="password" type="password" class="form-control" id="password" placeholder="请输入密码" 
					    maxlength="100" data-rule="密码:required;password"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="password" class="col-md-2 control-label">确认密码</label>
				    <div class="col-md-6">
					    <input  name="password2" type="password" class="form-control" id="password2" placeholder="请输入确认密码" 
					    maxlength="100" data-rule="确认密码:required;match(password)"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="email" class="col-md-2 control-label">邮箱</label>
				    <div class="col-md-6">
					    <input  name="email" type="text" class="form-control" id="email" maxlength="45" 
					    data-rule="邮箱:required;email;length[1~45];remote[${ctx}/user/unique.html]" placeholder="请输入邮箱，找回密码用的" />
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="vcode" class="col-md-2 control-label">验证码</label>
				    <div class="col-md-2">
					    <input type="text" name="vcode" type="text" class="form-control" id="vcode" placeholder="验证码" 
					    data-rule="验证码:required;vcode;remote[${ctx}/user/unique.html]" size="4" maxlength="4" />
				    </div>
				    <div class="col-md-6" style="float: right;">
				    	<img src="<%=SystemManager.systemSetting.getWww() %>/ValidateImage.do" id="codes2" 
								onclick="javaScript:reloadImg2();" class="vcodeCss"></img>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-md-offset-2 col-md-6">
				      <button type="submit" class="btn btn-success btn-sm" value="注 册">
				      	<span class="glyphicon glyphicon-ok"></span>&nbsp;注册
				      </button>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="email" class="col-md-2 control-label">注册协议</label>
				    <div class="col-md-6">
				    	<a target="_blank" class="form-control" href="<%=SystemManager.systemSetting.getWww() %>/help/zcxy.html">《myshop用户注册协议》</a>
				    </div>
				  </div>
				  
				</form>
			</div>
			</div>
		</div>
<%@ include file="/foot.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript">
function reloadImg2() {
	document.getElementById("codes2").src = "<%=SystemManager.systemSetting.getWww() %>/ValidateImage.do?" + "radom="
			+ Math.random();
	$("#vcode2").focus();
}
</script>
</body>
</html>
