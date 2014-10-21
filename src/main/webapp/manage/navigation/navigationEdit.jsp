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
	<form action="navigation" namespace="/manage" theme="simple" name="form" id="form">
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>导航菜单编辑</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" name="id" label="id" value="${e.id}"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">名称</td>
				<td style="text-align: left;">
				<input type="text" name="name" id="name" value="${e.name}" data-rule="名称:required;name;length[1~45];" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">打开方式</td>
				<td style="text-align: left;">_blank
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">位置</td>
				<td style="text-align: left;">bottom
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">顺序</td>
				<td style="text-align: left;">
				<input id="order1" name="order1" value="${e.order1}" data-rule="顺序:integer;order1;length[1~5];" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">地址</td>
				<td style="text-align: left;">
				<input id="http" name="http" value="${e.http}" data-rule="名称:required;http;length[1~70];"   />
				<br>
					(输入的地址不带http://)
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<c:choose>		
			  			<c:when test="${e.id=='' or e.id==null}">
						   <button method="${ctx}/manage/navigation/insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
						</c:when>
						<c:otherwise>
						  <button method="${ctx}/manage/navigation/update.action" class="btn btn-success">
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
