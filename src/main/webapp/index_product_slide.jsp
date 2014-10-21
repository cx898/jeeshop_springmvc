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

</head>

<body>
<!-- 首页产品轮播展示 -->
<div class="lanrenzhijia">
  <div class="title cf">
    <h2 class="fl">xw素材网</h2>
    <ul class="title-list fr cf ">
      <li class="on">LOGO</li>
      <li>宣传单</li>
      <li>画册</li>
      <li>优惠券</li>
      <li>会员卡</li>
      <p><b></b></p>
    </ul>
  </div>
  <div class="product-wrap">
    <!--案例1-->
    <div class="product show">
      <ul class="cf">
        <li class="ml0"> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/1.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net">站长素材网站logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/1.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/1.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/1.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
      </ul>
    </div>
    <!--案例2-->
    <div class="product">
      <ul class="cf">
        <li class="ml0"> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/2.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/2.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/2.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/2.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
      </ul>
    </div>
    <!--案例3-->
    <div class="product">
      <ul class="cf">
        <li class="ml0"> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/3.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/3.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/3.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/3.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
      </ul>
    </div>
    <!--案例4-->
    <div class="product">
      <ul class="cf">
        <li class="ml0"> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/4.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/4.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/4.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/4.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
      </ul>
    </div>
    <!--案例5-->
    <div class="product">
      <ul class="cf">
        <li class="ml0"> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/5.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/5.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/5.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
        <li> <a href="http://www.xwcms.net" class="imgwrap"> <img src="<%=request.getContextPath() %>/resource/js/slideTab1/images/5.jpg"> </a>
          <p class="mt10"> <a href="http://www.xwcms.net"> 深圳达文影视传媒有限公司logo... </a></p>
          <p class="pb10">行业类别：艺术摄影,文化体育</p>
        </li>
      </ul>
    </div>
  </div>
</div>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/js/slideTab1/css/lanrenzhijia.css" type="text/css">
<script src="<%=request.getContextPath() %>/resource/js/slideTab1/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resource/js/slideTab1/js/lanrenzhijia.js"></script>
</body>
</html>
