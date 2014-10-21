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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/echarts-1.3.5/echarts-plain-map.js" ></script>
</head>

<body>

<!--Step:2 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:2 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
<!--     <div id="mainMap" style="height:500px;border:1px solid #ccc;padding:10px;"></div> -->
    
    <script type="text/javascript">
    // Step:3 echarts & zrender as a Global Interface by the echarts-plain.js.
    // Step:3 echarts和zrender被echarts-plain.js写入为全局接口
    var myChart = echarts.init(document.getElementById('main'));
    
    option = {
    	    title : {
    	        text: '某站点用户访问来源',
    	        subtext: '纯属虚构',
    	        x:'center'
    	    },
    	    tooltip : {
    	        trigger: 'item',
    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
    	    },
    	    legend: {
    	        orient : 'vertical',
    	        x : 'left',
    	        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
    	    },
    	    toolbox: {
    	        show : true,
    	        feature : {
    	            mark : true,
    	            dataView : {readOnly: false},
    	            restore : true,
    	            saveAsImage : true
    	        }
    	    },
    	    calculable : true,
    	    series : [
    	        {
    	            name:'访问来源',
    	            type:'pie',
    	            radius : '55%',
    	            center: ['50%', 225],
    	            data:[
    	                {value:335, name:'直接访问'},
    	                {value:310, name:'邮件营销'},
    	                {value:234, name:'联盟广告'},
    	                {value:135, name:'视频广告'},
    	                {value:1548, name:'搜索引擎'}
    	            ]
    	        }
    	    ]
    	};
    	                    
    
    myChart.setOption(option);
                    
            
    </script>
</body>
</html>
