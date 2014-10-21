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

<style type="text/css">
#birthday{ height:40px;}
</style>
<body>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-3">
				<%@ include file="userLeft.jsp"%>
			</div>
			
			<div class="col-xs-9">
			
				<form role="form" id="form" class="form-horizontal" action="${ctx}/user/saveSetting.html" theme="simple">   
				  <input type="hidden" name="id" value="<c:out value="${sessionScope.user_info.id}"/>"/>
				  <div class="form-group">
				    <label for="account" class="col-lg-2 control-label">昵称：</label>
				    <div class="col-lg-6">
				    	<label class="radio-inline" style="padding-left: 0px;">
				    		<c:out value="${sessionScope.user_info.nickname}"/>
				    		<c:if test="${sessionScope.user_info.accountType==null}">(<c:out value="${sessionScope.user_info.account}"/>)</c:if>
				    		
				    		<c:choose>
				    		  <c:when test="${sessionScope.user_info.accountType ==null }"></c:when>
				    		  <c:when test="${sessionScope.user_info.accountType =='qq' }">(QQ登陆)</c:when>
				    		  <c:when test="${sessionScope.user_info.accountType =='sinawb'}">(新浪微博)</c:when>
				    		  <c:when test="${sessionScope.user_info.accountType =='alipay'}">(支付宝快捷)</c:when>
				    		</c:choose>
				    	</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="account" class="col-lg-2 control-label">真实姓名：</label>
				    <div class="col-lg-6">
				    	<input type="text" name="trueName" value="${e.trueName}" type="text" class="form-control" 
				    	id="trueName" placeholder="请输入真实姓名"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="account" class="col-lg-2 control-label">性别：</label>
				    <div class="col-lg-8">
				    	<input type="radio" name="sex" value="m" <c:if test="${e.sex=='m' }">checked="checked"</c:if> >男
				    	<input type="radio" name="sex" value="f" <c:if test="${e.sex=='f' }">checked="checked"</c:if> >女
				    	<input type="radio" name="sex" value="s" <c:if test="${e.sex=='s' }">checked="checked"</c:if> >保密
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="account" class="col-lg-2 control-label">生日：</label>
				    <div class="col-lg-6">
				    	<input id="birthday" name="birthday" class="Wdate form-control" value="<c:out value="${e.birthday}"/>" 
				    	type="text" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="account" class="col-lg-2 control-label">邮箱：</label>
				    <div class="col-lg-6">
				    	<c:out value="${e.email}"/>
				    	<a href="<%=request.getContextPath()%>/user/changeEmail.html">修改邮箱</a>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="account" class="col-lg-2 control-label">所在地：</label>
				    <div class="col-lg-3">
					    	<%
					    	application.setAttribute("_areaMap", SystemManager.areaMap);
					    	%>
					    	
					    	<select id="province" name="province" class="form-control" onchange="changeProvince()">
						    	<option value="">--选择省份--</option>
						    	<c:forEach items="${applicationScope._areaMap}" var="province">
						    	  <option value="${province.key}" <c:if test="${province.key ==e.province}">selected='selected'</c:if>>${province.value.name}</option>
						    	</c:forEach>
					    	</select>
					    </div>
					    <div class="col-lg-3">
						<c:choose>
						  <c:when test="${e.city == null }">
						        <select class="form-control" id="citySelect" name="city">
						    		<option value="">--选择城市--</option>
						    	</select>
						  </c:when>
						  <c:otherwise>
						       <c:forEach items="${applicationScope._areaMap}" var="item">
								 <c:if test="${item.value.code == e.province }">
								   <select name="city" id="citySelect" class="form-control">
							    	   <option value="">--选择城市--</option>
									   <c:forEach items="${item.value.children}" var="tmpCity">
									    <option value="${tmpCity.code}" <c:if test="${tmpCity.code == e.city}">selected='selected'</c:if>>${tmpCity.name}</option>
									   </c:forEach>
								   </select>
								 </c:if>								        
						       </c:forEach>
						  </c:otherwise>
						</c:choose>
					    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="col-lg-offset-2 col-lg-6">
				      <input type="submit"  class="btn btn-success btn-sm" value="保存"/>
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</div>
	
<%@ include file="/foot.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function() {
	//$("#birthday").addClass("form-control");
});
function changeProvince(){
	var selectVal = $("#province").val();
	if(!selectVal){
		console.log("return;");
		return;
	}
	var _url = "selectCitysByProvinceCode.html?provinceCode="+selectVal;
	console.log("_url="+_url);
	$("#citySelect").empty().append("<option value=''>--选择城市--</option>");
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {},
	  dataType: "json",
	  success: function(data){
		  //console.log("changeProvince success!data = "+data);
		  $.each(data,function(index,value){
			  //console.log("index="+index+",value="+value.code+","+value.name);
			  $("#citySelect").append("<option value='"+value.code+"'>"+value.name+"</option>");
		  });
	  },
	  error:function(er){
		  console.log("changeProvince error!er = "+er);
	  }
	});
}
</script>
</body>
</html>
