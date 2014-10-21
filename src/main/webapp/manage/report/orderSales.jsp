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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
	<table class="table table-bordered">
		<tr>
			<td style="text-align: right;" nowrap="nowrap">日期范围</td>
			<td style="text-align: left;">
				<input id="startDate" class="Wdate search-query input-small" type="text" name="startDate"
					value="<c:out value='${startDate}' />"
					onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM',maxDate:'#F{$dp.$D(\'endDate\')||\'2050-10-01\'}'})"/>
					~ 
				<input id="endDate" class="Wdate search-query input-small" type="text" name="endDate" 
				value="<c:out value='${endDate}' />"
				onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2050-10-01'})"/>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<button class="btn btn-primary" onclick="return loadOrderSales();">
					<i class="icon-search icon-white"></i> 查询
				</button>
			</td>
		</tr>
	</table>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/echarts-1.3.5/echarts-plain-map.js" ></script>
<!--Step:2 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:2 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
<!--     <div id="mainMap" style="height:500px;border:1px solid #ccc;padding:10px;"></div> -->
    
    <script type="text/javascript">
    
    $(function(){
    	
    	//loadOrderSales();
    	
    	//var data2 = "[212.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]";
        //var zNodes = eval('('+data2+')');
        //alert(zNodes[0]);
        
        // Step:3 echarts & zrender as a Global Interface by the echarts-plain.js.
        // Step:3 echarts和zrender被echarts-plain.js写入为全局接口
    	//show(result);
        
        //init date
        initReportQueryDate();
    });
    
  	//初始化报表的查询条件
    function initReportQueryDate(){
    	var date = new Date();
        $("#startDate").val(date.getFullYear()+"-01");
        var m = (date.getMonth() + 1)+"";
        console.log("m="+m+",len="+m.length);
        if(m.length==1){
        	m = "0"+m;
        }
        $("#endDate").val(date.getFullYear()+"-" + m);
    }
  
    //{zNodes:[1,2,3],orderdate:[2013-01,2013-02,2013-03]}
    function loadOrderSales(){
    	$.blockUI({ message: "正在查询，请稍候...",css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
        }});
    	console.log("正在查询，请稍候...");
    	var result = null;
    	var _url = $("#namespace").val()+
    	"/manage/report/selectOrderSales.action?startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val();
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  dataType:"json",
		  //async:false,
		  success: function(data){
			  if(data=="0"){
				  jQuery.unblockUI();
				  alert("查询不到任何数据！");
				  return null;
			  }
			  
			  console.log("data.amountArr="+data.amountArr);
			  console.log("data.amountArr="+data.orderdateArr);
			  
			  var amountArr = [];
			  var orderdateArr = [];
			  var _amountArr = eval('('+data.amountArr+')');
			  var _orderdateArr = eval('('+data.orderdateArr+')');
		      for(var i=0;i<_amountArr.length;i++){
		    	  amountArr.push(_amountArr[i]);
		      }
		      for(var i=0;i<_orderdateArr.length;i++){
		    	  orderdateArr.push(_orderdateArr[i]); 
		      }
			  var obj = {};//{"amountArr":amountArr,"orderdateArr":orderdateArr};
			  obj.amountArr = amountArr;
			  obj.orderdateArr = orderdateArr;
			  console.log("amountArr="+amountArr);
			  console.log("obj.amountArr="+obj.amountArr);
			  result = obj;
			  show(result);
			  
			  jQuery.unblockUI();
			  
			  return obj;
			  //$.each(data,function(i,row){
				  //$("#smallTypeID").append("<option value='"+row.id+"'>"+row.name+"</option>");
			  //});
		  },
		  error:function(){
			  console.log("加载数据失败，请联系管理员。");
			  alert("加载数据失败，请联系管理员。");
			  jQuery.unblockUI();
			return null;
		  }
		});
		return false;
    }
    
    //显示报表
    function show(result){
    	if(!result){
    		console.log("没有数据result.amountArr="+result.amountArr+",result.orderdateArr="+result.orderdateArr);
    		return;
    	}
    	console.log("show数据result.amountArr="+result.amountArr+",result.orderdateArr="+result.orderdateArr);
    	var myChart = echarts.init(document.getElementById('main'));
        myChart.setOption({
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['本月销售总额']
            },
            toolbox: {
                show : false,
                feature : {
                    mark : true,
                    dataView : {readOnly: false},
                    magicType:['line', 'bar'],
                    restore : true,
                    saveAsImage : true
                }
            },
            calculable : false,
            xAxis : [
                {
                    type : 'category',
                    //data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                	data:result.orderdateArr
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    splitArea : {show : true}
                }
            ],
            series : [
                {
                    name:'本月销售总额',
                    type:'bar',
                    //data:[212.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                    data:result.amountArr
                }
            ]
        });
    }
    </script>
</body>
</html>
