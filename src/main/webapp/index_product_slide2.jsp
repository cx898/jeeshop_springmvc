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
<%-- <script src="<%=request.getContextPath() %>/resource/js/superSlide/jquery.pack.js"></script> --%>
<%-- <script src="<%=request.getContextPath() %>/resource/js/superSlide/jquery.SuperSlide.js"></script> --%>
</head>

<body>
<!-- 首页产品轮播展示 -->
<style type="text/css">
		/* css 重置 */
/* 		*{margin:0; padding:0; list-style:none; } */
		body{ background:#fff; font:normal 12px/22px 宋体;  }
		img{ border:0;  }
		a{ text-decoration:none; color:#333;  }
		.js{width:90%; margin:10px auto 0 auto; }
		.js p{ padding:5px 0; font-weight:bold; overflow:hidden;  }
		.js p span{ float:right; }
		.js p span a{ color:#f00; text-decoration:underline;   }
		.js textarea{ height:50px;  width:98%; padding:5px; border:1px solid #ccc; border-top:2px solid #aaa;  border-left:2px solid #aaa;  }


		/* 本例子css */
		.multipleColumn{ overflow:hidden; position:relative; width:100%;  border:1px solid #ccc;   }
		.multipleColumn *{margin:0; padding:0; list-style:none;}
		.multipleColumn .hd{ overflow:hidden;  height:30px; background:#f4f4f4; padding:0 10px;  }
		.multipleColumn .hd .prev,.multipleColumn .hd .next{ display:block;  width:5px; height:9px; float:right; margin-right:5px; margin-top:10px;  overflow:hidden;
			 cursor:pointer; background:url("<%=request.getContextPath() %>/resource/js/superSlide/demo/images/icoLeft.gif") no-repeat;}
		.multipleColumn .hd .next{ background:url("<%=request.getContextPath() %>/resource/js/superSlide/demo/images/icoRight.gif") no-repeat;  }
		.multipleColumn .hd ul{ float:right; overflow:hidden; zoom:1; margin-top:10px; zoom:1; }
		.multipleColumn .hd ul li{ float:left;  width:9px; height:9px; overflow:hidden; margin-right:5px; text-indent:-999px; cursor:pointer; background:url("<%=request.getContextPath() %>/resource/js/superSlide/demo/images/icoCircle.gif") 0 -9px no-repeat; }
		.multipleColumn .hd ul li.on{ background-position:0 0; }

		.multipleColumn .bd{ padding:10px; overflow:hidden;  }
		.multipleColumn .bd ul{ overflow:hidden; zoom:1; width:284px;  float:left; _display:inline;  }
		.multipleColumn .bd ul li{ margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center;  }
		.multipleColumn .bd ul li .pic{ text-align:center; }
		.multipleColumn .bd ul li .pic img{ width:120px; height:90px; display:block;  padding:2px; border:1px solid #ccc; }
		.multipleColumn .bd ul li .pic a:hover img{ border-color:#999;  }
		.multipleColumn .bd ul li .title{ line-height:24px;   }

		</style>

		<div class="multipleColumn" style="margin:0 auto">
			<div class="hd">
				<a class="next"></a>
				<ul></ul>
				<a class="prev"></a>
				畅销商品 <span class="pageState"></span>
			</div>
			<div class="bd">

				<div class="ulWrap">

						<ul><!-- 把每次滚动的n个li放到1个ul里面 -->
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic1.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图1</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic1.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图1</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic1.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图1</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic1.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图1</a></div>
							</li>
						</ul>

						<ul><!-- 把每次滚动的n个li放到1个ul里面 -->
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic2.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图2</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic2.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图2</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic2.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图2</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic2.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图2</a></div>
							</li>
						</ul>

						<ul><!-- 把每次滚动的n个li放到1个ul里面 -->
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic3.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图3</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic3.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图3</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic3.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图3</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic3.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图3</a></div>
							</li>
						</ul>

						<ul><!-- 把每次滚动的n个li放到1个ul里面 -->
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic4.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图4</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic4.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图4</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic4.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图4</a></div>
							</li>
							<li>
								<div class="pic"><a href="http://www.SuperSlide2.com" target="_blank"><img src="<%=request.getContextPath() %>/resource/js/superSlide/demo/images/pic4.jpg" /></a></div>
								<div class="title"><a href="http://www.SuperSlide2.com" target="_blank">效果图4</a></div>
							</li>
						</ul>

				</div><!-- ulWrap End -->
			</div><!-- bd End -->
		</div><!-- multipleColumn End -->

		<script type="text/javascript">
			/*
				多行/多列的滚动解决思路在于：把每次滚动的n个li放到1个ul里面，然后用SuperSlide每次滚动1个ul，相当于每次滚动n个li
			*/
			jQuery(".multipleColumn").slide({titCell:".hd ul",mainCell:".bd .ulWrap",autoPage:true,effect:"leftLoop",autoPlay:true,vis:3});
		</script>

	<div class="js" style="display: none;">
		<p>多行/多列的滚动解决思路在于：把每次滚动的n个li放到1个ul里面，然后用SuperSlide每次滚动1个ul，相当于每次滚动n个li</p>
		<textarea>本例js调用：jQuery(".multipleColumn").slide({titCell:".hd ul",mainCell:".bd .ulWrap",autoPage:true,effect:"leftLoop",autoPlay:true,vis:3});</textarea>
	</div>

<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/js/superSlide/css/lanrenzhijia.css" type="text/css"> --%>

</body>
</html>
