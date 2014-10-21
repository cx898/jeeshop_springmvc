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
		return true;
	}
</script>
</head>

<body>
	<form action="commentType" namespace="/manage" theme="simple" onsubmit="return onSubmit();">
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>评论插件编辑</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" name="id" label="id" value="${e.id}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;">选择插件</td>
				<td style="text-align: left;">
					<select name="code">
							<option value='default'
								<c:if test='${e.code=="default"}'>selected='selected'</c:if>>系统默认</option>
							<option value='duoshuo'
								<c:if test='${e.code=="duoshuo"}'>selected='selected'</c:if>>多说评论插件</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<c:choose>		
		  			<c:when test="${e.id=='' or e.id==null}">
					   <input type="submit" value="新增" method="insert" class="btn btn-primary" />
					</c:when>
					<c:otherwise>
					  <input type="submit" value="保存" method="update"  class="btn btn-primary"/>
					</c:otherwise>	
            	</c:choose>
				<input type="submit" method="back" value="返回" class="btn btn-inverse"/></td>
			</tr>
		</table>
	</form>
</body>
</html>
