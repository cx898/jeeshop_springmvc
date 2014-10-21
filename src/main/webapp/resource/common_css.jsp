<%-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> --%>
<!-- <script src="http://cdnjs.bootcss.com/ajax/libs/jquery/1.9.1/jquery.min.js" > </script> -->
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.9.1.min.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/base.css"  type="text/css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/tag.css"  type="text/css"> --%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="net.jeeshop.core.front.SystemManager"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/sticky-footer.css"  type="text/css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootswatch.min.css"  type="text/css"> --%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery.blockUI.js"></script> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css"  type="text/css"> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/bootstrap/js/bootstrap.min.js"></script> --%>

<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap2.3.1/bootstrap.min.css"  type="text/css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/flat-ui.css"  type="text/css"> --%>

<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap-responsive.min.css"  type="text/css"> --%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/bootstrap2.3.1/bootstrap.min.js"></script> --%>

<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery.scrollUp.min.js"></script> --%>



<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/html5shiv.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/respond.min.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bsa.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootswatch.js"></script> --%>
<!-- <script type="text/javascript" src="http://bootswatch.com/bower_components/jquery/jquery.min.js"></script> -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap3.0.0/css/bootstrap.min.css"  type="text/css"> --%>

<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap3.0.0/css/font-awesome.css"  type="text/css"> --%>

<%
String style = request.getParameter("style");
if(StringUtils.isBlank(style)){
	style = SystemManager.systemSetting.getStyle();
}
//out.println("style="+style);
%>


<!-- <link rel="stylesheet" href="http://v3.bootcss.com/dist/css/bootstrap.css"  type="text/css"> -->

<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap3.0.0/css/<%=style %>/bootstrap.min.css"  type="text/css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap3.0.0/css/bootstrap-theme.min.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap3.0.0/css/docs.css"  type="text/css">
<%
System.out.println("SystemManager.systemSetting.getOpenResponsive()="+SystemManager.systemSetting.getOpenResponsive());

Object responsive_session = request.getSession().getAttribute("responsive");
boolean non_responsive = true;
if(responsive_session!=null){
	if(responsive_session.toString().equals("y")){
		non_responsive = false;
	}
}else{
	if(SystemManager.systemSetting.getOpenResponsive().equals("n")){
		non_responsive = true;
	}else{
		non_responsive = false;
	}
}
//if(SystemManager.systemSetting.getOpenResponsive().equals("n") || (responsive_session!=null && responsive_session.toString().equals("n"))){

if(non_responsive){
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap3.0.0/css/non-responsive.css"  type="text/css">
<%} %>
<!-- <link rel="stylesheet" href="http://v3.bootcss.com/examples/non-responsive/non-responsive.css"  type="text/css"> -->
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/bootstrap3.0.0/js/bootstrap.min.js"></script> --%>
<!-- tyy 2014年9月2日15:55:41 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<input type="hidden" id="namespace" value="${ctx}" />
