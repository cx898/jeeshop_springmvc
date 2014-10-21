<%@page import="net.jeeshop.services.manage.order.bean.Order"%>
<%@page import="net.jeeshop.core.KeyValueHelper"%>
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
<title>修改订单的配送地址信息</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="container" style="margin-top: 0px;padding-top: 0px;">
		<div class="row">
			<div class="col-md-9" style="min-height: 200px;">
				<div class="row">
					<div class="alert alert-info">
						修改订单配送地址信息
					</div>
					<form action="" namespace="/manage" method="post" theme="simple" name="form" role="form" id="form">
					<input type="hidden" name="ordershiop.id" value="${e.ordership.id}" />
					<table class="table table-bordered">
					<tr>
						<td width="100px">收货人姓名</td>
						<td>
						<input type="text" name="ordership.shipname" id="name"  class="form-control" value="${e.ordership.shipname}"
						data-rule="收货人姓名:required;length[2~8];name;" placeholder="请输入收货人姓名" />
						</td>
					</tr>
					<tr>
						<td>地址区域</td>
						<td>
					    	<%
					    	application.setAttribute("_areaMap", SystemManager.areaMap);
					    	%>
					    	<select id="province" name="ordership.provinceCode" class="form-control">
							    <c:forEach items="${applicationScpoe._areaMap}" var="areaMp">
									<option value="${areaMp.key}" <c:if test='${areaMp.key == e.ordership.provinceCode}'>selected='selected'</c:if>
									>${areaMp.value.name}</option>
								</c:forEach>
							</select>

							<c:choose>
								<c:when test="${e.ordership.cityCode == null}">
								   <select class="form-control" id="citySelect" name="ordership.cityCode" 
								   style="display:none" onchange="changeCity()">
							    		<option value="">--选择城市--</option>
							    	</select>
								</c:when>
								<c:otherwise>
								 <c:forEach items="${applicationScpoe._areaMap}" var="areaMp" status="i">  
								 	<c:if test="${e.ordership.provinceCode == areaMp.value.code}">
			 						 <select id="citySelect" class="form-control" name="ordership.cityCode" onchange="changeCity()">
			 						 	 <option>--选择城市--</option>
				 						 <c:forEach items="${areaMp.value.children}" var="areaCity">  
				 						 	<option value="${areaCity.code}" <c:if test='${areaCity.code == e.ordership.cityCode}'>selected='selected'</c:if> >${areaCity.code.name}</option>
										 </c:forEach>
			 						 </select>
								 	</c:if>
								 </c:forEach>
								</c:otherwise>
							</c:choose>	
						    <c:choose>
									<c:when test="${e.ordership.areaCode == null}">
									   <select class="form-control" id="areaSelect" name="ordership.areaCode" 
									   style="display:none" >
								    		<option value="">--选择区域--</option>
								    	</select>
									</c:when>
									<c:otherwise>
			 						 <select id="areaSelect" class="form-control" name="ordership.areaCode" >
			 						 	 <option>--选择区域--</option>
				 						 <c:forEach items="${areaList}" var="area">  
				 						 	<option value="${area.code}" <c:if test='${area.code == e.ordership.areaCode}'>selected='selected'</c:if> >${area.name}</option>
										 </c:forEach>
			 						 </select>
									</c:otherwise>
								</c:choose>	
							</td>
						</tr>
						<tr>
							<td>地址</td>
							<td><input type="text" id="address" name="ordership.shipaddress" value="${e.ordership.shipaddress}" 
							class="form-control" data-rule="地址:required;length[0~70];address;" placeholder="请输入收货人地址" />
							</td>
						</tr>
						<tr>
							<td>邮编</td>
							<td><input type="text" id="zip" name="ordership.zip" value="${e.ordership.zip}" 
							class="form-control" data-rule="邮编:required;length[0~70];zip;" placeholder="请输入收货人邮编" />
							</td>
						</tr>
						<tr>
							<td>手机</td>
							<td><input type="text" id="mobile" name="ordership.phone" value="${e.ordership.phone}" 
							class="form-control" data-rule="手机:required;length[0~70];mobile;" placeholder="请输入收货人手机" /></td>
						</tr>
						<tr>
							<td>电话号码</td>
							<td>
							<input type="text" id="phone" name="ordership.tel" value="${e.ordership.tel}" 
							class="form-control" data-rule="电话号码:required;length[0~70];phone;" placeholder="请输入收货人座机号码" />
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="submit" class="btn btn-success btn-sm" value="保存">
					      	 	<span class="glyphicon glyphicon-ok"></span>确认修改
					      		</button>
					      		<input type="button" value="返回" class="btn btn-default btn-sm" onclick="javascript:history.go(-1);"/>
					      	</td>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
$(function() {
});

function changeProvince(){
	var selectVal = $("#province").val();
	if(!selectVal){
		console.log("return;");
		return;
	}
	var _url = "order!selectCitysByProvinceCode.action?provinceCode="+selectVal;
	console.log("_url="+_url);
	$("#citySelect").empty().show().append("<option value=''>--选择城市--</option>");
	$("#areaSelect").empty().hide().append("<option value=''>--选择区域--</option>");
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

function changeCity(){
	var selectProvinceVal = $("#province").val();
	var selectCityVal = $("#citySelect").val();
	if(!selectProvinceVal || !selectCityVal){
		console.log("return;");
		return;
	}
	var _url = "order!selectAreaListByCityCode.action?provinceCode="+selectProvinceVal+"&cityCode="+selectCityVal;
	console.log("_url="+_url);
	$("#areaSelect").empty().show().append("<option value=''>--选择区域--</option>");
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {},
	  dataType: "json",
	  success: function(data){
		  //console.log("changeProvince success!data = "+data);
		  $.each(data,function(index,value){
			  //console.log("index="+index+",value="+value.code+","+value.name);
			  $("#areaSelect").append("<option value='"+value.code+"'>"+value.name+"</option>");
		  });
	  },
	  error:function(er){
		  console.log("changeCity error!er = "+er);
	  }
	});
}
</script>
</body>
</html>
