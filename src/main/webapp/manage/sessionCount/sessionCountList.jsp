<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>   
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/Chart.js"></script> --%>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/RGraph2_2013-08-01-stable/libraries/RGraph.common.core.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/RGraph2_2013-08-01-stable/libraries/RGraph.common.effects.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/RGraph2_2013-08-01-stable/libraries/RGraph.common.key.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/RGraph2_2013-08-01-stable/libraries/RGraph.bar.js" ></script>
<!--[if lt IE 9]><script src="../excanvas/excanvas.js"></script><![endif]-->
<script src="<%=request.getContextPath()%>/resource/RGraph2_2013-08-01-stable/libraries/jquery.min.js" ></script>
    
<script type="text/javascript">
	$(function() {
		/*
		var data = {
				labels : ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
				datasets : [
					{
						fillColor : "rgba(220,120,220,0.5)",
						strokeColor : "rgba(220,120,120,5)",
						data : [0,0,5,12,19,2,0,0,1,9,199]
					}
				]
			}
		var ctx = document.getElementById("bar").getContext("2d");
		var myNewChart = new Chart(ctx).Bar(data,{});
		*/
		
		$.getJSON("<%=request.getContextPath()%>/manage/sessionCount!getChartData.action",function(result){
		    
			var bar = new RGraph.Bar('bar', result)
	        // .Set('background.image', '../images/bg.png')
	         .Set('background.grid', true)
	         .Set('labels', ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"])
	         //.Set('key', ['Sunshine in 2000', 'Sunshine in 2005'])
	         .Set('key.position.gutter.boxed', false)
	         .Set('key.position', 'gutter')
	         .Set('key.background', 'rgb(255,255,255)')
	         .Set('colors', ['blue', 'red'])
	         .Set('shadow', true)
	         .Set('shadow.blur', 15)
	         .Set('shadow.offsetx', 0)
	         .Set('shadow.offsety', 0)
	         .Set('shadow.color', '#aaa')
	         .Set('strokestyle', 'rgba(0,0,0,0)')
	         .Set('gutter.left', 55)
	         .Set('gutter.right', 5)
	         .Set('hmargin.grouped', 1);//bar.Draw();
				/*
			if($.support["msie"]) {alert(1);bar.Draw();
			}else{alert(2);
			RGraph.Effects.Bar.Grow(bar, {'duration': 100, 'frames': 5});
			}*/
			RGraph.Effects.Bar.Grow(bar, {'duration': 100, 'frames': 5});
		});
		

	});
</script>
</head>

<body style="font-size: 12px;">
	<s:form action="sessionCount" namespace="/manage" method="post" theme="simple">
		<div style="text-align: center; border: 0px solid red; margin: auto;">
			<div
				style="text-align: right; border: 0px solid red; margin: auto; padding: 10px;">
				<table class="table table-bordered">
					<tr>
						<td colspan="6"><s:submit method="selectList" value="查询"
								class="btn btn-primary" /></td>
					</tr>
				</table>
				<table id="result_table" class="table table-bordered" style="display: none;">
					<tr style="background-color: #dff0d8">
						<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
						<th style="display: none;">编号</th>
						<th >ip</th>
						<th >address</th>
						<th >starttime</th>
					</tr>
					<s:iterator value="pager.list">
						<tr>
							<td><input type="checkbox" name="ids"
								value="<s:property value="id"/>" /></td>
							<td style="display: none;">&nbsp;<s:property value="id" /></td>
							<td>&nbsp;<s:property value="ip" /></td>
							<td>&nbsp;<s:property value="address" /></td>
							<td>&nbsp;<s:property value="starttime" /></td>
						</tr>
					</s:iterator>

					<tr>
						<td colspan="7" style="text-align: center;"><%@ include
								file="/manage/system/pager.jsp"%></td>
					</tr>
				</table>


			</div>
		</div>


	<div class="container">
		<div class="row">
			<div class="span12" style="border: 0px solid red;">
				<div class="row"></div>
					2013年按月统计：<br>
					<canvas id="bar" data-type="Bar" width="600" height="400" style="width: 600px; height: 400px;">[浏览器不支持HTML5，所以图表无法显示，请使用360极速、火狐、google等浏览器(非IE系列的)]</canvas>
			</div>
		</div>
	</div>
	</s:form>
</body>
</html>
