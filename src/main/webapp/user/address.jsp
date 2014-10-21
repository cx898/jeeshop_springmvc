<%@page import="net.jeeshop.services.front.catalog.bean.Catalog"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
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
	<div class="container" style="margin-top: 0px;padding-top: 0px;">
		<div class="row">
			<div class="col-xs-3" style="min-height: 300px;">
				<%@ include file="userLeft.jsp"%>
			</div>
			
			<div class="col-xs-9" style="min-height: 200px;">
				<div class="row">
					<form role="form" id="form" class="form-horizontal" action="${ctx}/user/saveAddress.html" theme="simple">   
<!-- 					  <s:hidden name="address.id"/> -->
						<input type="hidden" name="id" value="${address.id}"/>
					  <div class="form-group">
					    <label for="name" class="col-lg-2 control-label">收货人姓名</label>
					    <div class="col-lg-6">
					    	<input type="text" name="name" type="text" value="${address.name}" 
						    class="form-control" id="name" data-rule="收货人姓名:required;length[2~8];name;" placeholder="请输入收货人姓名" maxlength="8" size="8"/>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="name" class="col-lg-2 control-label">地址区域12</label>
					    <div class="col-lg-3">
					    	<%
					    	application.setAttribute("_areaMap", SystemManager.areaMap);
					    	%>
					    	
					    	<select id="province" name="province" class="form-control" onchange="changeProvince()">
					    			<option value="">--选择省份--</option>
							    <c:forEach items="${applicationScope._areaMap}" var="areaMp">
									<option value="${areaMp.key}" <c:if test='${areaMp.key == address.province}'>selected='selected'</c:if>
									>${areaMp.value.name}</option>
								</c:forEach>
							</select>
					    </div>
					    <div class="col-lg-3">
					    
						<c:choose>
							<c:when test="${address.city == null}">
							    <select class="form-control" id="citySelect" name="city" style="display:none" onchange="changeCity()">
						    		<option value="">--选择城市--</option>
						    	</select>
							</c:when>
							<c:otherwise>
						       <c:forEach items="${applicationScope._areaMap}" var="areaMp">
								 <c:if test="${areaMp.value.code == address.province }">
								   <select name="city" id="citySelect" class="form-control" onchange="changeCity()">
							    	   <option value="">--选择城市--</option>
									   <c:forEach items="${areaMp.value.children}" var="tmpCity">
									    <option value="${tmpCity.code}" <c:if test="${tmpCity.code == address.city}">selected='selected'</c:if>>${tmpCity.name}</option>
									   </c:forEach>
								   </select>
								 </c:if>								        
						       </c:forEach>
						  </c:otherwise>
						</c:choose>
					    </div>
					    
					    <div class="col-lg-3">
					    		<c:choose>
									<c:when test="${address.area==null}">
									   <select class="form-control" id="areaSelect" name="area" 
									   style="display:none" >
								    		<option value="">--选择区域--</option>
								    	</select>
									</c:when>
									<c:otherwise>
			 						 <select id="areaSelect" class="form-control" name="area" >
			 						 	 <option>--选择区域--</option>
				 						 <c:forEach items="${address.areaList}" var="area">  
				 						 	<option value="${area.code}" <c:if test='${area.code == address.area}'>selected='selected'</c:if> >${area.name}</option>
										 </c:forEach>
			 						 </select>
									</c:otherwise>
								</c:choose>	
					    </div>
					    
					  </div>
					  <div class="form-group">
					    <label for="address" class="col-lg-2 control-label">地址1</label>
					    <div class="col-lg-6">
					    	<input type="text" name="address" type="text" value="${address.address}"
						    class="form-control" id="address" data-rule="地址:required;length[0~70];address;" placeholder="请输入收货人地址" maxlength="70" size="70"/>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="zip" class="col-lg-2 control-label">邮编</label>
					    <div class="col-lg-6">
					    	<input type="text" name="zip" type="text" value="${address.zip}"
						    class="form-control" id="zip" data-rule="邮编:required;length[6];zip;" placeholder="请输入收货人邮编" size="6" maxlength="6"/>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="mobile" class="col-lg-2 control-label">手机</label>
					    <div class="col-lg-6">
					    	<input type="text" name="mobile" type="text" value="${address.mobile}" 
						    class="form-control" id="mobile" data-rule="手机:required;length[10~15];mobile;" placeholder="请输入收货人手机" maxlength="15"/>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="phone" class="col-lg-2 control-label">电话号码</label>
					    <div class="col-lg-6">
					    	<input type="text" name="phone" type="text" value="${address.phone}" 
						    class="form-control" id="phone" data-rule="电话号码:required;length[0~15];phone;" placeholder="请输入收货人座机号码" maxlength="15"/>
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-lg-offset-2 col-lg-6">
					      <button type="submit" class="btn btn-success btn-sm" value="保存">
					      	 <span class="glyphicon glyphicon-ok"></span>&nbsp;保存
					      </button>
					    </div>
					  </div>
					</form>
					
					<c:choose>
						<c:when test="${addressList!=null and fn:length(addressList) >0}">
						   <table class="table table-bordered table-hover" style="margin-bottom: 10px;">
								<tr style="background-color: #dff0d8">
									<th width="20px" style="display: none;"><input type="checkbox" id="firstCheckbox" /></th>
									<th nowrap="nowrap" style="text-align: center;">收货人</th>
									<th style="text-align: left;">所在区域</th>
									<th style="text-align: left;">街道地址</th>
									<th style="text-align: center;">邮编</th>
									<th style="text-align: center;">电话号码</th>
									<th style="text-align: center;">手机号</th>
									<th nowrap="nowrap" style="text-align: center;">设为默认</th>
									<th style="text-align: center;">操作</th>
								</tr>
								
								 <c:forEach items="${addressList}" var="item">  
								  <tr>
								   		<td style="display: none;"><c:out value="${item.id}"/></td>
										<td style="text-align: center;"><c:out value="${item.name}"/></td>
										<td style="text-align: left;"><c:out value="${item.pcadetail}"/></td>
										<td style="text-align: left;"><c:out value="${item.address}"/></td>
										<td style="text-align: center;"><c:out value="${item.zip}"/></td>
										<td style="text-align: center;"><c:out value="${item.phone}"/></td>
										<td style="text-align: center;"><c:out value="${item.mobile}"/></td>
										<td nowrap="nowrap" style="text-align: center;">
										<c:choose>
											<c:when test="${item.isdefault!=null and item.isdefault=='y' }">
											   <input type="radio" name="setDefaultRadio" value="<c:out value="${item.id}"/>" checked="checked"/>
											</c:when>
											<c:otherwise>
											   <input type="radio" name="setDefaultRadio" value="<c:out value="${item.id}"/>"/>
											</c:otherwise>
										</c:choose>
										</td>
										<td style="text-align: center;" nowrap="nowrap">
											<a href="<%=request.getContextPath() %>/user/editAddress.html?id=<c:out value="${item.id}" />">
												修改
											</a>|
											<a onclick="return deletes();" href="<%=request.getContextPath() %>/user/deleteAddress.html?id=<c:out value="${item.id}"/>">
												删除
											</a>
										</td>
								  </tr>
								 </c:forEach>
							</table>
						</c:when>
						<c:otherwise>
						  <div class="col-xs-12">
								<hr>
								<div class="row">
									<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
										<div class="panel panel-default">
								              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
									              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
									              		<span class="glyphicon glyphicon-user"></span>亲，还没有任何配送信息哦！赶紧添加吧。
									              </div>
								              </div>
										</div>
										<hr>
									</div>
								</div>
								
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/foot.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript">
$(function() {
	$("input[name=setDefaultRadio]").click(function(){
		var _url = $("#namespace").val()+"/user/setAddressDefault.html?id="+$(this).val();
		//alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
			  alert("修改默认地址成功！");
		  },
		  dataType: "json",
		  error:function(){
			alert("操作失败，请联系管理员或更换浏览器再试!");				  
		  }
		});
	});
});
function search(){
	var _key = $.trim($("#key").val());
	if(_key==''){
		return false;
	}
	$("#searchForm").submit();
}
function deletes(){
	return confirm("确定删除选择的记录?");
}
function changeProvince(){
	var selectVal = $("#province").val();
	if(!selectVal){
		console.log("return;");
		return;
	}
	var _url = "selectCitysByProvinceCode.html?provinceCode="+selectVal;
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
	var _url = "selectAreaListByCityCode.html?provinceCode="+selectProvinceVal+"&cityCode="+selectCityVal;
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
