/**
 * 后台脚本JS
 */

$(function(){
	//后台查询页面 全选/全不选 功能	jQuery v1.9
	$("#firstCheckbox").on("click",function(){
		console.log("check="+$(this).prop("checked"));
		if($(this).prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
	//为了使用bootstrap2的图标功能，只有牺牲使用struts2的s:submit方式提交表单。
	//这里对s:form表单的action进行重新组装，加上了你点击的按钮的method="update"方法，最后验证通过则提交表单。
	$("form").on('click', 'button', function(e){
	    this.form.buttonMethod = $(this).attr('method');
	});
	//onclick="doSubmitFuncWhenButton(this)"
	
	//通用按钮的提交表单事件
	$("form").on("valid.form", function(e, form){
		console.log(this.isValid);
        console.log("submit..."+form.buttonMethod);
        
        var buttonMethod = form.buttonMethod;
		console.log(buttonMethod);
		var _formAction = $(form).attr("action");
		var aa = _formAction.substring(0,_formAction.lastIndexOf("/")+1);
		console.log(aa);
		
		var lastFormAction = aa+buttonMethod;
		console.log("lastFormAction="+lastFormAction);
		$(form).attr("action",lastFormAction);
		
		console.log($(form).attr("action"));
		
		$.blockUI({ message: "系统处理中，请等待...",css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
        }});
		createMark();
		form.submit();
	});
		
});

//创建遮罩效果
function createMark(){
	$.blockUI({ message: "系统处理中，请等待...",css: { 
        border: 'none', 
        padding: '15px', 
        backgroundColor: '#000', 
        '-webkit-border-radius': '10px', 
        '-moz-border-radius': '10px', 
        opacity: .5, 
        color: '#fff' 
    }});
}

//查询
function selectList(obj){
	console.log("selectList...");
	var _form = $("form");
	_form.attr("action",$(obj).attr("method"));
	_form.submit();
}

//批量删除选择的记录
function submitIDs(obj,tip){
	console.log("submitIDs...");
	if ($("input:checked").size() == 0) {
		alert("请先选择要操作的内容！");
		return false;
	}

	if(confirm(tip)){
		createMark();
		var _form = $("form");
		_form.attr("action",$(obj).attr("method"));
		_form.submit();
	}
	return false;
}

//不需要任何验证的提交    
function submitNotValid2222(obj){
	createMark();
	console.log("submitNotValid2222...");
	var _form = $("form");
	_form.attr("action",$(obj).attr("method"));
	_form.submit();
}
/**
 *  struts a标签的替换js函数
 * @param obj
 * @param msg
 * @param id
 */
function changeStrutsTagForA(obj,msg,id){
	var tmpFlag = true;
	if(msg != null && msg != ''){
		if(!confirm(msg)){
			  tmpFlag = false;
		}
	}
	if(tmpFlag){
		 var action = $(obj).attr("action");
		  var method = $(obj).attr("method");
		  var href = $("#namespace").val()+"/manage/"+action+"/"+method+".action?id="+id
		  alert(href);
		  location.href = $("#namespace").val()+"/manage/"+action+"/"+method+".action?id="+id;
	}
}

//为了使用bootstrap2的图标功能，只有牺牲使用struts2的s:submit方式提交表单。
//这里对s:form表单的action进行重新组装，加上了你点击的按钮的method="update"方法，最后验证通过则提交表单。
function doSubmitFuncWhenButton(obj){
	/*
	$("#form").validator({
		
		valid: function(form){
			var me = this;
	        // ajax提交表单之前，先禁用submit
	        me.holdSubmit();
	        $(form).find('button').css('color', '#999').text('正在提交..');
	        
			this.isAjaxSubmit = false;
			var method = $(obj).attr("method");
			console.log(method);
			var _formAction = $(form).attr("action");
			var aa = _formAction.substring(0,_formAction.lastIndexOf("/")+1);
			console.log(aa);
			
			var lastFormAction = aa+method;//aa +"!" +method+".action";
			console.log("lastFormAction="+lastFormAction);
			$(form).attr("action",lastFormAction);
			
			console.log($(form).attr("action"));
			
			form.submit();
			
			me.holdSubmit(false);
		}
	});
	*/
	
	$("#form").on("valid.form", function(e, form){
		console.log(this.isValid);
		//if(this.isValid && this.isValid==true){
	        console.log("submit...");
		//}
	});
	
	$("#form").on("valid.form", function(e, form){
		console.log(this.isValid);
		if(this.isValid && this.isValid==true){
			
			//var me = this;
	        // ajax提交表单之前，先禁用submit
	        //me.holdSubmit();
	        //$(form).find('button').css('color', '#999').text('正在提交..');
	        console.log("submit...");
			/*
			this.isAjaxSubmit = false;
			var method = $(obj).attr("method");
			console.log(method);
			var _formAction = $(form).attr("action");
			var aa = _formAction.substring(0,_formAction.lastIndexOf("/")+1);
			console.log(aa);
			
			var lastFormAction = aa+method;
			console.log("lastFormAction="+lastFormAction);
			$(form).attr("action",lastFormAction);
			
			console.log($(form).attr("action"));
			
			form.submit();
			*/
			
			//me.holdSubmit(false);
		}
	});
	
}
