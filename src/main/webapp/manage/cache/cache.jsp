<%@page import="net.jeeshop.core.ManageContainer"%>
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
	<table class="table table-bordered">
		<tr>
			<td colspan="8">
				<a href="cacheImpl.jsp" target="_blank"
				class="btn btn-primary"> <i class="icon-refresh icon-white"></i>
					加载后台缓存
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<a href="frontCacheImpl.jsp" target="_blank"
				class="btn btn-success"><i class="icon-refresh icon-white"></i>
					加载前台缓存
				</a>
			</td>
		</tr>
	</table>

	<table class="table table-bordered">
		<tr>
			<td colspan="8">
				<h4>明细缓存操作</h4>
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<a href="frontCacheImpl.jsp?method=activity" target="_blank"
				class="btn btn-info"><i class="icon-refresh icon-white"></i>
					加载活动+活动商品列表
				</a>
			</td>
			<td>
				<a href="frontCacheImpl.jsp?method=loadIndexImgs" target="_blank"
				class="btn btn-info"><i class="icon-refresh icon-white"></i>
					门户滚动图片
				</a>
			</td>
			<td>
				<a href="frontCacheImpl.jsp?method=loadAdvertList" target="_blank"
				class="btn btn-info"><i class="icon-refresh icon-white"></i>
					广告列表
				</a>
			</td>
			<td>
				<a href="frontCacheImpl.jsp?method=loadNotifyTemplate" target="_blank"
				class="btn btn-info"><i class="icon-refresh icon-white"></i>
					加载邮件模板列表
				</a>
			</td>
			<td>
				<a href="frontCacheImpl.jsp?method=loadProductStock" target="_blank"
				class="btn btn-info"><i class="icon-refresh icon-white"></i>
					加载商品内存库存
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="15">
				<a href="frontCacheImpl.jsp?method=hotquery" target="_blank"
				class="btn btn-info"><i class="icon-refresh icon-white"></i>
					热门查询关键字
				</a>
			</td>
		</tr>
	</table>
</body>
</html>
