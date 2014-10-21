<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
</head>

<body>
	<form action="activity" namespace="/manage" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td>活动ID</td>
				<td><input type="text" class="input-small search-query" name="id" value="${e.id}"/></td>
<!-- 				<td>商品ID</td> -->
<%-- 				<td><s:textfield class="input-small search-query" name="e.id"/></td> --%>
				<td style="text-align: right;">活动类型</td>
				<td style="text-align: left;">
					<select id="activityType" name="activityType" class="input-small">
							<option value=''></option>
							<option value='c' <c:if test='${e.activityType=="c"}'>selected='selected'</c:if>>促销活动</option>
							<option value='j' <c:if test='${e.activityType=="j"}'>selected='selected'</c:if>>积分兑换</option>
							<option value='t' <c:if test='${e.activityType=="t"}'>selected='selected'</c:if>>团购活动</option>
					</select>
				</td>
				<td style="text-align: right;">优惠方式</td>
				<td style="text-align: left;">
					<select id="discountType" name="discountType" class="input-small">
							<option value=''></option>
							<option value='r' <c:if test='${e.discountType=="r"}'>selected='selected'</c:if>>减免</option>
							<option value='d' <c:if test='${e.discountType=="d"}'>selected='selected'</c:if>>折扣</option>
							<option value='s' <c:if test='${e.discountType=="s"}'>selected='selected'</c:if>>双倍积分</option>
					</select>
				</td>
				<td>状态</td>
				<td>
				<select id="status" name="status" cssStyle="width:100px;">
						<option value=''></option>
						<option value='y' <c:if test='${e.status=="y"}'>selected='selected'</c:if>>显示</option>
						<option value='n' <c:if test='${e.status=="n"}'>selected='selected'</c:if>>不显示</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="18">
					<button method="${ctx}/manage/activity/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					<a href="${ctx}/manage/activity/toAdd.action" class="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</a>
					<button method="${ctx}/manage/activity/deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
					</button>
					
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">活动ID</th>
				<th>活动名称</th>
				<th style="width: 80px;">活动类型</th>
				<th style="width: 80px;">优惠方式</th>
				<th>活动明细</th>
				<th style="width: 50px;">状态</th>
				<th style="width: 50px;">操作</th>
			</tr>
			
			
			<c:forEach items="${pager.list}" var="activity">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<c:out value="${activity.id}"/>" /></td>
					<td nowrap="nowrap">&nbsp;<c:out value="${activity.id}" /></td>
					<td nowrap="nowrap">&nbsp;<c:out value="${activity.name}" /></td>
					<td nowrap="nowrap">&nbsp;
					    <c:choose>
					      <c:when test="${activity.activityType =='c' }">
					      	<span class="badge badge-info">促销活动</span>
					      </c:when>
					      <c:when test="${activity.activityType =='j' }">
					        <span class="badge badge-success">积分兑换</span>
					      </c:when>
					      <c:when test="${activity.activityType =='t' }">
					        <span class="badge">团购活动</span>
					      </c:when>
					      <c:otherwise>异常</c:otherwise>
					    </c:choose>
					</td>
					<td nowrap="nowrap">&nbsp;
						 <c:choose>
					      <c:when test="${activity.activityType =='c' }">
					      	<span class="badge badge-info">促销活动</span>
					      </c:when>
					      <c:when test="${activity.activityType =='j' }">
					        <span class="badge badge-success">积分兑换</span>
					      </c:when>
					      <c:when test="${activity.activityType =='t' }">
					        <span class="badge">团购活动</span>
					      </c:when>
					      <c:otherwise>异常</c:otherwise>
					    </c:choose>
						
						<c:if test="${activity.activityType =='c' }">
							<c:choose>
						      <c:when test="${activity.discountType =='r' }">
						      	<span class="badge badge-info">减免</span>
						      </c:when>
						      <c:when test="${activity.discountType =='d' }">
						        <span class="badge badge-success">折扣</span>
						      </c:when>
						      <c:when test="${activity.discountType =='s' }">
						        <span class="badge">双倍积分</span>
						      </c:when>
						      <c:otherwise>异常</c:otherwise>
						    </c:choose>
						</c:if>
					</td>
					<td nowrap="nowrap">
						活动时间：<c:out value="${activity.startDate}" /> ~ <c:out value="${activity.endDate}" />
						<c:if test="${activity.expire}">
							<span class="label label-danger" style="background-color:Red;">活动已到期</span>
						</c:if>
						<br>
						商品ID：<c:out value="${activity.productID}" /><br>
						<c:if test="${activity.exchangeScore!=0}">
							兑换积分：<c:out value="exchangeScore" /><br>
						</c:if>
						
						<c:if test="${activity.activityType=='t' }">
							最低团购人数：<c:out value="${activity.minGroupCount}" /></br>
							团购价：<c:out value="${activity.tuanPrice}" /></br>
						</c:if>
					</td>
					<td>&nbsp;
						<c:choose>
						   <c:when test="${activity.status=='y'}">
						     <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						   </c:when>
						   <c:otherwise>
						     <img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
						   </c:otherwise>
						</c:choose>
					</td>
					<td nowrap="nowrap">
						<a href="${ctx}/manage/activity/toEdit.action?id=${activity.id}">编辑</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="16" style="text-align: center;"><%@ include
						file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function deleteSelect() {
		if ($("input:checked").size() == 0) {
			return false;
		}
		return confirm("确定删除选择的记录?");
	}
</script>
</body>
</html>
