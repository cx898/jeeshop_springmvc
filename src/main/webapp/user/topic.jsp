<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js">
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<style type="text/css">
.centerImageCss{
	width: 560px;
	height: 180px;
}
</style>
</head>

<body>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container" style="margin-top: 0px;padding-top: 0px;">
		<div class="row">
			<div class="col-xs-3" style="min-height: 300px;border: 1px solid red;">
				<%@ include file="userLeft.jsp"%>
			</div>
			
			<div class="col-xs-9" style="min-height: 500px;border: 1px solid red;">
				
				<table class="table table-bordered table-hover" style="margin-bottom: 10px;">
					<tr style="background-color: #dff0d8">
						<th width="20px" style="display: none;"><input type="checkbox" id="firstCheckbox" /></th>
						<th style="width: 200px;text-align: center;">标题</th>
						<th width="30px" style="text-align: center;">回复</th>
						<th width="50px" style="text-align: center;">作者</th>
						<th width="50px" style="text-align: center;">阅读</th>
						<th width="50px" style="text-align: center;">最后发表</th>
					</tr>
					<s:iterator value="pager.list" status="i" var="item">
						<tr>
							<td style="display: none;"><s:property value="id"/></td>
							<td style="text-align: left;">
								<a href="<%=request.getContextPath() %>/topic/<s:property value="id" />.html">
									<s:property value="title"/>
								</a>
							</td>
							<td style="text-align: center;"><s:property value="replyCount"/></td>
							<td style="text-align: center;"><s:property value="account"/></td>
							<td style="text-align: center;"><s:property value="readerCount"/></td>
							<td style="text-align: center;"><s:property value="createtime"/></td>
						</tr>
					</s:iterator>
				</table>
				
			</div>
		</div>
	</div>
	
<%@ include file="/foot.jsp"%>
<script type="text/javascript">
$(function() {
});
</script>
</body>
</html>
