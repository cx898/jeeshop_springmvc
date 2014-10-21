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
	<form action="gift" namespace="/manage" method="post" theme="simple" id="form" name="form">
		<input type="hidden" name="type" value="" />
		<input type="hidden" value="" id="catalogID"/>
		<table class="table table-bordered">
			<tr>
				<td>赠品名称</td>
				<td><input type="text" class="input-medium search-query" name="giftName" value="${e.giftName}"/></td>
				<td>状态</td>
				<td>
				<select id="status" name="status" cssStyle="width:100px;">
							<option value=''></option>
							<option value='up' <c:if test='${e.status=="up"}'>selected='selected'</c:if>>可用</option>
							<option value='down' <c:if test='${e.status=="down"}'>selected='selected'</c:if>>不可用</option>
				</select>
				</td>
					<!-- 
				<td>时间范围</td>
				<td>
					<input id="d4311" class="Wdate search-query input-small" type="text" name="e.createtime"
					value="<c:out value="e.createtime" />"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4312" class="Wdate search-query input-small" type="text" name="e.createtimeEnd" 
					value="<c:out value="e.createtimeEnd" />"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
					
					<s:textfield class="Wdate input" 
					name="e.createtime" cssStyle="width:80px;"
					onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd'})" />
					~ <s:textfield class="Wdate input" type="text" name="e.createtimeEnd" cssStyle="width:80px;"
					onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd'})" />
				</td>
					 -->
			</tr>
			<tr>
				<td colspan="16">
					<button method="${ctx}/manage/gift/selectList.action" class="btn btn-primary" onclick="selectList(this)">
						<i class="icon-search icon-white"></i> 查询
					</button>
						
<!-- 					<s:a method="toAdd" class="btn btn-success"> -->
<!-- 						<s:param name="type" value="e.type"></s:param> -->
<!-- 						<i class="icon-plus-sign icon-white"></i> 添加 -->
<!-- 					</s:a> -->
										
					<a href="${ctx}/manage/gift/toAdd.action?type=" class="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</a>
						
					<button method="${ctx}/manage/gift/deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
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
				<th width="20px"><input type="checkbox" id="firstCheckbox" /></th>
				<th width="120px">ID</th>
				<th>赠品名称</th>
				<th>赠品价值</th>
				<th>状态</th>
				<th width="60px;">操作</th>
			</tr>
			 <c:forEach items="${pager.list}" var="gift">  
			  <tr>
			    	<td><input type="checkbox" name="ids"
						value="<c:out value="${gift.id}"/>" /></td>
					<td ><c:out value="${gift.id}"/></td>
					<td class="aCss">
					  <a href="${ctx}/manage/gift/toEdit.action?id=${gift.id}" ><c:out value="${gift.giftName}" /></a>
					</td>
					<td>&nbsp;<c:out value="${gift.giftPrice}" /></td>
					<td>&nbsp;
						<c:choose>
						  <c:when test="${gift.status == 'up'}">
						    <img alt="显示" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						  </c:when>
						  <c:when test="${gift.status == 'down'}">
						    <img alt="不显示" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
						  </c:when>
						  <c:otherwise>
						          未知
						  </c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="${ctx}/manage/gift/toEdit.action?id=${gift.id}">编辑</a>
					</td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="17" style="text-align: center;font-size: 12px;"><%@ include
						file="/manage/system/pager.jsp"%></td>
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
