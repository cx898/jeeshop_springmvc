<%@page import="net.jeeshop.core.FrontContainer"%>
<%@page import="net.jeeshop.services.front.order.bean.Order"%>
<%@page import="net.jeeshop.services.front.order.OrderService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.slf4j.*"%>
<%@page import="net.jeeshop.core.pay.alipay.alipayescow.util.AlipayNotify"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	/* *
 功能：支付宝页面跳转同步通知页面
 版本：3.2
 日期：2011-03-17
 说明：
 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 //***********页面功能说明***********
 该页面可在本机电脑测试
 可放入HTML等美化页面的代码、商户业务逻辑程序代码
 TRADE_FINISHED(表示交易已经成功结束，并不能再对该交易做后续操作);
 TRADE_SUCCESS(表示交易已经成功结束，可以对该交易做后续操作，如：分润、退款等);
 //********************************
 * */
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>支付宝页面跳转同步通知页面</title>
	<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
 </head>
 <body>
		<%@ include file="/indexMenu.jsp"%>
		
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12">
							<ol class="breadcrumb">
							  <li>首页</li>
							  <li class="active">支付成功</li>
							</ol>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
							<span class="label label-default" style="font-size:100%;">
								1.查看购物车
							</span>
							&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
							<span class="label label-default" style="font-size:100%;">
								2.确认订单信息
							</span>
							&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
							<span class="label label-success" style="font-size:100%;">
								3.支付成功
							</span>
							&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
							<span class="label label-default" style="font-size:100%;">
								4.确认收货
							</span>
							&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
							<span class="label label-default" style="font-size:100%;">
								5.评价
							</span>
						</div>
					</div>
					<hr>
					
					<div class="row">
						<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
							<div class="panel panel-default">
					              <div class="panel-body" style="font-size: 16px;font-weight: normal;text-align: center;">
					              	  <div class="panel-body" style="font-size: 16px;font-weight: normal;">
						              	 <span class="glyphicon glyphicon-ok text-success"></span>
										 <span class="text-success">订单支付成功</span>
						              </div>
					              </div>
							</div>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<%@ include file="/foot.jsp"%>
  </body>
</html>