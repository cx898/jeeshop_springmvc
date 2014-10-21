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
		if ($.trim($("#name").val()) == "") {
			alert("名称不能为空!");
			$("#title").focus();
			return false;
		}
	}
</script>
</head>

<body>
	<s:form action="lable" namespace="/manage" theme="simple">
		<div id="contians_div" >
			<div id="context_div" style="margin-top: 5px;">
				<table id="result_table" class="table table-bordered" style="width: 95%;margin: auto;">
					<tr style="background-color: #dff0d8">
						<td colspan="2" style="background-color: #dff0d8;text-align: center;">
							<strong> 内 容 类 型 编 辑 </strong>
						</td>
					</tr>
					<tr style="display: none;">
						<td>id</td>
						<td><s:hidden name="e.id" label="id" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">名称</td>
						<td style="text-align: left;"><s:textfield name="e.name" 
								id="name" /></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td style="text-align: right;">顺序</td> -->
<%-- 						<td style="text-align: left;"><s:textfield name="e.order1"  --%>
<%-- 								id="order1" /></td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td style="text-align: right;">描述</td> -->
<%-- 						<td style="text-align: left;"><s:textfield name="e.desc1"  --%>
<%-- 								id="desc1" /></td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td style="text-align: right;">类型</td> -->
<!-- 						<td style="text-align: left;"> -->
<%-- 							<s:select list="#{1:'内容标签'}" id="type" name="e.type" --%>
<%-- 								listKey="key" listValue="value"  /> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
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
</body>
</html>
