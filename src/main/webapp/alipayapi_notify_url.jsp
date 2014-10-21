<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="net.jeeshop.services.front.order.OrderService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="net.jeeshop.core.pay.alipay.alipayescow.util.AlipayNotify"%>
<%@page import="org.slf4j.*"%>
<%
 //功能：支付宝服务器异步通知页面
// 版本：3.3
 //日期：2012-08-17
 //说明：
 //以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 //该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 //***********页面功能说明***********
 //创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
 //该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
 //该页面调试工具请使用写文本函数logResult，该函数在com.alipay.util文件夹的AlipayNotify.java类文件中
 //如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
 //********************************
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	Logger logger = LoggerFactory.getLogger(AlipayNotify.class);
	System.out.println("============alipayapi_notify_url.jsp============");
	logger.error("============alipayapi_notify_url.jsp============");
	//获取支付宝POST过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map requestParams = request.getParameterMap();
	for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
		//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
		params.put(name, valueStr);
	}
	
	logger.error("params="+params);
	
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
	//商户订单号

	String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

	//支付宝交易号

	String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

	//交易状态
	String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
	//退款状态
	String refund_status = null;
	if(StringUtils.isNotBlank(request.getParameter("refund_status"))){
		refund_status = new String(request.getParameter("refund_status").getBytes("ISO-8859-1"),"UTF-8");
	}
	logger.error("out_trade_no="+out_trade_no+",trade_no="+trade_no+",trade_status="+trade_status+",refund_status="+refund_status);
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

	if(AlipayNotify.verify(params)){//验证成功
		//本系统的业务逻辑处理，把订单更新为已成功付款状态
		WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
		OrderService orderService = (OrderService) app.getBean("orderServiceFront");
		//////////////////////////////////////////////////////////////////////////////////////////
		//请在这里加上商户的业务逻辑程序代码

		//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
		logger.error("支付宝异步验证成功!");
		if(StringUtils.isNotBlank(trade_status)){
			if(orderService.alipayNotify(trade_status,refund_status,out_trade_no,trade_no)){
				out.println("success");	//请不要修改或删除
			}else{
				out.println("success_fail");	//请不要修改或删除
			}
			if(trade_status.equals("WAIT_BUYER_PAY")){
			//该判断表示买家已在支付宝交易管理中产生了交易记录，但没有付款
			
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
				//orderService.alipayNotify(trade_status,refund_status,out_trade_no,trade_no);
				//out.println("success");	//请不要修改或删除
			} else if(trade_status.equals("WAIT_SELLER_SEND_GOODS")){
			//该判断表示买家已在支付宝交易管理中产生了交易记录且付款成功，但卖家没有发货
			
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
				//orderService.alipayNotify(trade_status,refund_status,out_trade_no,trade_no);
				//out.println("success");	//请不要修改或删除
			} else if(trade_status.equals("WAIT_BUYER_CONFIRM_GOODS")){
			//该判断表示卖家已经发了货，但买家还没有做确认收货的操作
			
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
				//orderService.alipayNotify(trade_status,refund_status,out_trade_no,trade_no);
				out.println("success");	//请不要修改或删除
			} else if(trade_status.equals("TRADE_FINISHED")){
			//该判断表示买家已经确认收货，这笔交易完成
			
				//判断该笔订单是否在商户网站中已经做过处理
					//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
					//如果有做过处理，不执行商户的业务程序
				//orderService.alipayNotify(trade_status,refund_status,out_trade_no,trade_no);
				//out.println("success");	//请不要修改或删除
			}
			else {
				//out.println("success");	//请不要修改或删除
			}
		}
		
		//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

		//////////////////////////////////////////////////////////////////////////////////////////
	}else{//验证失败
		out.println("fail");
		logger.error("支付宝异步验证失败!");
	}
%>
