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
<form action="${ctx}/manage/account/updateFreeze.action" namespace="/manage" theme="simple" id="form">
	<table class="table table-bordered">
			<tr>
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>冻结会员登陆账号</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" name="id" label="id" id="id"  value="${e.id}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;">昵称</td>
				<td style="text-align: left;"><c:out value="${e.nickname }"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">账号</td>   
				<td style="text-align: left;"><c:out value="${e.account}"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">是否冻结</td>
				<td style="text-align: left;">
				<select id="freeze" name="freeze" >
							<option value='y' <c:if test='${e.freeze=="y"}'>selected='selected'</c:if>>是</option>
							<option value='n' <c:if test='${e.freeze=="n"}'>selected='selected'</c:if>>否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="200px" style="text-align: right;">
					冻结时间范围
				</td>
				<td>
					<input id="d4311" class="Wdate search-query input-small" type="text" name="freezeStartdate"
					value="${e.freezeStartdate}"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4312" class="Wdate search-query input-small" type="text" name="freezeEnddate" 
					value="${e.freezeEnddate}"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
					
					(注：不填写时间范围将永久冻结此账号！)
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button method="${ctx}/manage/account/updateFreeze.action" class="btn btn-success" onclick="submitNotValid2222(this)">
						<i class="icon-ok icon-white"></i> 保存
					</button>
				</td>
			</tr>
		</table>
</form>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</body>
</html>
