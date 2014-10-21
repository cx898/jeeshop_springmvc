/**
 * 商品javascript，对购买商品的一些控制和提示
 * 
 */

//增加购买商品数
function addFunc(obj,notifyCartFlg){
	var _obj = $(obj).parent().find("input[name=inputBuyNum]");
	var quantity = _obj.val();
	//console.log("_obj="+_obj+",notifyCartFlg="+notifyCartFlg+",quantity="+quantity+",pid="+_obj.attr("pid"));
	if (/^\d*[1-9]\d*$/.test(quantity)) {
		_obj.val(parseInt(quantity) + 1);
	} else {
		_obj.val(1);
	}
	if(notifyCartFlg){
		notifyCart(_obj);
	}
}
//减少购买商品数
function subFunc(obj,notifyCartFlg){
	var _obj = $(obj).parent().find("input");
	var quantity = _obj.val();
	if (/^\d*[1-9]\d*$/.test(quantity)) {
		if(quantity>1){
			_obj.val(parseInt(quantity) - 1);
		}else{
			_obj.val(1);
		}
	} else {
		_obj.val(1);
	}
	
	//console.log("notifyCartFlg="+notifyCartFlg);
	if(notifyCartFlg){
		notifyCart(_obj);
	}
}
//判断是否是正整数
function IsNum(s)
{
    if(s!=null){
        var r,re;
        re = /\d*/i; //\d表示数字,*表示匹配多个数字
        r = s.match(re);
        return (r==s)?true:false;
    }
    return false;
}
//键盘按下的时候对字符进行检查，只能是数字
$("input[name=inputBuyNum]").keydown(function(event) {
	var key = event.keyCode ? event.keyCode : event.which;
	//console.log("key="+key+",value="+_obj.val()+"isNaN="+isNaN(_obj.val())+",IsNum="+IsNum(_obj.val()));
	if ((key >= 48 && key <= 57) || key==8) {
	//if (IsNum(_obj.val())) {
		var _obj = $(this);
		console.log(">>>_obj.val()="+_obj.val());
		//库存字符检查
		if($.trim(_obj.val())=='' || parseInt(_obj.val())<=0){
			_obj.val("1");
		}
		checkStockFunc();
		return true;
	} else {
		return false;
	}
});

//键盘抬起来的时候对库存进行检查
$("input[name=inputBuyNum]").keyup(function(event) {
	var key = event.keyCode ? event.keyCode : event.which;
	//console.log("key="+key+",value="+_obj.val()+"isNaN="+isNaN(_obj.val())+",IsNum="+IsNum(_obj.val()));
	if ((key >= 48 && key <= 57) || key==8) {
		var _obj = $(this);
		if($.trim(_obj.val())=='' || parseInt(_obj.val())<=0){
			_obj.val("1");
		}
		checkStockFunc();
		//if($(this).val()>30){
			//$(this).parent().find("a[name=stockErrorTips]").tooltip('show');
			//$('#stockErrorTips').tooltip('show');
		//}else{
			//$(this).parent().find("a[name=stockErrorTips]").tooltip('hide');
			//$('#stockErrorTips').tooltip('hide');
		//}
		
		console.log("val="+_obj.val());
		var _pid = _obj.attr("pid");
		console.log(_obj.val()+",_pid="+_pid);
		if(_pid){
			notifyCart(_obj);
		}
		return true;
	} else {
		return false;
	}
});

//检查库存是否超出数量
function checkStockFunc(){
	console.log($("#stock_span_id").text()+","+$("#inputBuyNum").val());
	if(parseInt($("#inputBuyNum").val())>parseInt($("#stock_span_id").text())){
		//alert("您所填写的商品数量超过库存！");
		$("#exceedSpanError").html("您所填写的商品数量超过库存！");
		$("#exceedDivError").show();
		
		//$('#addProductToCartErrorTips').tooltip('show');
		console.log("购买的商品数量大于库存数！");
		//$('#inputBuyNum').tooltip('show');
		return false;
	}
	$("#exceedSpanError").html("");
	$("#exceedDivError").hide();
	return true;
}

//通知购物车
function notifyCart(_obj){
	//var _url = "cart/notifyCart.html?currentBuyNumber="+_obj.val()+"&productID="+_obj.attr("pid")+"&date="+(new Date().getTime());
	var _url = "cart/notifyCart.html?currentBuyNumber="+_obj.val()+"&productID="+_obj.attr("pid")+"&radom="+Math.random();
	console.log("_url="+_url);
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {},
	  cache:false,
	  success: function(data){
		  console.log("notifyCart.data="+data);
		  //console.log("notifyCart.data="+data+",data.amount="+data.amount+",data.code="+data.code);
		  //console.log("notifyCart.data="+data+",data.amount="+data["amount"]+",data.code="+data["code"]);
		  if(data.code=='notThisProduct'){
			  console.log("notifyCart.data.code=notThisProduct");
			  _obj.parent().find("a[name=stockErrorTips]").attr("data-original-title",data.msg).tooltip('show');
		  }else  if(data.code=='buyMore'){
			  console.log("notifyCart.data.code=buyMore");
			  _obj.parent().find("a[name=stockErrorTips]").attr("data-original-title",data.msg).tooltip('show');
		  }else  if(data.code=='ok'){
			  console.log("notifyCart.data.code=ok");
			  var _tips_obj = _obj.parent().find("a[name=stockErrorTips]");
			  _tips_obj.tooltip('hide');
			  _tips_obj.attr("data-original-title",'');
			  $("#totalPayMonery").text(data.amount);
			  $("#totalExchangeScore").text(data.amountExchangeScore);
			  
			  //console.log("_obj.parent().parent().html()="+_obj.parent().parent().html());
			  //console.log("_obj.parent().html()="+_obj.parent().html());
			  _obj.parent().parent().find("td[total0=total0]").text(data.total0);
		  }
	  },
	  dataType: "json",
	  error:function(er){
		  console.log("notifyCart.er="+er);
		  //$.each(er,function(index,value){
			//  console.log("index="+index+",value="+value);
		  //});
	  }
	});
}

//加入购物车
function addToCart(){
	var _specIdHidden = $("#specIdHidden").val();
	var specJsonStringVal = $("#specJsonString").val();
	//如果规格存在
	console.log("specIdHidden = " + _specIdHidden);
	if(specJsonStringVal && specJsonStringVal.length>0){
		if(!_specIdHidden || _specIdHidden==''){
			$("#addToCartBtn").attr("data-original-title","请选择商品规格！").tooltip('show');
			return;
		}
	}
	
	if(!checkStockFunc()){
		return false;
	}
	var _url = "cart!addToCart.action?productID="+$("#productID").val()+"&buyCount="+$("#inputBuyNum").val()+"&buySpecID="+$("#specIdHidden").val();
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {},
	  success: function(data){
		  console.log("data="+data);
		if(data==0){
			$("#addToCartBtn").attr("data-original-title",data.tips).tooltip('destroy');
			$('#myModal').modal('toggle');
		}else{
			console.log("出现错误。data.tips="+data.tips);
			
			//$("a[name=stockErrorTips]").attr("data-original-title",data.tips).tooltip('show');
			$("#addToCartBtn").attr("data-original-title",data.tips).tooltip('show');
		}
	  },
	  dataType: "json",
	  error:function(e){
		  console.log("加入购物车失败！请联系站点管理员。异常:"+e);
		  $("#addToCartBtn").attr("data-original-title","加入购物车失败！请联系客服寻求解决办法。").tooltip('show');
	  }
	});
}

//最后一次检查库存
function checkStockLastTime(){
	var _url = "cart/checkStockLastTime.html?radom="+Math.random();
	console.log("_url="+_url);
	var result;
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {},
	  async:false,
	  cache:false,
	  success: function(data){
		  console.log("notifyCart.data="+data);
		  
		  if(data=="-1"){
			  console.log("提示用户需要登录！");
			  $("#confirmOrderBtn").attr("data-original-title","需要先登陆，才能提交订单！").tooltip('show');
			  result = false;
			  
		  }else if(data.code=='login'){
			  console.log("notifyCart.data.code=login");
		  }else  if(data.code=='result'){
			  if(!data.list && !data.error){
				 console.log("true");
				 result = true;
			  }else{
				  $.each(data.list,function(index,value){
					  console.log("each>>"+index+","+value);
					  $("a[name=stockErrorTips]").each(function(){
						  console.log("each2>>"+value.id);
						  if($(this).attr("productid")==value.id){
							  $(this).attr("data-original-title",value.tips).tooltip('show');
						  }
					  });
				  });
				  console.log("false");
				  data.error = "按钮错误！";
				  $("#confirmOrderBtn").attr("data-original-title",data.error).tooltip('show');
				  result = false;
			  }
		  }
	  },
	  dataType: "json",
	  error:function(er){
		  console.log("notifyCart.er="+er);
		  result = false;
	  }
	});
	return result;
}