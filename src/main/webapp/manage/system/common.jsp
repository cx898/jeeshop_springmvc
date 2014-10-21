<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap2.3.1/bootstrap.min.css"  type="text/css"> --%>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/base.css"  type="text/css"> --%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css"  type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/base.css"  type="text/css">


<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/manage.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<input type="hidden" id="namespace" value="${ctx}" />