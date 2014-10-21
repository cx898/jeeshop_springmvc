<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
.pageLink {
	border: 1px solid #dddddd;
	padding: 4px 12px;
	text-decoration: none;
}

.selectPageLink {
	border: 1px solid #0088cc;
	padding: 4px 12px;
	color: #0088cc;
	background-color: #dddddd;
	text-decoration: none;
}
</style>
</head>

<body>
	<!-- 分页标签 -->
	<div style="text-align: right; border: 0;padding: 4px 12px;" class="pageDiv">
		<pg:pager url="${pager.pagerUrl}" items="${pager.total}"
			export="currentPageNumber=pageNumber"
			maxPageItems="${pager.pageSize}" maxIndexPages="10" isOffset="true">
					
					总共：${pager.total}条,共:${pager.pagerSize}页
					<pg:param name="cc" />
			<pg:first>
				<a href="${pageUrl}" class="pageLink">首页</a>
			</pg:first>
			<pg:prev>
				<a href="${pageUrl}" class="pageLink">上一页</a>
			</pg:prev>
			<pg:pages>
				<c:choose>
					<c:when test="${currentPageNumber==pageNumber}">
						<span class="selectPageLink">${pageNumber}</span>
					</c:when>
					<c:otherwise>
						<a href="${pageUrl}" class="pageLink">${pageNumber}</a>
					</c:otherwise>
				</c:choose>
			</pg:pages>
			<pg:next>
				<a href="${pageUrl}" class="pageLink">下一页</a>
			</pg:next>
			<pg:last>
				<a href="${pageUrl}" class="pageLink">尾页</a>
			</pg:last>
		</pg:pager>
	</div>
</body>
</html>
