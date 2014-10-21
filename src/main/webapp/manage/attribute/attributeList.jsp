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
	<form action="attribute" namespace="/manage" method="post" theme="simple">
				<input type="hidden" name="pid" value="${e.pid}" />
				<table class="table table-bordered">
					<tr>
						<td style="text-align: right;">
							商品分类
						</td>
						<td>
							<input type="hidden" id="catalogID2" value="<c:out value="${e.catalogID}"/>" />
							<%
							application.setAttribute("catalogs", SystemManager.catalogs);
							%>
							
							<select onchange="catalogChange(this)" name="catalogID" id="catalogSelect">
								<option value="0"></option>
								<c:forEach items="${applicationScope.catalogs}" var="cata">
									<option pid="0" value="<c:out value="${cata.id}" />" <c:if test="${cata.id eq e.catalogID}">selected="selected"</c:if> >
									<font color='red'><c:out value="${cata.name}"/></font></option>
									<c:forEach items="${cata.children}" var="cata_child">
										<option value="<c:out value="${cata_child.id}" />"
										<c:if test='${cata_child.id eq e.catalogID}'>selected='selected'</c:if>
										>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cata_child.name}" /></option>
									</c:forEach>
								</c:forEach>
							</select>
							(请选择子目录查询。)
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button method="${ctx}/manage/attribute/selectList.action" class="btn btn-primary" onclick="selectList(this)">
								<i class="icon-search icon-white"></i> 查询
							</button>
							
							
							<a href="${ctx}/manage/attribute/toAdd.action?pid=${e.pid}" class="btn btn-success" >
									   <i class="icon-plus-sign icon-white"></i> 添加 </a>
							
							<button method="${ctx}/manage/attribute/deletes.action" class="btn btn-danger" 
							onclick="return submitIDs(this,'确定删除选择的记录?');">
								<i class="icon-remove-sign icon-white"></i> 删除
							</button>
							
						<c:choose>
							<c:when test="${e.pid == 0 }">
							   <span class="badge badge-important">商品属性列表</span>
							</c:when>
							<c:otherwise>
							   <span class="badge badge-info">商品参数列表</span>
							</c:otherwise>
						</c:choose>
							<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;"> 
							<%@ include file="/manage/system/pager.jsp"%>
							</div>		
						</td>
					</tr>
				</table>
				
				<table class="table table-bordered  table-hover">
					<tr style="background-color: #dff0d8">
						<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
						<th style="display: none;">编号</th>
						<th nowrap="nowrap">名称</th>
						<th >子项</th>
						<th nowrap="nowrap">所属类别</th>
						<th nowrap="nowrap">顺序</th>
						<th nowrap="nowrap">操作</th>
					</tr>
					
					<c:forEach items="${pager.list}" var="attr">  
					  <tr>
				   		<td><input type="checkbox" name="ids" value="<c:out value="${attr.id}"/>" /></td>
						<td style="display: none;">&nbsp;<c:out value="${attr.id}" /></td>
						<td nowrap="nowrap">&nbsp;<c:out value="${attr.name}" /></td>
						<td>&nbsp;<c:out value="${attr.nameBuff}" /></td>
						<td nowrap="nowrap">&nbsp;<c:out value="${attr.catalogName}" /></td>
						<td nowrap="nowrap">&nbsp;<c:out value="${attr.order1}" /></td>
						<td nowrap="nowrap"><a href="${ctx}/manage/attribute/toEdit.action?id=${attr.id}">编辑</a></td>
					  </tr>
					 </c:forEach>
					<tr>
						<td colspan="7" style="text-align: center;"><%@ include
								file="/manage/system/pager.jsp"%></td>
					</tr>
				</table>

	</form>
	
<script type="text/javascript">
	$(function() {
		selectDefaultCatalog();
	});
	
	function selectDefaultCatalog(){
		var _catalogID = $("#catalogID2").val();
		if(_catalogID!='' && _catalogID>0){
			$("#catalogSelect").attr("value",_catalogID);
		}
	}
</script>
</body>
</html>
