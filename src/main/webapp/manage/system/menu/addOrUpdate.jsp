<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>	
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/zTree3.1/js/jquery.ztree.all-3.1.min.js"></script>
	
	<SCRIPT type="text/javascript">
		$(function(){
			
	 		//$("#add").add("#update").click(function(){
	 			//art.dialog.open('<%=request.getContextPath() %>/menu/toEdit.action',
	 				//	{title: '个人信息',width:500, height:350,lock:true});	 			
	 			//art.dialog.load('./ajaxContent/login.html', false);
	 			//art.dialog.open('', {title: '提示'});
	 		//});
	 		$("#input_menu_name").focus();
	 		
	 		$('input:radio[name="parentOrChildRadio"]').click(function(){
	 			var parentOrChild =$(this).val();//子菜单还是根节点
	 			if(parentOrChild==0 || parentOrChild==1){
	 				//添加顶级菜单
	 				$("#result_table1").hide();
	 			}else{
	 				$("#result_table1").show();
	 			}
	 		});
	 		
	 		//添加子菜单/修改父菜单
	 		$("#add").click(function(){
	 			var id = $("#input_menu_id").val();
	 			var name = $("#input_menu_name").val();
	 			var url = $("#input_menu_url").val();
	 			var orderNum = $("#input_menu_orderNum").val();
	 			var type = $("#input_menu_type").val();
	 			
	 			var n_name = $("#input_new_menu_name").val();
	 			var n_url = $("#input_new_menu_url").val();
	 			var parentOrChild =$('input:radio[name="parentOrChildRadio"]:checked').val();//子菜单还是根节点
	 			var n_orderNum = $("#input_new_menu_level").val();
	 			var n_type = $("#input_new_menu_type").val();
	 			
	 			$.ajax({
					url:"<%=request.getContextPath() %>/manage/menu/addOrUpdate.action",
					type:"post",
					data:{
						updateP:2,//-1不修改父菜单，1修改
						//父菜单信息
						id:id,
						name:name,
						url:url,
						orderNum:orderNum,
						type:type,
						
						//子菜单信息
						n_name:n_name,
						n_url:n_url,
						parentOrChild:parentOrChild,
						n_orderNum:n_orderNum,
						n_type:n_type
					},
					dataType:"text",
					success:function(data, textStatus){
						$("#showMsgDiv").html("修改资源菜单成功!");
						setTimeout(function(){$("#showMsgDiv").html("");},2000);
					},
					error:function(){
						alert("修改资源菜单失败!");
					}
				});
	 		});
	 		
		});
		//-->
	</SCRIPT>
</head>

<body style="text-align: center;">
<form action="menu" name="form1" namespace="/manage" theme="simple">
<div id="contians_div" style="text-align: right; border: 0px solid red; margin: auto;">
			<div id="context_div" style="margin-top: 20px;">
			
			<div id="showMsgDiv" style="text-align: center;"></div>
	<table id="result_table1" class="table table-bordered" style="width: 500px;margin: auto;margin-top: 20px;">
	<tr>
			<td colspan="2" style="background-color: #dff0d8;text-align: center;">
				<strong>当前选中的菜单</strong>
			</td>
		</tr>
		<tr style="display: none;">
			<td>id</td>
			<td>
				<input id="input_menu_id" readonly="readonly" value='${menu.id}'/>
			</td>
		</tr>
		<tr style="display: none;">
			<td>pid</td>
			<td>
				<input id="input_menu_pid" readonly="readonly" value='${menu.pid}'/>
			</td>
		</tr>
		<tr>
			<th>名称</th>
			<td style="text-align: left;">
				<input id="input_menu_name" size="60" value="${menu.name}" />
			</td>
		</tr>
		<tr>
			<th>url</th>
			<td style="text-align: left;">
				<input id="input_menu_url" size="80" value="${menu.url}" />
			</td>
		</tr>
		<tr>
			<th>类型</th>
			<td style="text-align: left;">
				 
				 <select id="input_menu_type" name="menu.type" class="input-medium">
							<option value=''>--请选择--</option>
							<option value='module'
								<c:if test='${menu.type=="module"}'>selected='selected'</c:if>>模块</option>
							<option value='page'
								<c:if test='${menu.type=="page"}'>selected='selected'</c:if>>页面</option>
							<option value='button'
								<c:if test='${menu.type=="button"}'>selected='selected'</c:if>>按钮</option>
					</select>
				 
			</td>
		</tr>
		<tr>
			<th>顺序</th>
			<td style="text-align: left;">
				<input id="input_menu_orderNum" value='${menu.orderNum}'/>
				(菜单顺序从1开始，小的显示在前面)
			</td>
		</tr>
		</table>
		<!-- item -->
		
		<table id="result_table2" class="table table-bordered" style="width: 500px;margin: auto;margin-top: 20px;">
		<tr>
			<td colspan="2" style="background-color: #dff0d8;text-align: center;">
				<strong>添加菜单</strong>
				顶级模块<input type="radio" name="parentOrChildRadio" value="0"/>
				顶级页面<input type="radio" name="parentOrChildRadio" value="1"/>
				子模块<input type="radio" name="parentOrChildRadio" value="2"/>
				子页面<input type="radio" name="parentOrChildRadio" value="3"/>
				功能<input type="radio" name="parentOrChildRadio" value="4" checked="checked"/>
			</td>
		</tr>
		<tr style="display: none;">
			<td>id</td>
			<td>
				<input id="input_new_menu_id" readonly="readonly"/>
			</td>
		</tr>
		<tr style="display: none;">
			<td>pid</td>
			<td>
				<input id="input_new_menu_pid" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>名称</th>
			<td style="text-align: left;">
				<input id="input_new_menu_name" size="60" />
			</td>
		</tr>
		<tr>
			<th>url</th>
			<td style="text-align: left;">
				<input id="input_new_menu_url" size="80"/>
			</td>
		</tr>
		<tr>
			<th>类型</th>
			<td style="text-align: left;">
				<select id="input_new_menu_type">
					<option value="">--请选择--</option>
					<option value="module">模块</option>
					<option value="page">页面</option>
					<option value="button">功能</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>顺序</th>
			<td style="text-align: left;">
				<input id="input_new_menu_level"/>(菜单顺序从1开始，小的显示在前面)
			</td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="2">
				<input type="button" id="add" value="修改或添加" class="btn btn-primary"/>
			</td>
		</tr>
	</table>
</div></div>
</form>
</body>
</html>
