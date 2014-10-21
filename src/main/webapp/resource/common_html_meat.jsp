<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="net.jeeshop.core.FrontContainer"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


<%

Object responsive_session2 = request.getSession().getAttribute("responsive");
boolean non_responsive2 = true;
if(responsive_session2!=null){
	if(responsive_session2.toString().equals("y")){
		non_responsive2 = false;
	}
}else{
	if(SystemManager.systemSetting.getOpenResponsive().equals("n")){
		non_responsive2 = true;
	}else{
		non_responsive2 = false;
	}
}
if(!non_responsive2){
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%} %>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><%=SystemManager.systemSetting.getTitle()%></title>
<meta name="description" content="<%=SystemManager.systemSetting.getDescription()%>" />
<meta name="keywords"  content="<%=SystemManager.systemSetting.getKeywords()%>" />
<link rel="shortcut icon" type="image/x-icon" href="<%=SystemManager.systemSetting.getShortcuticon()%>">

