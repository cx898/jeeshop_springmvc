<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="net.jeeshop.core.oscache.FrontCache"%>
<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="java.net.URL"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
FrontCache frontCache = (FrontCache) app.getBean("frontCache");

String method = request.getParameter("method");
out.println("method="+method);

try{
	if(StringUtils.isBlank(method)){
		frontCache.loadAllCache();
		out.println("加载数据成功！");

	}else if(method.equals("activity")){
		
		frontCache.loadActivityMap();
		frontCache.loadActivityProductList();
		frontCache.loadActivityScoreProductList();
		frontCache.loadActivityTuanProductList();
		out.println("加载数据成功！");
	}else if(method.equals("loadIndexImgs")){
		
		frontCache.loadIndexImgs();
		out.println("加载数据成功！");
	}else if(method.equals("loadAdvertList")){
		
		frontCache.loadAdvertList();
		out.println("加载数据成功！");
	}else if(method.equals("loadNotifyTemplate")){
		
		frontCache.loadNotifyTemplate();
		out.println("加载数据成功！");
	}else if(method.equals("loadProductStock")){
		
		frontCache.loadProductStock();
		out.println("加载数据成功！");
	}else if(method.equals("hotquery")){
		
		frontCache.loadHotquery();
		out.println("加载数据成功！");
	}
}catch(Exception e){
	e.printStackTrace();
}

%>
