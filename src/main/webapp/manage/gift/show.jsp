<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
.btnCCC{
	background-image: url("../img/glyphicons-halflings-white.png");
	background-position: -288px 0;
}
</style>
</head>

<body>
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>商品赠品信息 </strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" name="id" value="${e.id}" label="id" /></td>
			</tr>
			<tr>
				<td style="text-align: right;width: 80px;">赠品名称</td>
				<td style="text-align: left;">
					<c:out value="${e.giftName}" escapeXml="false"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;width: 80px;">赠品价值</td>
				<td style="text-align: left;">
					<c:out value="${e.giftPrice}" escapeXml="false"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;width: 80px;">状态</td>
				<td style="text-align: left;">
				
				    <c:choose>
				      <c:when test="${e.status =='up'}">
				        	已上架
				      </c:when>
				      <c:when test="${e.status =='down'}">
				      		已下架
				      </c:when>
				    </c:choose>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">主图</td>   
				<td style="text-align: left;" colspan="3">
					<s:if test="${ e.picture!=null }">
						<a target="_blank" href="<%=SystemManager.systemSetting.getImageRootPath()%><c:out value="${e.picture}" />">
							<img src="<%=SystemManager.systemSetting.getImageRootPath()%><c:out value="${e.picture}" />">
						</a>
					</s:if>
				</td>
			</tr>
			
			<s:if test="${e.createAccount!=null}">
				<tr>
					<td style="text-align: right;">添加</td>
					<td style="text-align: left;">
						添加人：<c:out value="${e.createAccount}"/><br>
						添加时间：<c:out value="${e.createtime}"/><br>
					</td>
				</tr>
			</s:if>
			
			<s:if test="${e.updateAccount!=null}">
				<tr>
					<td style="text-align: right;">最后修改</td>
					<td style="text-align: left;">
						修改人：<c:out value="${e.updateAccount}"/><br>
						修改时间：<c:out value="${e.updatetime}"/><br>
					</td>
				</tr>
			</s:if>
		</table>
</body>
</html>
