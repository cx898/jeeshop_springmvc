<%@page import="net.jeeshop.services.manage.order.bean.OrdersReport"%>
<%@page import="net.jeeshop.services.front.systemSetting.bean.SystemSetting"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css"  type="text/css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/jquery-1.5.1.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<style>
	a:link {text-decoration:underline;}
a:visited {text-decoration:underline;}
a:hover {text-decoration:underline;}
a:active {text-decoration:underline;}

.Afont22{
font-weight: 700;font-size: 16px;color: #f50;
}
</style>
<%
SystemSetting ssInfo = SystemManager.systemSetting;
if(ssInfo==null){
	ssInfo = new SystemSetting();
}
%>
<script>
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
});
</script>

</head>

<body
	style="background-color: #E6EAE9; text-align: center; margin: auto;">
	<div class="container">
	
		
		<div class="row" style="height: 30px;">
		</div>
		
		<div class="row">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1" style="font-size: 14px;">十万火急</a>
<!-- 						<a href="#"> -->
<%-- 							<img alt="" src="<%=SystemManager.systemSetting.getManageHttp()%>/resource/images/refresh.png"> --%>
<!-- 						</a> -->
					</li>
					<li><a href="#tabs-2" style="font-size: 14px;">基本设置</a></li>
					<li><a href="#tabs-3" style="font-size: 14px;">图片设置</a></li>
<%-- 					<li><a href="<%=request.getContextPath() %>/manage/systemlog!systemlogListAndDetail.action?init=y&type=2">更新日志</a></li> --%>
<!-- 					<li><a href="#tabs-4">新增订单</a></li> -->
<!-- 					<li><a href="#tabs-5">最近销售状况</a></li> -->
<%-- 					<li><a href="#tabs-6"><strong>系统使用帮助</strong></a></li> --%>
				</ul>
				<div id="tabs-1">
					<div class="alert alert-danger" style="margin-bottom: 2px;text-align: left;">
						<span class="badge badge-important">重要</span>&nbsp;<strong>主公，订单汇总如下：</strong>
					</div>
					<%OrdersReport orderReport = SystemManager.ordersReport; %>
					<table class="table table-bordered">
						<tr>
							<td>未付款订单数：<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&paystatus=n&status=init"><%=orderReport.getNotPayCount()%></a></td>
							<td>已付款，但未审核订单数：<a class="Afont22" style="color: #f50;" href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&paystatus=y&status=init"><%=orderReport.getPayButNotPassCount()%></a></td>
						</tr>
						<tr>
							<td>已取消订单数：<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&status=cancel"><%=orderReport.getCancelCount() %></a></td>
							<td>等待发货订单数：<a class="Afont22" style="color: #f50;" href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&paystatus=y&status=pass"><%=orderReport.getWaitSendGoodsCount()%></a></td>
						</tr>
					</table>
					
					<div class="alert alert-danger" style="margin-bottom: 2px;text-align: left;">
						<strong><span class="badge badge-important">重要</span>&nbsp;主公，退款订单汇总如下：</strong>
					</div>
					<table class="table table-bordered">
						<tr>
							<td>【卖家需立即处理】退款协议等待卖家确认中：
								<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&refundStatus=WAIT_SELLER_AGREE"><%=orderReport.getWAIT_SELLER_AGREE() %></a>
							</td>
						</tr>
						<tr>
							<td>【卖家需立即处理】等待卖家收货：
								<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&refundStatus=WAIT_SELLER_CONFIRM_GOODS"><%=orderReport.getWAIT_SELLER_CONFIRM_GOODS() %></a>
							</td>
						</tr>
						
						<tr>
							<td>&nbsp;
							</td>
						</tr>
						
						<tr>
							<td>【等待买家处理完】卖家不同意协议，等待买家修改：
								<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&refundStatus=SELLER_REFUSE_BUYER"><%=orderReport.getSELLER_REFUSE_BUYER() %></a>
							</td>
						</tr>
						<tr>
							<td>【等待买家处理完】退款协议达成，等待买家退货：
								<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/order!selectList.action?init=y&refundStatus=WAIT_BUYER_RETURN_GOODS"><%=orderReport.getWAIT_BUYER_RETURN_GOODS() %></a>
							</td>
						</tr>
					</table>
					
					<div class="alert alert-info" style="margin-bottom: 2px;text-align: left;">
						<strong><span class="badge badge-info">关注</span>&nbsp;主公，吐槽和缺货也是要关注一下子的啊：</strong>
					</div>
					<table class="table table-bordered">
						<tr>
							<td>缺货商品数：<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/product!selectList.action?init=y&selectOutOfStockProduct=true"><%=orderReport.getOutOfStockProductCount()%></a></td>
							<td>未回复的吐槽评论数：<a href="<%=SystemManager.systemSetting.getManageHttp()%>/manage/comment!selectList.action?init=y&selectCommentFromIndex=true"><%=orderReport.getNotReplyCommentCount()%></a></td>
						</tr>
					</table>
				</div>
				<div id="tabs-2">
					<table class="table table-condensed">
						<tr>
							<td style="text-align: right;">系统版本:</td>
							<td style="text-align: left;"><%=ssInfo.getVersion() %></td>
						</tr>
						<tr>
							<td style="text-align: right;">系统代号:</td>
							<td style="text-align: left;"><%=ssInfo.getSystemCode() %></td>
						</tr>
						<tr>
							<td style="text-align: right;">名称:</td>
							<td style="text-align: left;"><%=ssInfo.getName() %></td>
						</tr>
						<tr>
							<td style="text-align: right;">简介:</td>
							<td style="text-align: left;"><%=ssInfo.getWww() %></td>
						</tr>
						<tr>
							<td style="text-align: right;">log:</td>
							<td style="text-align: left;"><%=ssInfo.getLog() %></td>
						</tr>
						<tr>
							<td style="text-align: right;">网站标题:</td>
							<td style="text-align: left;"><%=ssInfo.getTitle() %></td>
						</tr>
						<tr>
							<td style="text-align: right;">description:</td>
							<td style="text-align: left;">
								<%=ssInfo.getDescription() %>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">keywords:</td>
							<td style="text-align: left;">
								<%=ssInfo.getKeywords() %>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">shortcuticon:</td>
							<td style="text-align: left;">
								<%=ssInfo.getShortcuticon() %>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">联系地址:</td>
							<td style="text-align: left;">
								<%=ssInfo.getAddress() %>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">联系电话:</td>
							<td style="text-align: left;">
								<%=ssInfo.getTel() %>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">邮箱:</td>
							<td style="text-align: left;">
								<%=ssInfo.getEmail() %>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">备案号:</td>
							<td style="text-align: left;">
								<%=ssInfo.getIcp() %>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">是否开放网站:</td>
							<td style="text-align: left;">
								<input type="checkbox" disabled="disabled"  checked="<%=ssInfo.getIsopen() %>" value="<%=ssInfo.getIsopen() %>"/>
							</td>
						</tr>
						<tr>
							<td style="text-align: right;">关闭信息:</td>
							<td style="text-align: left;">
								<%=ssInfo.getCloseMsg() %>
							</td>
						</tr>
					</table>
				</div>
				<div id="tabs-3">
					<table class="table table-condensed">
						<tr>
							<td style="text-align: right;">图片根路径</td>
							<td style="text-align: left;" ><%=ssInfo.getImageRootPath() %></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- tab end -->
		</div>
	</div>
</body>
</html>
