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
<!-- <html class="no-js"> -->
<html>
<head>
<%-- <link href="<%=request.getContextPath() %>/resource/js/slideTab2/css/lanrenzhijia.css" rel="stylesheet" type="text/css" /> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/slideTab2/js/jquery-1.7.1.min.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/slideTab2/js/lanrenzhijia.js"></script> --%>
</head>

<body>
<!-- 首页中间位置图片按钮轮播 -->
<style type="text/css">
	/* css 重置 */
/* 	*{margin:0; padding:0; list-style:none; } */
	body{ background:#fff; font:normal 12px/22px 宋体; padding:0px;  }
	img{ border:0;  }
	a{ text-decoration:none; color:#333;  }
	a:hover{ color:#1974A1;  }
	.js{width:90%; margin:10px auto 0 auto; }
	.js p{ padding:5px 0; font-weight:bold; overflow:hidden;  }
	.js p span{ float:right; }
	.js p span a{ color:#f00; text-decoration:underline;   }
	.js textarea{ height:100px;  width:98%; padding:5px; border:1px solid #ccc; border-top:2px solid #aaa;  border-left:2px solid #aaa;  }

	h1{ font:normal 20px/200% "Microsoft YaHei"; _font-weight:bold; padding-bottom:10px;  }
	h2{ font:normal 14px/200% "Microsoft YaHei"; _font-weight:bold; padding-bottom:10px; color:#c00;  }

	/* 本例子css */

	/* 焦点图效果 */
	.picBtnTop{ width:100%; height:214px; border:1px solid #ccc; padding:5px;  position:relative;  overflow:hidden;  zoom:1;   }
	.picBtnTop *{margin:0; padding:0; list-style:none;}
	.picBtnTop .hd{ width:98px;  height:214px; position:absolute; right:5px; overflow:hidden; }
	.picBtnTop .hd ul li{ width:93px; text-align:center; padding:0 0 5px 5px;  }
	.picBtnTop .hd ul li img{ width:85px; height:60px; border:4px solid #ddd; cursor:pointer; vertical-align:bottom; }
	.picBtnTop .hd ul li.on{ background:url("<%=request.getContextPath() %>/resource/js/superSlide/demo/images/icoleft.gif") no-repeat 0 28px; }
	.picBtnTop .hd ul li.on img{ border-color:#f60;  }
	.picBtnTop .bd{ width:550px;  height:214px; position:relative;  }
	.picBtnTop .bd li{ position:relative; zoom:1; vertical-align:middle;}
	.picBtnTop .bd li .pic{ position:relative; z-index:0;  }
	.picBtnTop .bd li .pic img{ width:550px; height:214px; vertical-align:bottom; }
	.picBtnTop .bd li .bg{ width:400px; height:30px; position:absolute; left:0; bottom:0; z-index:1;  background:#000; filter:alpha(opacity=60);opacity:0.6;    }
	.picBtnTop .bd li .title{ width:400px; height:30px; line-height:30px; left:0; bottom:0;   position:absolute; z-index:2;  }
	.picBtnTop .bd li .title a{ color:#fff; padding-left:15px;  }
	#demo1,#demo2{ margin-bottom:20px;  }
</style>
<div id="demo2" class="picBtnTop">
	<div class="hd">
		<ul>
			<li><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic1.jpg" /></li>
			<li><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic2.jpg" /></li>
			<li><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic3.jpg" /></li>
		</ul>
	</div>
	<div class="bd">
		<ul>
			<li>
				<div class="bg"></div>
				<div class="pic"><a href=""><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic1.jpg" /></a></div>
				<div class="title"><a href="">效果图111111111</a></div>
			</li>
			<li>
				<div class="bg"></div>
				<div class="pic"><a href=""><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic2.jpg" /></a></div>
				<div class="title"><a href="">效果图2222222222</a></div>
			</li>
			<li>
				<div class="bg"></div>
				<div class="pic"><a href=""><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic3.jpg" /></a></div>
				<div class="title"><a href="">效果图3333333333</a></div>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	//唯一不同：jQuery("#demo2")
	jQuery("#demo2").slide({ mainCell:".bd ul",effect:"top",autoPlay:false,triggerTime:0 });
</script>

</body>
</html>
