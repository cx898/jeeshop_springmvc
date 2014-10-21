<%@page import="net.jeeshop.services.front.catalog.bean.Catalog"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="java.util.LinkedList"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.Collections"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="java.util.List"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style type="text/css">
.menu .items ul li .on{
	-webkit-transform: perspective(700px) translateY(0px) translateZ(0px) rotateX(0deg);
	-moz-transform: perspective(700px) translateY(0px) translateZ(0px) rotateX(0deg);
	-ms-transform: perspective(700px) translateY(0px) translateZ(0px) rotateX(0deg);
	-o-transform: perspective(700px) translateY(0px) translateZ(0px) rotateX(0deg);
	transform: perspective(700px) translateY(0px) translateZ(0px) rotateX(0deg);
	-webkit-transition:all 600ms ease-in-out 0s;
	-moz-transition:all 600ms ease-in-out 0s;
	-ms-transition:all 600ms ease-in-out 0s;
	-o-transition:all 600ms ease-in-out 0s;
	transition:all 600ms ease-in-out 0s;
	-webkit-backface-visibility:hidden;
	-moz-backface-visibility:hidden;
	-ms-backface-visibility:hidden;
	-o-backface-visibility:hidden;
	backface-visibility:hidden;
	-webkit-transform-origin: 50% 100% 0;
	-moz-transform-origin: 50% 100% 0;
	-ms-transform-origin: 50% 100% 0;
	-o-transform-origin: 50% 100% 0;
	transform-origin: 50% 100% 0;
	line-height:25px;
	height:25px;
}
.menu .items ul li .scroll {
	-webkit-transform: perspective(700px) translateY(0px) translateZ(-21px) rotateX(-90deg);
	-moz-transform: perspective(700px) translateY(0px) translateZ(-21px) rotateX(-90deg);
	-ms-transform: perspective(700px) translateY(0px) translateZ(-21px) rotateX(-90deg);
	-o-transform: perspective(700px) translateY(0px) translateZ(-21px) rotateX(-90deg);
	box-shadow: 0 2px 2px #AAAAAA;
	height:0px;
}
</style>
	
<!-- <div class="wrap"> -->
<div id="menu" class="menu" style="border: 2px solid #f40;width: 100%;">
    <c:choose>
      <c:when test="${sessionScope.selectMenu =='user_centers' }">
	        <div class="items">
		        <ul>
		        	<h4 class="title">
				        <a style="text-decoration: none;"><strong>用户中心</strong></a>
				        <s class="btn_group bright">
				            <a class="bleft" title="扩展视图"></a>
				            <a class="bright" title="精简视图"></a>
				        </s>
				    </h4>
		            <li class="list-item0">
		                <h5><a>订单</a></h5>
		            </li>
		            <li class="list-item0">
		                <h5><a>个人资料</a></h5>
		            </li>
		            <li class="list-item0">
		                <h5><a>配送地址</a></h5>
		            </li>
		      </ul>
		  </div>
      </c:when>
      <c:otherwise>
         	<div class="items" style="width: 100%;">
		        <ul>
		        	<h4 class="title">
				        <a style="text-decoration: none;"><strong>商品分类</strong></a>
				        <s class="btn_group bright">
				            <a class="bleft" title="扩展视图"></a>
				            <a class="bright" title="精简视图"></a>
				        </s>
				    </h4>
				    <c:forEach items="${applicationScope.catalogs}" var="superType">
				      <li class="list-item0">
		                <h5><c:out escapeXml="false" value="${superType.name}" /></h5>
		                <c:forEach items="${superType.children}" var="smallType"> 
		                  <a href="<%=request.getContextPath() %>/catalog/<c:out escapeXml="false" value="${smallType.code}" />.html">
		                  <c:out escapeXml="false" value="${smallType.name}" />/</a>
		                </c:forEach>
		              </li>
				    </c:forEach>
		      </ul>
		  </div>
      </c:otherwise>
    </c:choose>
</div>
