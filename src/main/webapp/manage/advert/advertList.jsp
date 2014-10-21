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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.aCss {
	overflow: hidden;
	word-break: keep-all;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 12px;
}
</style>
</head>

<body>
	<form action="advert" namespace="/manage" method="post" theme="simple">
				<table class="table table-bordered">
					<tr>
						<td>广告标题</td>
						<td>
						<input type="text" class="input-medium search-query" name="title" value="${e.title}" />
						</td>
						<td>类型</td>
						<td>
					<select id="style" name="code" class="input-medium">
						<option value='index_top' <c:if test='${e.code=="index_top"}'>selected='selected'</c:if>>index_top</option>
						<option value='index_right_top' <c:if test='${e.code=="index_right_top"}'>selected='selected'</c:if>>index_right_top</option>
						<option value='index_right_bottom' <c:if test='${e.code=="index_right_bottom"}'>selected='selected'</c:if>>index_right_bottom</option>
						<option value='newslist_right_top' <c:if test='${e.code=="newslist_right_top"}'>selected='selected'</c:if>>newslist_right_top</option>
						<option value='newslist_right_bottom' <c:if test='${e.code=="newslist_right_bottom"}'>selected='selected'</c:if>>newslist_right_bottom</option>
						<option value='flashlist_right_top' <c:if test='${e.code=="flashlist_right_top"}'>selected='selected'</c:if>>flashlist_right_top</option>
						<option value='flashlist_right_bottom' <c:if test='${e.code=="flashlist_right_bottom"}'>selected='selected'</c:if>>flashlist_right_bottom</option>
					</select>
						</td>
					</tr>
					<tr>
						<td colspan="16">
							<button method="${ctx}/manage/advert/selectList.action" class="btn btn-primary" onclick="selectList(this)">
								<i class="icon-search icon-white"></i> 查询
							</button>
							<a href="${ctx}/manage/advert/toAdd.action" class="btn btn-success">
								<i class="icon-plus-sign icon-white"></i> 添加
							</a>
							<button method="${ctx}/manage/advert/deletes.action" class="btn btn-danger" 
							onclick="return submitIDs(this,'确定删除选择的记录?');">
								<i class="icon-remove-sign icon-white"></i> 删除
							</button>
							<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
								<%@ include file="/manage/system/pager.jsp"%>
							</div>
						</td>
					</tr>
				</table>

				<table class="table table-bordered table-hover">
					<tr class="success">
						<td width="20px"><input type="checkbox" id="firstCheckbox" /></td>
						<td>广告标题</td>
						<td width="180px">code</td>
						<td width="180px">有效日期范围</td>
						<td width="80px">状态</td>
						<td width="80px">图集优先</td>
						<td width="50px">操作</td>
					</tr>
					
					 <c:forEach items="${pager.list}" var="advert">  
					  <tr>
				  		 <td><input type="checkbox" name="ids" value="<c:out value="${advert.id}"/>" /></td>
						<td class="aCss">
						  <a href="${ctx}/manage/advert/toEdit.action?id=${advert.id}" ><c:out value="${advert.title}"/></a>
						</td>
						<td>&nbsp;<c:out value="${advert.code}" /></td>
						<td>&nbsp;<c:out value="${advert.startdate}" /> ~ <c:out value="${advert.enddate}" /></td>
						<td>&nbsp;
							<c:choose>
								<c:when test="${advert.status == 'y'}">
								   <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
								</c:when>
								<c:otherwise>
								   <img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
								</c:otherwise>
							</c:choose>	
						</td>
						<td>&nbsp;
							<c:choose>
								<c:when test="${advert.useImagesRandom == 'y'}">
								   <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
								</c:when>
								<c:otherwise>
								   <img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
								</c:otherwise>
							</c:choose>
						</td>
						<td ><a href="${ctx}/manage/advert/toEdit.action?id=${advert.id}">编辑</a></td>
					  </tr>
					 </c:forEach>					
					<tr>
						<td colspan="7" style="text-align: center;font-size: 12px;"><%@ include file="/manage/system/pager.jsp"%></td>
					</tr>
				</table>
				<div class="alert alert-info" style="text-align: left;font-size: 14px;margin: 2px 0px;">
					图标含义：<BR>
					<img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">：显示到门户上
					<img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">：不显示到门户上
				</div>
	</form>
</body>
</html>
