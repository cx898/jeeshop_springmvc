<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<%@page import="net.jeeshop.core.FrontContainer"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<%-- <script src="<%=request.getContextPath() %>/resource/js/superSlide/jquery.pack.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/resource/js/superSlide/jquery.SuperSlide.js"></script> --%>
</head>

<body>
<!-- 首页通知切换卡 -->
<style type="text/css">
		/* css 重置 */
/* 		*{margin:0; padding:0; list-style:none; } */
/* 		body{ background:#fff; font:normal 12px/22px 宋体;  } */
/* 		img{ border:0;  } */
/* 		a{ text-decoration:none; color:#333;  } */
/* 		a:hover{ color:#1974A1;  } */


		/* 本例子css */
		.slideTxtBox{ width:100%; border:1px solid #ddd; text-align:left;  }
		.slideTxtBox *{margin:0; padding:0; list-style:none;}
		.slideTxtBox .hd{ height:30px; line-height:30px; background:#f4f4f4; padding:0 20px; border-bottom:1px solid #ddd;  position:relative;  }
		.slideTxtBox .hd ul{ float:left; position:absolute; left:20px; top:-1px; height:32px;   }
		.slideTxtBox .hd ul li{ float:left; padding:0 15px; cursor:pointer;  }
		.slideTxtBox .hd ul li.on{ height:30px;  background:#fff; border:1px solid #ddd; border-bottom:2px solid #fff; }
		.slideTxtBox .bd ul{ padding:15px;  zoom:1;  }
/* 		.slideTxtBox .bd li{ height:24px; line-height:24px;    */
/* 			display: block; */
/* 			width: 200px; */
/* 			overflow: hidden; /*注意不要写在最后了*/ */
/* 			white-space: nowrap; */
/* 			-o-text-overflow: ellipsis; */
/* 			text-overflow: ellipsis; */
/* 		} */
		.slideTxtBox .bd li .date{ float:right; color:#999;  }
		#productdetailDiv img{max-width: 670px;}
		</style>


		<div class="slideTxtBox">
			<div class="hd">
				<ul><li>商品介绍</li><li>商品评论</li></ul>
			</div>
			<div class="bd">
				<ul>
					<!-- 商品参数 -->
					<div class="row">
						<div class="col-md-12">
							<c:forEach items="${e.parameterList}" var="product" >
							  <div class="col-md-4" style="margin-bottom: 5px;padding-right: 2px;">
								<b><c:out escapeXml="false" value="${product.name}"/> : </b><c:out escapeXml="false" value="${product.value}"/><br>
							 </div>
							</c:forEach>
						</div>
					</div>
					<br>
					
					<!-- 商品HTML信息 -->
					<div class="row">
						<div class="col-xs-12">
							<div style="border: 0px solid; text-align: left;" id="productdetailDiv">
<%-- 								<c:out value="e.productHTML" escapeXml="false"/> --%>
								
								<%String productHTMLUrl = request.getAttribute("productHTMLUrl").toString();%>
								<jsp:include flush="true" page="<%=productHTMLUrl %>"></jsp:include>
							</div>
						</div>
					</div>
				</ul>
				<ul>
				<!-- 评论 -->
					<%
					String _commentTypeCode = SystemManager.commentTypeCode;
					request.setAttribute("_commentTypeCode",_commentTypeCode);
					%>
					<c:choose>
					<c:when test="${requestScope._commentTypeCode =='default' }">
						<div class="row">
							<div class="col-xs-12">
								<c:forEach var="comment" items="${requestScope.commentPager.list}">
									<ul class="media-list">
									  <li class="media">
									    <span class="pull-left" href="#">
									      <img class="media-object err-product" style="width: 50px;height: 50px;border: 0px;" alt="" src="http://myshopxx.oss.aliyuncs.com/attached/image/20140304/1393900153455_3.jpg">
									      (金牌会员)
									    </span>
									    <div class="media-body">
									      <h4 class="media-heading"><c:out escapeXml="false" value="${comment.nickname}"/></h4>
									      <c:out escapeXml="false" value="${comment.content}"/>
									      
									      <c:if test="${comment.reply!=null and comment.reply!=''}">
										      <div class="media">
										      	<span class="pull-left" href="#">
											      <img class="media-object err-product" style="width: 50px;height: 50px;border: 0px;" alt="" src="http://myshopxx.oss.aliyuncs.com/attached/image/20140304/1393900153455_3.jpg">
											      (店小二)
											    </span>
											    <div class="media-body">
											    	<h4 class="media-heading" style="color:color:#f50">[店小二]回复：</h4>
										      		<c:out escapeXml="false" value="${comment.reply}"/>
											    </div>
										      </div>
									      </c:if>
									    </div>
									  </li>
									</ul>
								</c:forEach>
							</div>
							<div class="row" style="text-align: right;">
								<div class="col-xs-12">
									<c:choose>
									  <c:when test="${requestScope.commentPager.list!=null and 
									  fn:length(requestScope.commentPager.list) != 0 }">
									    <%@ include file="pager.jsp"%>
									  </c:when>
									  <c:otherwise>
									    该商品暂无评论！
									  </c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${requestScope._commentTypeCode =='duoshuo' }">
						<div class="row">
							<div class="col-xs-12">
								<%@ include file="duoshuo.jsp"%>
							</div>
						</div>
					</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
</body>
</html>
