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
	<form action="comment" namespace="/manage" method="post" theme="simple">
				<table class="table table-bordered">
					<tr>
						<td style="text-align: right;">商品编号</td>
						<td style="text-align: left;">
							<input type="text" name="productID" value="${e.productID}" class="input-medium" />
						</td>
						
						<td style="text-align: right;">会员账号</td>
						<td style="text-align: left;">
							<input type="text" name="account" value="${e.account}" class="input-medium" />
						</td>
						
						<td style="text-align: right;">订单编号</td>
						<td style="text-align: left;">
						    <input type="text" name="orderID" value="${e.orderID}" class="input-medium" />
						</td>
						
						<td style="text-align: right;">是否显示</td>
						<td style="text-align: left;">
							<select id="status" name="status" class="input-medium">
								<option value=''></option>
								<option value='y'
									<c:if test='${e.status=="y"}'>selected='selected'</c:if>>是</option>
								<option value='n'
									<c:if test='${e.status=="n"}'>selected='selected'</c:if>>否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="16">
							<button method="${ctx}/manage/comment/selectList.action" class="btn btn-primary" onclick="selectList(this)">
								<i class="icon-search icon-white"></i> 查询
							</button>
							<button method="${ctx}/manage/comment/updateStatusY.action" class="btn btn-warning" onclick="return submitIDs(this,'确定显示指定的记录吗？');">
								<i class="icon-arrow-up icon-white"></i> 显示
							</button>
							<button method="${ctx}/manage/comment/updateStatusN.action" class="btn btn-warning" onclick="return submitIDs(this,'确定不显示指定的记录吗？');">
								<i class="icon-arrow-down icon-white"></i> 不显示
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
						<th style="display: none;">编号</th>
						<th nowrap="nowrap">商品编号</th>
						<th nowrap="nowrap">会员账号</th>
						<th nowrap="nowrap">订单编号</th>
						<th>评论内容</th>
						<th nowrap="nowrap">评论日期</th>
						<th nowrap="nowrap">评论星级</th>
						<th nowrap="nowrap">是否显示</th>
						<th nowrap="nowrap">操作</th>
					</tr>
					<c:forEach items="${pager.list}" var="comment">  
					  <tr>
				   		<td><input type="checkbox" name="ids" value="<c:out value="${comment.id}"/>" /></td>
						<td style="display: none;">&nbsp;<c:out value="${comment.id}"/></td>
						<td>
							<a target="_blank" href="<%=SystemManager.systemSetting.getWww()%>/product/<c:out value="${comment.productID}"/>.html"><c:out value="${comment.productID}"/></a>
						</td>
						<td>
							<a target="_blank" href="${ctx}/manage/account/show.action?account=${comment.account}"><c:out value="${comment.account}"/></a>
						</td>
						<td>&nbsp;
							<a target="_blank" href="${ctx}/manage/order/toEdit.action?type=show&id=<c:out value="${comment.orderID}" />"><c:out value="${comment.orderID}" /></a>
						</td>
						<td width="500px">&nbsp;<c:out value="${comment.content}" /><br>
							<c:if test="${comment.reply !=null and comment.reply != '' }">
							  <span style="color:#f50">【已回复】</span>：<c:out value="${comment.reply}" escapeXml="false"/>
							</c:if>
						</td>
						<td nowrap="nowrap">&nbsp;<c:out value="${comment.createdate}" /></td>
						<td>&nbsp;<c:out value="${comment.star}" /></td>
						<td>&nbsp;
							<c:choose>
								<c:when test="${comment.status == 'y'}">
								    <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
								</c:when>
								<c:otherwise>
								  	<img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
								</c:otherwise>
							</c:choose>
						</td>
						<td nowrap="nowrap">
							<c:choose>
								<c:when test="${comment.reply==null}">
								    <a href="${ctx}/manage/comment/toEdit.action?id=${comment.id}">回复</a>
								</c:when>
								<c:otherwise>
								  	<a href="${ctx}/manage/comment/toEdit.action?id=${comment.id}&update=y">修改回复</a>
								</c:otherwise>
							</c:choose>
						</td>
					  </tr>
					 </c:forEach>
					<tr>
						<td colspan="17" style="text-align: center;"><%@ include file="/manage/system/pager.jsp"%></td>
					</tr>
				</table>
	</form>
</body>
</html>
