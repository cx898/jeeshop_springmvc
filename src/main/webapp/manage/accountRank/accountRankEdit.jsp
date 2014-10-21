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
<form action="accountRank" namespace="/manage" theme="simple" id="form" >
	<table class="table table-bordered">
		<tr>
			<td colspan="2" style="background-color: #dff0d8;text-align: center;">
				<strong>会员等级编辑</strong>
			</td>
		</tr>
		<tr style="display: none;">
			<td>id</td>
			<td><input type="hidden" name="id" label="id" id="id"  value="${e.id}" /></td>
		</tr>
		<tr>
			<td style="text-align: right;">code</td>
			<td style="text-align: left;">
			<input type="text" name="code" id="code" value="${e.code}" data-rule="code:required;code;length[1~10];" /></td>
		</tr>
		<tr>
			<td style="text-align: right;">等级名称</td>   
			<td style="text-align: left;">
			<input type="text" name="name" id="name" value="${e.name}" data-rule="等级名称:required;name;length[1~10];" /></td>
		</tr>
		<tr>
			<td style="text-align: right;">最小积分</td>
			<td style="text-align: left;">
			<input type="text" name="minScore" id="minScore" value="${e.minScore}" data-rule="最小积分:integer;minScore;length[1~10];" /></td>
		</tr>
		<tr>
			<td style="text-align: right;">最大积分</td>
			<td style="text-align: left;">
			<input type="text" name="maxScore" id="maxScore" value="${e.maxScore}" data-rule="最大积分:integer;maxScore;length[1~10];" />
			</td>
		</tr>
		<tr>
			<td style="text-align: right;">备注</td>
			<td style="text-align: left;">
			<input type="text" name="remark" id="remark" value="${e.remark}"/></td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="2">
				<c:choose>		
			  			<c:when test="${e.id=='' or e.id==null}">
						    <button method="${ctx}/manage/accountRank/insert.action" class="btn btn-success">
								<i class="icon-ok icon-white"></i> 新增
							</button>
						</c:when>
						<c:otherwise>
							<button method="${ctx}/manage/accountRank/update.action" class="btn btn-success">
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
