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
					onFocus="WdatePicker({dateFmt:'yyyy-MM',maxDate:'#F{$dp.$D(\'endDate\')||\'2020-10-01\'}'})"/>
					~ 
				<input id="endDate" class="Wdate search-query input-small" type="text" name="endDate" 
				value="<c:out value='${endDate}' />"
				onFocus="WdatePicker({dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2020-10-01'})"/>
			</td>
		</tr>
		<tr>
			<td colspan="8">
<%-- 				<s:submit method="productSales" value="查询" class="btn btn-primary"/> --%>
				<button class="btn btn-primary" onclick="return loadProductSales();">
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
    function loadProductSales(){
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
    	
    	var _url = $("#namespace").val()+"/manage/report/selectProductSales.action?startDate="
    			+$("#startDate").val()+"&endDate="+$("#endDate").val();
    	console.log("_url="+_url);
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
			  console.log("data.productSellCountArr="+data.productSellCountArr);
			  console.log("data.productNameArr="+data.productNameArr);
			  
			  var productSellCountArr = [];
			  var productNameArr = [];
			  var _productSellCountArr = eval('('+data.productSellCountArr+')');
			  var _productNameArr = eval('('+data.productNameArr+')');
		      for(var i=0;i<_productSellCountArr.length;i++){
		    	  productSellCountArr.push(_productSellCountArr[i]);
		      }
		      for(var i=0;i<_productNameArr.length;i++){
		    	  productNameArr.push(_productNameArr[i]); 
		      }
			  var obj = {};//{"amountArr":amountArr,"orderdateArr":orderdateArr};
			  obj.productNameArr = productNameArr;
			  obj.productSellCountArr = productSellCountArr;
			  //console.log("amountArr="+amountArr);
			  //console.log("obj.amountArr="+obj.amountArr);
			  //result = obj;
			  show(obj);
			  
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
    
    function show(result){
    	if(!result){
    		console.log("没有数据");
    		return;
    	}
    	console.log("show数据result.productNameArr="+result.productNameArr+",result.productSellCountArr="+result.productSellCountArr);
    	var myChart = echarts.init(document.getElementById('main'));
        myChart.setOption({
            title : {
                text: '商品销售统计',
                subtext: '商品销售统计排行榜'
            },
            tooltip : {
                trigger: 'axis'
            },
            //legend: {
              //  data:['2011年', '2012年']
            //},
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
                    type : 'value',
                    boundaryGap : [0, 0.01]
                }
            ],
            yAxis : [
                {
                    type : 'category',
                   	//data : ['<a href=\"http://www.baidu.com\">巴西</a>','印尼','美国','印度','中国','世界人口(万)']
                    data:result.productNameArr
                }
            ],
            series : [
                {
                    name:'销量',
                    type:'bar',
                    //data:[18203, 23489, 29034, 104970, 131744, 630230]
                	data:result.productSellCountArr
                }
            ]
        });
    }
    </script>
</body>
</html>
