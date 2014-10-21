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
<script type="text/javascript">
	$(function() {
		
		$("input[type='radio']").click(function(){
			console.log($(this).attr("_id"));
			
			if(!confirm("确定设置该选项为系统默认的评论插件吗?")){
				return ;
			}
			var _url = ${ctx}+"/manage/commentType/updateDefaultCommentType.action?e.id="+$(this).attr("_id");
			alert(_url);
			$.ajax({
			  type: 'POST',
			  url: _url,
			  data: {},
			  success: function(data){
				    alert("设置默认评论插件成功！");
				    
				    document.form1.submit();
			  },
			  dataType: "text",
			  error:function(){
				  alert("设置默认评论插件失败！");
			  }
			});
		});
	});
</script>
</head>

<body>
	<form action="${ctx}/manage/commentType/selectList.action?init=y" namespace="/manage" method="post" theme="simple" name="form1">
		<table class="table table-bordered">
			<tr>
				<td colspan="6">
					<a href="${ctx}/manage/commentType/selectList.action" class="btn btn-primary">
						<i class="icon-search icon-white"></i> 查询
					</a>
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
				<th >名称</th>
				<th >代码</th>
				<th >状态</th>
			</tr>
			<c:forEach items="${pager.list}" var="commentType">  
			  <tr>
			    <td><input type="checkbox" name="ids" value="<c:out value='${commentType.id}' />" /></td>
				<td style="display: none;">&nbsp;<c:out value="${commentType.id}" /></td>
				<td>&nbsp;<c:out value="${commentType.name}" /></td>
				<td>&nbsp;<c:out value="${commentType.code}" /></td>
				<td>&nbsp;
				<c:choose>
					<c:when test="${commentType.status == 'y'}">
					   <input type="radio" name="status" checked="checked" _id="<c:out value='${commentType.id}' />"/>
					   <img src="<%=request.getContextPath() %>/resource/images/action_check.gif">
					</c:when>
					<c:otherwise>
					   <input type="radio" name="status" _id="<c:out value='${commentType.id}' />"/>
					   <img src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
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
