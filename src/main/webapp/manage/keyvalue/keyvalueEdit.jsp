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
	<form action="keyvalue" namespace="/manage" theme="simple" id="form" name="form">
			<table class="table table-bordered">
				<tr style="background-color: #dff0d8">
					<td colspan="2" style="background-color: #dff0d8;text-align: center;">
						<strong>键值对编辑</strong>
					</td>
				</tr>
				<tr style="display: none;">
					<td>id</td>
					<td><input type="hidden" name="id" label="id" value="${e.id}" /></td>
				</tr>
				<tr>
					<td style="text-align: right;">键</td>
					<td style="text-align: left;">
					 <input type="text" name="key1" id="key1" value="${e.key1}" data-rule="键:required;key1;length[1~45];" />		
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">值</td>
					<td style="text-align: left;">
					 <input type="text" name="value" id="value" value="${e.value}" data-rule="值:required;value;length[1~45];"  />
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<c:choose>		
			  			<c:when test="${e.id=='' or e.id==null}">
						   <button method="${ctx}/manage/keyvalue/insert.action" class="btn btn-success" >
								<i class="icon-ok icon-white"></i> 新增
							</button>
						</c:when>
						<c:otherwise>
						  <button method="${ctx}/manage/keyvalue/update.action" class="btn btn-success" >
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
