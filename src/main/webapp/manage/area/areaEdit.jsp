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
	<form action="area" namespace="/manage" theme="simple">
		<div id="contians_div" >
			<div id="context_div" style="margin-top: 5px;">
				<table id="result_table" class="table table-bordered" style="width: 95%;margin: auto;">
					<tr style="background-color: #dff0d8">
						<td colspan="2" style="background-color: #dff0d8;text-align: center;">
							<strong>区域编辑</strong>
						</td>
					</tr>
					<tr style="display: none;">
						<td>id</td>
						<td><input type="hidden" name="id" label="id"></td>
					</tr>
					<tr>
						<td style="text-align: right;">名称</td>
						<td style="text-align: left;"><input type="hidden" name="name" id="name"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
						<c:choose>
						<c:when test="${e.id=='' or e.id==null}">
						   <input type="submit" value="新增" method="insert" onclick="return onSubmit();" class="btn btn-primary" />
						</c:when>
						<c:otherwise>
						  <input type="submit" value="保存" method="update" onclick="return onSubmit();" class="btn btn-primary"/>
						</c:otherwise>
					</c:choose>
					<input type="submit" value="返回" method="update" class="btn btn-inverse"/>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>
