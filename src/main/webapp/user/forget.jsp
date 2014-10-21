<%@page import="net.jeeshop.core.util.TokenUtil"%>
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
						<span class="label label-success" style="font-size:100%;">
							1.填写账户信息
						</span>
						&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
						<span class="label label-default" style="font-size:100%;">
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
		                	<span class="glyphicon glyphicon-user"></span>&nbsp;找回密码
		                </h3>
		              </div>
		              <div class="panel-body">
		              	<form role="form" name="form" id="form" class="form-horizontal" action="/user/doForget.html" theme="simple">
		              		<%String token = TokenUtil.getInstance().generateToken(request.getSession());%>
						    <input type="hidden" value="<%=token%>" name="token"/>
						  <div class="form-group">
						    <label for="account" class="col-lg-2 control-label">账号</label>
						    <div class="col-lg-6">
							    <input  name="account" type="text" class="form-control" id="account" placeholder="请输入会员账号" 
							    data-rule="账号:required;account;length[3~10];remote[user/checkAccountExist.html]"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="vcode" class="col-lg-2 control-label">验证码</label>
						    <div class="col-lg-2">
							    <s:textfield name="vcode" type="text" class="form-control" id="vcode" placeholder="验证码" 
							    data-rule="验证码:required;vcode;remote[user/unique.html]" size="4" maxlength="4" />
						    </div>
						    <div class="col-lg-6" style="float: right;">
						    	<img src="<%=SystemManager.systemSetting.getWww() %>/ValidateImage.do" id="codes2" 
										onclick="javaScript:reloadImg2();" class="vcodeCss"></img>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-lg-offset-2 col-lg-6">
						      <button type="submit" class="btn btn-success btn-sm" value="提交信息"/>
						      	<span class="glyphicon glyphicon-ok"></span>&nbsp;提交信息
						      </button>
						    </div>
						  </div>
						</form>
		              </div>
				</div>
				<hr>
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
