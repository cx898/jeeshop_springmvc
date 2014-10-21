<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="net.jeeshop.services.front.product.bean.Product"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.FrontContainer"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 产品列表左边产品图片滚动 -->
<style type="text/css">
		/* 本例子css */
		.picScroll-top{ overflow:hidden; position:relative;  border:1px solid #ccc;   }
/* 		.picScroll-top *{margin:0; padding:0; list-style:none;} */
		.picScroll-top .hd{ overflow:hidden;  height:30px; background:#f4f4f4; padding:0 10px;  }
		.picScroll-top .hd .prev,.picScroll-top .hd .next{ display:block;  width:9px; height:5px; float:right; margin-right:5px; margin-top:10px;  overflow:hidden;
			 cursor:pointer; background:url("<%=request.getContextPath() %>/resource/js/superSlide/demo/images/icoUp.gif") no-repeat;}
		.picScroll-top .hd .next{ background:url("<%=request.getContextPath() %>/resource/js/superSlide/demo/images/icoDown.gif") no-repeat;  }
		.picScroll-top .hd ul{ float:right; overflow:hidden; zoom:1; margin-top:10px; zoom:1; }
		.picScroll-top .hd ul li{ float:left;  width:9px; height:9px; overflow:hidden; margin-right:5px; text-indent:-999px;
		 cursor:pointer; background:url("<%=request.getContextPath() %>/resource/js/superSlide/demo/images/icoCircle.gif") 0 -9px no-repeat; }
		.picScroll-top .hd ul li.on{ background-position:0 0; }
		.picScroll-top .bd{ padding:10px;   }
		.picScroll-top .bd ul{ overflow:hidden; zoom:1; }
		.picScroll-top .bd ul li{ text-align:center; zoom:1; }
		.picScroll-top .bd ul li .pic{ text-align:center;margin: auto; }
		.picScroll-top .bd ul li .pic img{ max-width:200px; max-height:200px; display:block;  padding:0px; border:0px solid #ccc; }
		.picScroll-top .bd ul li .pic a:hover img{ border-color:#999;  }
		.picScroll-top .bd ul li .title{ line-height:24px;text-align: left; }

		</style>

		<div class="picScroll-top">
			<div class="hd"><b>热门推荐</b>
				<a class="next"></a>
				<ul></ul>
				<a class="prev"></a>
				<span class="pageState"></span>
			</div>
			<div class="bd">
				<ul class="picList">
					<%
					Object _code = request.getAttribute("catalogCode");
					String _codeStr = null;
					if(_code!=null){
						_codeStr = _code.toString();
					}
					application.setAttribute("hotProducts", SystemManager.getInstance().getProductsByCatalogCode(_codeStr));
					%>
					
					 <c:forEach items="${applicationScope.hotProducts}" var="row">  
					  <li class="row col-xs-12">
							<div class="pic"><a href="<%=request.getContextPath() %>/product/<c:out escapeXml="false" value="${row.id}" />.html" target="_blank">
								<img border="0" style="margin: auto;" src="<%=SystemManager.systemSetting.getImageRootPath()%><c:out escapeXml="false" value="${row.picture}" />" /></a>
							</div>
							<div class="left_title" style="text-align: center;">
								<a href="http://www.SuperSlide2.com" target="_blank" style="margin: auto;text-align: center;" title="<c:out escapeXml="false" value="${row.name}"/>">
									<c:out escapeXml="false" value="${row.name}"/>
								</a>
							</div>
							<div class="left_title" style="text-align: center;">
								<b style="font-weight: bold;color: #cc0000;">
									￥<c:out escapeXml="false" value="${row.nowPrice}" />
								</b>
								<b style="text-decoration: line-through;font-weight: normal;font-size: 11px;color: #a5a5a5;margin-left: 20px;">
									￥<c:out escapeXml="false" value="${row.price}" />
								</b>
							</div>
						</li>
					 </c:forEach>
				</ul>
			</div>
		</div>

