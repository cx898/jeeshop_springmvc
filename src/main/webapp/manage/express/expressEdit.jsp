<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
</head>

<body>
<form action="express" namespace="/manage" theme="simple" id="form">

	<table class="table table-bordered">
		<tr style="display: none;">
			<td>id</td>
			<td><input type="hidden" name="id" label="id" id="id" value='<c:out value="${e.id}" />' /></td>
		</tr>
		<tr style="background-color: #dff0d8">
			<td colspan="2" style="background-color: #dff0d8;text-align: center;">
				<strong>配送方式编辑</strong>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">编码</td>
			<td style="text-align: left;">
			<input type="text" name="code" id="code" data-rule="编码:required;code;length[1~10];" value='<c:out value="${e.code}" />'/>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">名称</td>   
			<td style="text-align: left;">
			<input type="text" name="name" id="name" data-rule="名称:required;name;length[1~45];" value='<c:out value="${e.name}" />'/>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">费用</td>   
			<td style="text-align: left;">
			<input type="text" name="fee" id="fee" data-rule="费用:required;integer;fee;length[1~5];" value='<c:out value="${e.fee}" />'/>
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">顺序</td>   
			<td style="text-align: left;">
			<input type="text" name="order1" id="order1" data-rule="顺序:required;integer;order1;length[1~5];" 
			value='<c:out value="${e.order1}" />'/>
			</td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="2">
					<c:choose>
						<c:when test="${e.id=='' or e.id==null}">
						   <button method="${ctx}/manage/express/insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						   </button>
						</c:when>
						<c:otherwise>
						   <button method="${ctx}/manage/express/update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						   </button>
						</c:otherwise>
					</c:choose>
			</td>
		</tr>
	</table>
</form>		
</body>
</html>
