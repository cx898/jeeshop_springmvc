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

<body style="font-size: 12px;">
	<form action="systemlog" namespace="/manage" method="post" theme="simple">
				<table class="table table-bordered">
					<tr>
						<td style="text-align: right;">是否异登陆</td>
						<td style="text-align: left;">
							<select id="diffAreaLogin" name="diffAreaLogin" class="input-small" >
							<option value=''>--全部--</option>
							<option value='y'
								<c:if test='${e.diffAreaLogin=="y"}'>selected='selected'</c:if>>是</option>
							<option value='n'
								<c:if test='${e.diffAreaLogin=="n"}'>selected='selected'</c:if>>否</option>
					</select>
							
						</td>
						<td>登陆账号</td>
						<td><input type="text" class="input-medium search-query" name="account" />
						</td>
					</tr>
				</table>
				
				<table class="table table-bordered">
					<tr>
						<td colspan="16">
							
							<button method="${ctx}/manage/systemlog/selectList.action" class="btn btn-primary" onclick="selectList(this)">
								<i class="icon-search icon-white"></i> 查询
							</button>
							
							<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
								<%@ include file="/manage/system/pager.jsp"%>
							</div>
						</td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr style="background-color: #dff0d8">
						<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
						<th style="display: none;">编号</th>
						<th >标题</th>
						<th >账号</th>
						<th >登陆时间</th>
						<th >登陆IP</th>
						<th >登陆位置</th>
						<th >是否异地登陆</th>
					</tr>
					 <c:forEach items="${pager.list}" var="systemlog">  
					  <tr>
					   <td><input type="checkbox" name="ids" value="<c:out value='${systemlog.id}'/>" /></td>
					   <td style="display: none;">&nbsp;<c:out value="${systemlog.id}" /></td>
					   <td>&nbsp;<c:out value="${systemlog.title}" /></td>
					   <td>&nbsp;<c:out value="${systemlog.account}" /></td>
					   <td>&nbsp;<c:out value="${systemlog.logintime}" /></td>
					   <td>&nbsp;<c:out value="${systemlog.loginIP}" /></td>
					   <td>&nbsp;<c:out value="${systemlog.loginArea}" /></td>
					   <td>&nbsp;
					      <c:if test="${systemlog.diffAreaLogin == y }">是</c:if>
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
