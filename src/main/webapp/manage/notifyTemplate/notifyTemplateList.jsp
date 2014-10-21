<%@page import="net.jeeshop.core.ManageContainer"%>
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
<%@ include file="/resource/common_html_validator.jsp"%>
</head>

<body>
	<form action="211" namespace="/manage" method="post" theme="simple">
		<c:if test="${e.templateCheckError!=null}">
			<div class="alert alert-danger">
				<c:out value="${e.templateCheckError}"/>
			</div>
		</c:if>
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>邮件、短信 通知模板管理</strong>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;width: 80px;" nowrap="nowrap" >选择模板</td>
				<td style="text-align: left;">
				
				<select id="code" name="code"  onchange="changeTemplate()" data-rule="模板:required;code;" >
				     <option value='0'></option>
				     <c:forEach items="${notifyTemplateList}" var="notiTemp">
						<option value="${notiTemp.code}" <c:if test='${e.code == notiTemp.code}'>selected='selected'</c:if> >${notiTemp.name}</option>
					</c:forEach>
				</select>
			</tr>
			<tr>
				<td style="text-align: right;" nowrap="nowrap">参数解释</td>
				<td style="text-align: left;">
					<div id="remarkDiv"><c:out value="${e.remark}"/></div>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;" nowrap="nowrap">模板内容</td>
				<td style="text-align: left;">
					<textarea id="template" name="template" style="width:100%;height:400px;visibility:hidden;"
					 data-rule="模板内容:required;template;"><c:out value="${e.template}" /></textarea>
			</tr>
			<tr>
				<td colspan="28" style="text-align: center;">
					<button method="${ctx}/manage/notifyTemplate/update.action" class="btn btn-success">
						<i class="icon-ok icon-white"></i> 保存
					</button>
				</td>
			</tr>
		</table>
	</form>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="template"]', {
			allowFileManager : true
		});
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=isEmpty]').click(function(e) {
			alert(editor.isEmpty());
		});
		K('input[name=getText]').click(function(e) {
			alert(editor.text());
		});
		K('input[name=selectedHtml]').click(function(e) {
			alert(editor.selectedHtml());
		});
		K('input[name=setHtml]').click(function(e) {
			editor.html('<h3>Hello KindEditor</h3>');
		});
		K('input[name=setText]').click(function(e) {
			editor.text('<h3>Hello KindEditor</h3>');
		});
		K('input[name=insertHtml]').click(function(e) {
			editor.insertHtml('<strong>插入HTML</strong>');
		});
		K('input[name=appendHtml]').click(function(e) {
			editor.appendHtml('<strong>添加HTML</strong>');
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
	
	//加载选择的模板
	function changeTemplate(){
		var _code = $("#code").val();
		$("#template").html('');
		$("#remarkDiv").html('');
		if(_code==''){
			return;
		}
		var _url = "<%=SystemManager.systemSetting.getManageHttp()%>/manage/notifyTemplate/selectTemplateByCode.action?code="+_code;
		console.log("_url="+_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
			  console.log("changeTemplate.data="+data.template);
			  editor.html(data.template);
			  $("#remarkDiv").html(data.remark);
		  },
		  dataType: "json",
		  error:function(er){
			  console.log("changeTemplate.er="+er);
		  }
		});
	}
	
	//加载选择的模板
	function updateTemplate(){
		var _code = $("#code").val();
		if(editor.isEmpty() || _code==''){
			return;
		}
		var formData=$("form").serialize();
		var _url = "<%=SystemManager.systemSetting.getManageHttp()%>/manage/notifyTemplate/updateTemplate.action";
		console.log("_url="+_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: formData,
		  success: function(data){
			  console.log("updateTemplate.data="+data);
			  if(data=="0"){
				  alert("保存成功！");
			  }else{
				  alert("保存失败！");  
			  }
		  },
		  dataType: "text",
		  error:function(er){
			  console.log("updateTemplate.er="+er);
		  }
		});
	}
</script>
</body>
</html>
