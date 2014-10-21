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
<script type="text/javascript">
	$(function() {
		function c1(f) {
			$(":checkbox").each(function() {
				$(this).attr("checked", f);
			});
		}
		$("#firstCheckbox").click(function() {
			if ($(this).attr("checked")) {
				c1(true);
			} else {
				c1(false);
			}
		});

		$("#spiderBtn").click(function() {
			//$(this).attr({"disabled":"disabled"});
		});

	});
	function deleteSelect() {
		if ($("input:checked").size() == 0) {
			return false;
		}
		return confirm("确定删除选择的记录?");
	}
	function updateInBlackList() {
		if ($("input:checked").size() == 0) {
			return false;
		}
		return confirm("确定将选择的记录拉入新闻黑名单吗?");
	}
</script>
</head>

<body>
	<s:form action="lable" namespace="/manage" method="post" theme="simple">
		<div style="text-align: center; border: 0px solid red; margin: auto;">
			<div
				style="text-align: right; border: 0px solid red; margin: auto; padding: 10px;">
				<table class="table table-bordered">
					<tr>
						<td colspan="6"><s:submit method="selectList" value="查询"
								class="btn btn-primary" /> <s:submit method="toAdd"
								value="添加" class="btn btn-success" /> <s:submit
								method="deletes" onclick="return deleteSelect();" value="删除"
								class="btn btn-danger" /></td>
					</tr>
				</table>
				<table id="result_table" class="table table-bordered">
					<tr style="background-color: #dff0d8">
						<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
						<th style="display: none;">编号</th>
						<th >名称</th>
						<th >顺序</th>
<!-- 						<th >类型</th> -->
<!-- 						<th >数量</th> -->
<!-- 						<th >描述</th> -->
						<th >操作</th>
					</tr>
					<s:iterator value="pager.list">
						<tr>
							<td><input type="checkbox" name="ids"
								value="<s:property value="id"/>" /></td>
							<td style="display: none;">&nbsp;<s:property value="id" /></td>
							<td>&nbsp;<s:property value="name" /></td>
<%-- 							<td>&nbsp;<s:property value="order1" /></td> --%>
<!-- 							<td>&nbsp; -->
<%-- 								<s:if test="type==0"> --%>
<!-- 									<font color='red'>文体</font> -->
<%-- 								</s:if> --%>
<%-- 								<s:elseif test="type==1"> --%>
<!-- 									<font color='blue'>标签</font> -->
<%-- 								</s:elseif> --%>
<!-- 							</td> -->
<!-- 							<td>&nbsp; -->
<%-- 								<s:if test="type==0"> --%>
<%-- 									<font color='red'><s:property value="typeSum" /></font> --%>
<%-- 								</s:if> --%>
<%-- 								<s:elseif test="type==1"> --%>
<%-- 									<font color='blue'><s:property value="lableIDSum" /></font> --%>
<%-- 								</s:elseif> --%>
<!-- 							</td> -->
							<td>&nbsp;<s:property value="desc1" /></td>
							<td><s:a href="lable!toEdit.action?e.id=%{id}">编辑</s:a></td>
						</tr>
					</s:iterator>

					<tr>
						<td colspan="7" style="text-align: center;"><%@ include
								file="/manage/system/pager.jsp"%></td>
					</tr>
				</table>

			</div>
		</div>
	</s:form>
</body>
</html>
