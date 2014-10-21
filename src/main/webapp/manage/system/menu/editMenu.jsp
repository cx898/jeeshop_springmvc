<%@ page contentType="text/html; charset=UTF-8" %>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
</head>

<body>
<div style="text-align: center; border: 0px solid #999;margin: auto;">
	<div style="text-align: center; border: 0px solid #999;
		margin: auto;margin-top: 150px;">
		<form action="menu" namespace="/manage" theme="simple">
				<table>
					<tr style="display: none;">
						<th>id</th>
						<td><input type="hidden" name="rid" value="${e.rid}" /></td>
					</tr>
					<tr style="display: none;">
						<th>pid</th>
						<td><input type="hidden" name="pid" value="${e.pid}"/></td>
					</tr>
					<tr>
						<th>url</th>
						<td>
							<input type="text" name="url" />
						</td>
					</tr>
					<tr>
						<th>name</th>
						<td>
						    <input type="text" name="name" />
						</td>
					</tr>
					<tr><td></td>
						<td>
						    <input type="submit" method="save" value="save"> 
						    <input type="back" method="back" value="back"> 
						</td>
					</tr>
				</table>
		</form>
	</div>
</div>
</body>
</html>
