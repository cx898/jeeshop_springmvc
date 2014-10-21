<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/resource/js/slideTab2/css/lanrenzhijia.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/slideTab2/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/slideTab2/js/lanrenzhijia.js"></script>
<style type="text/css">
.lazy {
  display: none;
}
</style>
</head>

<body>
<%application.setAttribute("indexImages", SystemManager.indexImages);%>
<!-- 首页中间位置图片轮播 -->
<div class="zhuanti_box">
  <div id="slideBox">
    <div class="J_slide" style="height: 100%;">
      <div class="J_slide_clip">
        <ul class="J_slide_list">
        	
		 <c:forEach items="${applicationScope.indexImages}" var="row">  
		  <li class="J_slide_item">
  			<c:choose>
				<c:when test="${row.link != null}">
				   	<a href="<c:out escapeXml="false" value="${row.link}"/>" target="_blank">
			          	<img style="max-width: 100%;" 
			          	src="<%=SystemManager.systemSetting.getImageRootPath()%><c:out escapeXml="false" value="${row.picture}"/>" >
			          </a>
				</c:when>
				<c:otherwise>
				       <img style="max-width: 100%;" 
			          	src="<%=SystemManager.systemSetting.getImageRootPath()%><c:out escapeXml="false" value="${row.picture}"/>" >
				</c:otherwise>
			</c:choose>
		  </li> 
		 </c:forEach>
        </ul>
      </div>
      <ul class="J_slide_trigger">
		 <c:forEach items="${applicationScope.indexImages}" var="row">  
		  <li class="">
	        	<a href="javascript:" title="<c:out value="${row.title}" escapeXml="$false"/>">
	        		<c:out value="${row.title}" escapeXml="false"/>
	        	</a>
	        </li>
		 </c:forEach>
      </ul>
    </div>
  </div>
</div>
  <script type="text/javascript">
   new Tab('.J_tab',{auto:false});
   new Slide('#slideBox',{index: 1 ,effect:'slide', firstDelay:8});
  </script>
</body>
</html>
