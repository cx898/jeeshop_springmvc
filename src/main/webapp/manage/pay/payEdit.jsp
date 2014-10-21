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
	<form action="pay" namespace="/manage" theme="simple">
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>支付方式编辑</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" name="id" label="id" value="${e.id}"  /></td>
			</tr>
			<tr>
				<td style="text-align: right;">支付方式</td>
				<td style="text-align: left;">
					<select name="code" >
							<option value='alipay'
								<c:if test='${e.code == "alipay"}'>selected='selected'</c:if>>支付宝</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">状态</td>
				<td style="text-align: left;">
					<select name="status" >
							<option value='y'
								<c:if test='${e.status=="y"}'>selected='selected'</c:if>>启用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">卖家账号</td>
				<td style="text-align: left;">
					<input type="text"  id="seller" name="seller" value="${e.seller}" data-rule="卖家账号:required;seller;length[1~45];"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">合作身份者ID</td>
				<td style="text-align: left;">
					<input type="text"  id="partner" name="partner" value="${e.partner}" data-rule="合作身份者ID:required;partner;length[1~45];"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">商户的私钥</td>
				<td style="text-align: left;">
					<input type="text"  id="key1" name="key1" value="${e.key1}" data-rule="商户的私钥:required;key1;length[1~45];" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">排序</td>
				<td style="text-align: left;">
					<input type="text"  id="order1" name="order1" value="${e.order1}" data-rule="排序:integer;order1;" />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<c:choose>		
			  			<c:when test="${e.id=='' or e.id==null}">
						   <button method="${ctx}/manage/pay/insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
						</c:when>
						<c:otherwise>
						  <button method="${ctx}/manage/pay/update.action" class="btn btn-success">
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
