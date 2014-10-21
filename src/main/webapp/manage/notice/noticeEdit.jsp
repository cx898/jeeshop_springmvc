<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
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
	}
</script>
</head>

<body>
	<s:form action="notice" namespace="/manage" theme="simple">
		<div id="contians_div" >
			<div id="context_div" style="margin-top: 5px;">
				<table id="result_table" class="table table-bordered" style="width: 95%;margin: auto;">
					<tr style="background-color: #dff0d8">
						<td colspan="2" style="background-color: #dff0d8;text-align: center;">
							<strong>公告内容编辑</strong>
						</td>
					</tr>
					<tr style="display: none;">
						<td>id</td>
						<td><s:hidden name="e.id" label="id" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">标题</td>
						<td style="text-align: left;"><s:textfield name="e.title" 
								id="title" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">内容</td>
						<td style="text-align: left;"><s:textarea name="e.content" style="width:100%;height:400px;visibility:hidden;"></s:textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><s:if test="e.id=='' or e.id==null">
								<s:submit method="insert" onclick="return onSubmit();"
										value="新增" class="btn btn-primary"/>
							</s:if> 
							<s:else>
								<s:submit method="update" onclick="return onSubmit();"
									value="保存" class="btn btn-primary"/>
							</s:else>
							<s:submit
								method="back" value="返回" class="btn btn-inverse"/></td>
					</tr>
				</table>
			</div>
		</div>
	</s:form>

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
