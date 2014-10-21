<%@page import="net.jeeshop.services.front.systemSetting.bean.SystemSetting"%>
<%@page import="net.jeeshop.web.action.front.orders.CartInfo"%>
<%@page import="net.jeeshop.services.front.product.bean.Product"%>
<%@page import="net.jeeshop.core.FrontContainer"%>
<%@page import="net.jeeshop.services.front.catalog.bean.Catalog"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	//如果网站关闭，则访问包含有菜单的页面会提示站点关闭的信息。这个不和404页面冲突。各自报各自的错误。
SystemSetting ss2 = SystemManager.systemSetting;
if (ss2 != null && StringUtils.isNotBlank(ss2.getIsopen())
	&& !Boolean.valueOf(ss2.getIsopen())) {
	response.getWriter().write(ss2.getCloseMsg());
	return;
}
%>

<style type="text/css">
.centerImageCss{
	width: 289px;
	height: 190px;
}
.title {
	display: block;
	width: 280px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
body{
	padding-top: 0px;
  	padding-bottom: 0px;
	font-size: 12px;
/*    	font-family: 微软雅黑, Verdana, sans-serif, 宋体; */
}
</style>

<style>
.hotSearch{
	cursor: pointer;
}
</style>
<a name="toTop" id="toTop"></a>
<!-- 顶部导航条 -->
<!-- <div class="navbar navbar-default navbar-fixed-top" -->
<div class="navbar navbar-default"
	style="background-color: white;border-color: #ccc;min-height: 10px;margin-top: 0px;margin-bottom: 0px;border: 0px;">
<!-- 			style="position: fixed;top: 0px;text-align: right;border: 2px solid red;z-index: 10000;"> -->
	<div class="container" style="min-height: 10px;margin-top:5px;margin-bottom:5px;border: 0px solid red;">
		<div class="row">
			<div class="col-xs-3">
				<a href="<%=SystemManager.systemSetting.getWww()%>"><img style="max-height: 50px;" alt="myshop-logo" src="<%=SystemManager.systemSetting.getLog()%>"/></a>
			</div>
			<div class="col-xs-6" style="border: 0px solid blue;padding-left:5px;">
				<!-- search查询输入框 -->
<!-- 				style="padding: 0px;margin-left: 0px;" -->
				<form class="form-inline" role="form" name="searchForm" id="searchForm" 
					action="<%=request.getContextPath()%>/search.html">
						<%
							String key = "";
										if(request.getAttribute("key")!=null && !StringUtils.isBlank(request.getAttribute("key").toString())){
											key = request.getAttribute("key").toString();
										}
						%>
					<div class="form-group btn-group">
						<div class="input-group">
							<input type="text" name="key" id="key" class="form-control input-sm" style="border: 2px solid red;border-right: 0px;" 
			      		placeholder="请输入商品关键字" size="40" value="<%=key%>" maxlength="20"/>
							<span class="input-group-btn">
								<button value="搜索" class="btn btn-primary btn-sm" onclick="search();">
									<span class="glyphicon glyphicon-search"></span>&nbsp;搜索
								</button>
								<a class="btn btn-success btn-sm" href="${ctx}/cart/cart.html">
									<span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;购物车
								<%
										CartInfo cartInfo = (CartInfo)request.getSession().getAttribute(FrontContainer.myCart);
															if(cartInfo!=null && cartInfo.getProductList()!=null && cartInfo.getProductList().size()>0){
									%>
								<span class="badge badge-success"><%=cartInfo.getProductList().size()%></span>
								<%
									}
								%>
								</a>
							</span>
						</div>
					</div>
				</form>
				<div style="text-align: left;margin-top: 5px;">热门搜索：
					<%
						application.setAttribute("hotqueryList", SystemManager.hotqueryList);
					%>
					 <c:forEach items="${applicationScope.hotqueryList}" var="hotQuery" >  
					 	<a class="hotSearch" href="<c:out value="${hotQuery.url}"/>" target="_blank">
							<c:out  value="${hotQuery.key1}"/>
						</a>
					 </c:forEach>
				</div>
			</div>
			<div class="col-xs-3" style="height: 100%;">
		    	<div class="row" style="height: 100%;">
		    		<c:choose>
						<c:when test="${sessionScope.user_info == null}">
						   <span class="col-xs-12" id="loginOrRegSpan" style="font-size: 14px;">
		          			<a href="<%=request.getContextPath()%>/user/login.html">登陆</a>|<a href="<%=request.getContextPath()%>/user/register.html">注册</a>
		          		   </span>
						</c:when>
						<c:otherwise>
						  	<span id="myshopMenuPPP" style="display: inline-block;z-index: 9999;position: relative;;">
		          			<!-- 会员中心的菜单 -->
		          			<span style="margin-top: 0px;">
							  <a data-toggle="dropdown" style="display: block;margin-top: 0px;">
							  	<span class="glyphicon glyphicon-user"></span>&nbsp;用户中心
							  	
							  	
		          			(<c:out  value="${sessionScope.user_info.nickname}"/>
<!-- 		          			<s:property  value="#session.user_info.loginType"/> -->
		          			)
<!-- 							    	<s:property  value="#session.user_info.nickname"/>(<s:property  value="#session.user_info.account"/>) -->
							    	<span class="caret" style="display: inline-block;"></span>
							  </a>
							  <ul class="dropdown-menu" id="myshopMenu" role="menu" style="display: none;margin-top: 0px;">
							    <li><a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_user%>.html"><span class="glyphicon glyphicon-user"></span>&nbsp;个人资料</a></li>
							    <li><a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_topwd%>.html"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;修改密码</a></li>
							    <li class="divider"></li>
							    <li><a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_orders%>.html"><span class="glyphicon glyphicon-th"></span>&nbsp;我的订单</a></li>
							    <li><a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_address%>.html"><span class="glyphicon glyphicon-send"></span>&nbsp;配送地址</a></li>
							    <li><a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_favorite%>.html"><span class="glyphicon glyphicon-tags"></span>&nbsp;收藏夹</a></li>
							    <li class="divider"></li>
							    <li><a href="<%=request.getContextPath()%>/user/<%=FrontContainer.user_leftMenu_exit%>.html"><span class="glyphicon glyphicon-pause"></span>&nbsp;退出系统</a></li>
							  </ul>
							</span>
			          		</span>
			          		<span style="display: none;">
			          			<c:out  value="${sessionScope.user_info.nickname}"/>
			          			(<c:out  value="${sessionScope.user_info.loginType}"/>)
			          		</span>
						</c:otherwise>
					</c:choose>
		          	<div style="vertical-align: middle;margin-top: 10px;font-size: 18px;z-index: 0;">
		          		<span class="glyphicon glyphicon-earphone"></span>&nbsp;客服热线:<%=SystemManager.systemSetting.getTel()%>
		          	</div>
		    	</div>
			</div>
		</div>
		
	</div>
</div>
		
<!-- <div class="navbar navbar-default navbar-fixed-top" style="top: 50px;"> -->
<div class="navbar navbar-default" style="margin-bottom: 15px;z-index: 111">
      <div class="container">
        <div class="navbar-header col-xs-3" style="text-align: center;" id="navbar-header">
					<c:choose>
						<c:when test="${sessionScope.selectMenu == ''}">
						   <a class="navbar-brand" href="<%=SystemManager.systemSetting.getWww()%>" style="font-weight: bold;margin-left: 5px;">全部商品分类</a>
						</c:when>
						<c:otherwise>
						   <a class="navbar-brand" href="<%=SystemManager.systemSetting.getWww()%>" style="font-weight: bold;margin-left: 5px;">全部商品分类</a>
						</c:otherwise>
					</c:choose>
	          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
	          <ul class="nav navbar-nav" >
	          		<%
	          			//out.println("request.getServletPath()="+request.getServletPath());
	          				          		if(request.getServletPath().endsWith("/index.jsp")){
	          				          			request.getSession().setAttribute(FrontContainer.selectMenu,"0");
	          				          		}else if(request.getServletPath().endsWith("/specialProductList.jsp")){
	          				          			request.getSession().setAttribute(FrontContainer.selectMenu,"special");
	          				          		}
	          				          		if(request.getSession().getAttribute(FrontContainer.selectMenu)==null){
	          			          				request.getSession().setAttribute(FrontContainer.selectMenu,"0");
	          				          		}
	          				          		
	          				          		List<Catalog> catalogs = SystemManager.catalogs;
	          			          			application.setAttribute("catalogs", catalogs);
	          		%>
	          		<!-- 首页 -->
					<c:choose>
						<c:when test="${sessionScope.selectMenu == ''}">
						   <li class="active"><a href="<%=SystemManager.systemSetting.getWww()%>"><b>首页</b></a></li>
						</c:when>
						<c:otherwise>
						  <li><a href="<%=SystemManager.systemSetting.getWww()%>"><b>首页</b></a></li>
						</c:otherwise>
					</c:choose>
					<!-- 类别作为菜单显示 -->
					 <c:forEach items="${applicationScope.catalogs}" var="row">
					 	<c:if test="${row.showInNav =='y' }">
							<c:choose>
								<c:when test="${row.id == sessionScope.selectMenu}}">
								   <li class="active"><a href="<%=request.getContextPath()%>/
							 		catalog/<c:out  value="${row.code}" />.html">
							 		<b><c:out  value="${row.name}" /></b></a></li>
								</c:when>
								<c:otherwise>
								    <li><a href="<%=request.getContextPath()%>/
								    catalog/<c:out  value="${row.code}" />.html"><b>
								    <c:out  value="${row.name}" /></b></a></li>
								</c:otherwise>
							</c:choose>
					 	</c:if>  
					 </c:forEach>
				</ul>

		          <ul class="nav navbar-nav navbar-right" style="display: block;">
		          	<!-- 促销活动 -->
					<c:choose>
						<c:when test="${sessionScope.selectMenu == 'activity'}">
						   <li class="active"><a href="<%=request.getContextPath() %>/activity/activity.html" >
							<span class="glyphicon glyphicon-time"></span>
								<b>促销活动</b></a>
							</li>
						</c:when>
						<c:otherwise>
						  <li>
							<a href="<%=request.getContextPath() %>/activity/activity.html" >
							<span class="glyphicon glyphicon-time"></span>
							<b>促销活动</b></a>
						  </li>
						</c:otherwise>
					</c:choose>

					<!-- 积分商城 -->
					<c:choose>
						<c:when test="${sessionScope.selectMenu == 'score'}">
						   <li class="active"><a href="<%=request.getContextPath() %>/activity/score.html" >
							<span class="glyphicon glyphicon-time"></span>
								<b>积分商城</b></a>
							</li>
						</c:when>
						<c:otherwise>
						  <li>
							<a href="<%=request.getContextPath() %>/activity/score.html" >
							<span class="glyphicon glyphicon-time"></span>
							<b>积分商城</b></a>
						  </li>
						</c:otherwise>
					</c:choose>

					<!-- 团购活动 -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${sessionScope.selectMenu == 'tuan'}"> --%>
<%-- 						   <li class="active"><a href="<%=request.getContextPath() %>/activity/tuan.html" > --%>
<!-- 							<span class="glyphicon glyphicon-time"></span> -->
<!-- 								<b>团购活动</b></a> -->
<!-- 							</li> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 						  <li> -->
<%-- 							<a href="<%=request.getContextPath() %>/activity/tuan.html" > --%>
<!-- 							<span class="glyphicon glyphicon-time"></span> -->
<!-- 							<b>团购活动</b></a> -->
<!-- 						  </li> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
		          </ul>
        </div>
      </div>
    </div>
<!-- <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"0","bdPos":"right","bdTop":"100"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=86835285.js?cdnversion='+~(-new Date()/36e5)];</script> -->
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script> --%>