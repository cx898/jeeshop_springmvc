<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->

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

<div id="menu" class="menu" style="border: 2px solid red;">
	<!-- 帮助中心目录菜单 -->
	<div class="items">
		<ul>
			<h4 class="title">
				<strong>帮助中心</strong>
			</h4>
			<%application.setAttribute("newCatalogs", SystemManager.newCatalogs);%>
			<c:forEach items="${applicationScope.newCatalogs}" var="help">
			  <li class="list-item0">
					<h5>
						<c:out escapeXml="false" value="${help.name}" />
					</h5>
					<c:forEach items="${help.news}" var="item">
						<div style="margin-left: 20px;">
							<a href="<%=request.getContextPath()%>/help/<c:out escapeXml="false" value="${item.code}" />.html"><c:out escapeXml="false" value="${item.title}" /></a>
						</div>
					</c:forEach>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<br><br><br><br><br>
<div class="panel panel-default">
  <div class="panel-body">
    	<ul>
    	<c:forEach items="${applicationScope.newCatalogs}" var="help">
			<li class="list-item0">
				<h5>
					<c:out escapeXml="false" value="${help.name}" />
				</h5>
				<c:forEach value="${help.news}" var="item">
					<div style="margin-left: 20px;">
						<a href="<%=request.getContextPath()%>/help/<c:out escapeXml="false" value="${item.code}" />.html"><c:out escapeXml="false" value="${item.title}" /></a>
					</div>
				</c:forEach>
			</li>
		</c:forEach>
    	</ul>
  </div>
</div>


