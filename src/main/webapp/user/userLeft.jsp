<%@page import="net.jeeshop.core.FrontContainer"%>
<%@page import="net.jeeshop.web.action.manage.account.AccountAction"%>
<%@page import="net.jeeshop.services.front.catalog.bean.Catalog"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%!
private String getCss(String menu,String selectMenu){
	if(menu.equals(selectMenu)){
		return "active";
	}
	return "";
}
%>
<%
	String aa = "",css = null;
if(request.getAttribute("selectLeftMenu")!=null){
	aa = request.getAttribute("selectLeftMenu").toString();
}
System.out.println();
if(aa.equals(FrontContainer.user_leftMenu_user)){
	css = "active";
}else if(aa.equals("msg")){
	css = "active";
}else if(aa.equals("jcrop")){
	css = "active";
}else if(aa.equals(FrontContainer.user_leftMenu_topwd)){
	css = "active";
}else if(aa.equals(FrontContainer.user_leftMenu_orders)){
	css = "active";
}else if(aa.equals("myReply")){
	css = "active";
}else if(aa.equals("letters")){
	css = "active";
}
%>
<ul class="list-group">
	<a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_user%>.html" class="list-group-item <%=getCss(FrontContainer.user_leftMenu_user, aa)%>">
		<span class="glyphicon glyphicon-user"></span>&nbsp;个人资料
	</a>
	<a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_topwd %>.html" class="list-group-item <%=getCss(FrontContainer.user_leftMenu_topwd, aa)%>">
		<span class="glyphicon glyphicon-screenshot"></span>&nbsp;修改密码
	</a>
	<a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_orders %>.html" class="list-group-item <%=getCss(FrontContainer.user_leftMenu_orders, aa)%>">
		<span class="glyphicon glyphicon-th"></span>&nbsp;我的订单
	</a>
	<a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_address %>.html" class="list-group-item <%=getCss(FrontContainer.user_leftMenu_address, aa)%>">
		<span class="glyphicon glyphicon-send"></span>&nbsp;配送地址
	</a>
	<a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_favorite %>.html" class="list-group-item <%=getCss(FrontContainer.user_leftMenu_favorite, aa)%>">
		<span class="glyphicon glyphicon-tags"></span>&nbsp;收藏夹
	</a>
<%--     <a href="<%=request.getContextPath()%>/user/letters.html" class="list-group-item <%=getCss("letters", aa)%>">系统信件<span class="badge"><s:property value="#session.WEB_USER_INFO.notReadLetters"/></span></a> --%>
</ul>
