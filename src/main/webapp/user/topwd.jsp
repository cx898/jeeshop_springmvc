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
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/validator-0.6.3/jquery.validator.css" />
<style type="text/css">
/* 	#form .n-invalid {border: 1px solid #f00;} */
</style>
<style type="text/css">
.centerImageCss{
	width: 560px;
	height: 180px;
}
</style>
</head>

<body>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-3">
				<%@ include file="userLeft.jsp"%>
			</div>
			
			<div class="col-xs-9">
				
				<form role="form" id="form" class="form-horizontal jqtransform" action="${ctx}/user/changePwd.html" autocomplete="off" theme="simple" >   
				  <input type="hidden" name="id" value="<c:out value="${sessionScope.user_info.id}"/>"/>
				  
				  <div class="form-group">
				    <label for="optionMessage" class="col-lg-2 control-label"></label>
				    <div class="col-lg-6">
				    	<div id="insertOrUpdateMsg" style="background-color: #aaa;font-size: 14px;">
						    <c:out value="${errorMsg}"/>
				    	</div>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="password" class="col-lg-2 control-label">原密码</label>
				    <div class="col-lg-6">
					    <input  name="password" type="password" class="form-control" id="required" 
					    data-rule="旧密码:required;password;remote[${ctx}/user/unique.html]" placeholder="请输入原密码" />
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="newPassword" class="col-lg-2 control-label">新密码</label>
				    <div class="col-lg-6">
					    <input name="newPassword" type="password" class="form-control" id="newPassword" data-rule="新密码: required;password;" placeholder="请输入密码" />
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="newPassword2" class="col-lg-2 control-label">确认新密码</label>
				    <div class="col-lg-6">
					    <input name="newPassword2" type="password" class="form-control" id="newPassword2" data-rule="确认新密码: required;match(newPassword);" placeholder="请输入确认密码" />
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-8">
					<c:choose>
						<c:when test="${sessionScope.user_info.accountType == null}">
						   <button type="submit" class="btn btn-success btn-sm" value="保存">
					      	 <span class="glyphicon glyphicon-ok"></span>&nbsp;修改
					      </button>
						</c:when>
						<c:otherwise>
						  <div class="panel panel-default">
					              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
					              		<span class="glyphicon glyphicon-user"></span>亲，非系统账号登陆，无需修改密码哦！
					              </div>
							</div>
							<hr>
				    		<input type="submit" class="btn btn-success btn-sm" value="修改" disabled="disabled"/>
						</c:otherwise>
					</c:choose>
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</div>
	
<%@ include file="/foot.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/validator-0.6.3/jquery.validator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/validator-0.6.3/local/zh_CN.js"></script>
<script type="text/javascript">
$(function() {
	if($.trim($("#insertOrUpdateMsg").html()).length>0){
		$("#insertOrUpdateMsg").slideDown(1000).delay(2000).slideUp(1000);
	}
});
</script>
</body>
</html>
