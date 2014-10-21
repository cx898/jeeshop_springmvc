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
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.titleCss {
	background-color: #e6e6e6;
	border: solid 1px #e6e6e6;
	position: relative;
	margin: -1px 0 0 0;
	line-height: 32px;
	text-align: left;
}

.aCss {
	overflow: hidden;
	word-break: keep-all;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 12px;
}

.liCss {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	height: 30px;
	text-align: left;
	margin-left: 10px;
	margin-right: 10px;
}
</style>
</head>

<body>
	<form action="news" namespace="/manage" method="post" theme="simple" id="form" name="form">
		<input type="hidden" name="type" value="${e.type}" />
		<input type="hidden" value="<c:out value="${e.catalogID}"/>" id="catalogID"/>
		<table class="table table-bordered">
			<tr>
				<td>标题</td>
				<td><input type="text" class="input-medium search-query" name="title" value="${e.title}" /></td>
				<c:if test="${e.type  eq 'help'}">
					<td>文章类型</td>
					<td>
						<%
						application.setAttribute("catalogs", SystemManager.catalogsArticle);
						%>
						
						<select onchange="catalogChange(this)" name="catalogID" id="catalogSelect">
							<option></option>
							<c:forEach items="${applicationScope.catalogs}" var="cata">
								<option pid="0" value="<c:out value="${cata.id}" />"
								<c:if test='${e.catalogID==cata.id}'>selected='selected'</c:if>
								><font color='red'><c:out value="${cata.name}"/></font></option>
								<c:forEach items="${cata.children}" var="cata_child">
									<option value="<c:out value="${cata_child.id}" />"
									<c:if test='${e.catalogID==cata_child.id}'>selected='selected'</c:if>
									>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cata_child.name}" /></option>
								</c:forEach>
							</c:forEach>
						</select>
					</td>
				</c:if>
				<td>状态</td>
				<td>
				<select id="status" name="status" style="width:100px;">
						<option value=''></option>
						<option value='y' <c:if test='${e.status=="y"}'>selected='selected'</c:if>>显示</option>
						<option value='n' <c:if test='${e.status=="n"}'>selected='selected'</c:if>>不显示</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="16">
					<button method="${ctx}/manage/news/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
					<a href="${ctx}/manage/news/toAdd.action?type=${e.type}" class="btn btn-success">
					<i class="icon-plus-sign icon-white"></i>添加 </a>
<!-- 					<s:a method="toAdd" class="btn btn-success"> -->
<!-- 						<s:param name="type" value="e.type"></s:param> -->
<!-- 						<i class="icon-plus-sign icon-white"></i> 添加 -->
<!-- 					</s:a> -->
					<button method="${ctx}/manage/news/deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
						<i class="icon-remove-sign icon-white"></i> 删除
					</button>
					<button method="${ctx}/manage/news/updateStatusY.action" class="btn btn-warning" onclick="return submitIDs(this,'确定让选择的记录审核通过?这样选择的记录将会出现在门户上。');">
						<i class="icon-arrow-up icon-white"></i> 显示
					</button>
					<button method="${ctx}/manage/news/updateStatusN.action" class="btn btn-warning" onclick="return submitIDs(this,'执行该操作后,选择的记录将不会出现在门户上。确定要执行?');">
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
				<th width="20px"><input type="checkbox" id="firstCheckbox" /></th>
				<th width="120px">ID</th>
				<th>标题</th>
				<c:if test="${e.type eq 'help' }">
					<th>code</th>
					<th width="130px">显示顺序</th>
				</c:if>
<!-- 				<s:if test="e.type.equals(\"help\")"> -->
<!-- 					<th>code</th> -->
<!-- 					<th width="130px">显示顺序</th> -->
<!-- 				</s:if> -->
				<th width="80px">最后操作时间</th>
				<th width="60px;">显示状态</th>
				<th width="60px;">操作</th>
			</tr>
			<c:forEach items="${pager.list}" var="news">  
			  <tr>
					<td><input type="checkbox" name="ids" value="<c:out value="${news.id}"/>" /></td>
					<td ><c:out value="${news.id}"/></td>
					<td class="aCss">
					  <a href="${ctx}/manage/news/toEdit.action?e.id=${news.id}"><c:out value="${news.title}"/></a>
					</td>
					<c:if test="${news.type eq 'help' }">
						<td nowrap="nowrap">&nbsp;<c:out value="code" /></td>
						<td nowrap="nowrap">&nbsp;<c:out value="order1" /></td>
					</c:if>
					<td>&nbsp;<c:out value="${news.updatetime}" /></td>
					<td>&nbsp;
						<c:choose>
							<c:when test="${news.status == 'y'}">
							   <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
							</c:when>
							<c:otherwise>
							   <img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="${ctx}/manage/news/toEdit.action?id=${news.id}">编辑</a>|
						<c:choose>
							<c:when test="${news.type eq 'help'}">
							   <a target="_blank" href="<%=SystemManager.systemSetting.getWww()%>/help/<c:out value="${news.code}" />.html" >查看</a>
							</c:when>
							<c:otherwise>
							   <a target="_blank" href="<%=SystemManager.systemSetting.getWww()%>/news/<c:out value="${news.id}" />.html" >查看</a>
							</c:otherwise>
						</c:choose>
					</td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="17" style="text-align: center;font-size: 12px;"><%@ include file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
		
		<div class="alert alert-info" style="text-align: left;font-size: 14px;margin: 2px 0px;">
			图标含义：<BR>
			<img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">：显示到门户上
			<img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">：不显示到门户上
		</div>

	</form>
	

<SCRIPT type="text/javascript">
$(function(){
	selectDefaultCatalog();
});
function selectDefaultCatalog(){
	var _catalogID = $("#catalogID").val();
	console.log("_catalogID="+_catalogID);
	if(_catalogID!='' && _catalogID>0){
		$("#catalogSelect").attr("value",_catalogID);
	}
}
</SCRIPT>
</body>
</html>
