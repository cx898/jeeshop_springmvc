<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
</head>

<body>
	<form action="systemlog" namespace="/manage" theme="simple">
				<table class="table table-bordered">
					<tr style="background-color: #dff0d8">
						<td colspan="2" style="background-color: #dff0d8;text-align: center;">
							<strong>系统日志编辑</strong>
						</td>
					</tr>
					<tr style="display: none;">
						<td>id</td>
						<td><input type="hidden" name="id" label="id" value="${e.id}" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">标题</td>
						<td style="text-align: left;"> <input type="text" name="title" id="title" value="${e.title}" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">类型</td>
						<td style="text-align: left;">
						<select id="status" name="status" >
							<option value='0'>--全部--</option>
							<option value='1'
								<c:if test='${e.type=="1"}'>selected='selected'</c:if>>登陆日志</option>
							<option value='2'
								<c:if test='${e.type=="2"}'>selected='selected'</c:if>>版本日志</option>
						</select>
					
								</td>
					</tr>
					<tr>
						<td style="text-align: right;">内容</td>
						<td style="text-align: left;">
						<input type="text" style="width:100%;height:250px;visibility:hidden;" name="content" 
							value = "${e.content}"/></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
						
						
						<c:when test="${e.id=='' or e.id==null}">
						   <input type="submit" value="新增" method="insert" onclick="return onSubmit();" class="btn btn-primary" />
						</c:when>
						<c:otherwise>
						  <input type="submit" value="保存" method="update" onclick="return onSubmit();" class="btn btn-primary"/>
						</c:otherwise>	
						<input type="submit" value="返回" method="back" class="btn btn-inverse"/>
					</tr>
				</table>
	</form>

<script type="text/javascript">
	$(function() {
		$("#title").focus();
	});

	function onSubmit() {
		if ($.trim($("#title").val()) == "") {
			alert("标题不能为空!");
			$("#title").focus();
			return false;
		}
		//if (isEmpty()) == "") {
			//alert("内容不能为空!");
			//$("#content").focus();
			//return false;
		//}
		if ($.trim($("#type").val()) == "0") {
			alert("请选择类型!");
			$("#title").focus();
			return false;
		}
	}
</script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="e.content"]', {
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
</script>
</body>
</html>
