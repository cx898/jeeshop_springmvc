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


<!-- 首页通知切换卡 -->
<style type="text/css">
		/* css 重置 */
/* 		*{margin:0; padding:0; list-style:none; } */
/* 		body{ background:#fff; font:normal 12px/22px 宋体;  } */
/* 		img{ border:0;  } */
/* 		a{ text-decoration:none; color:#333;  } */
/* 		a:hover{ color:#1974A1;  } */


		/* 本例子css */
		.slideTxtBox{ width:100%; border:1px solid #ddd; text-align:left;max-height: 229px;  }
 		.slideTxtBox li{margin:0; padding:0; list-style:none;} 
		.slideTxtBox .hd{ height:30px; line-height:30px; background:#f4f4f4; padding:0 20px; border-bottom:1px solid #ddd;  position:relative;  }
		.slideTxtBox .hd ul{ float:left; position:absolute; left:20px; top:-1px; height:32px;   }
		.slideTxtBox .hd ul li{ float:left; padding:0 15px; cursor:pointer;  }
		.slideTxtBox .hd ul li.on{ height:30px;  background:#fff; border:1px solid #ddd; border-bottom:2px solid #fff; }
		.slideTxtBox .bd ul{ padding:15px;  zoom:1;  }
		.slideTxtBox .bd li{ height:24px; line-height:24px;   
			display: block;
/* 			width: 200px; */
			overflow: hidden; /*注意不要写在最后了*/
			white-space: nowrap;
			-o-text-overflow: ellipsis;
			text-overflow: ellipsis;
		}
		.slideTxtBox .bd li .date{ float:right; color:#999;  }

		</style>


<div class="slideTxtBox">
	<div class="hd" style="text-align: left;">
		<ul style="padding-left: 0px;"><li>公告新闻</li></ul>
	</div>
	<div class="bd">
		<ul>
			<%
			application.setAttribute("_noticeList", SystemManager.noticeList);
			%>
			
		 <c:forEach items="${applicationScope._noticeList}" var="row" varStatus="vs">  
		  <li><a href="<%=request.getContextPath() %>/news/<c:out escapeXml="false" value="${row.id}"/>.html" target="_blank" title="<c:out escapeXml="false" value="${row.title}"/>">
					<c:if test="${vs.index==0}">
						[新]
					</c:if>
					<c:out escapeXml="false" value="${row.title}"/></a>
				</li>
		 </c:forEach>
		</ul>
	</div>
</div>
