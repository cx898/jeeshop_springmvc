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
	 			var id = $("#input_parent_id").val();
	 			var code = $("#input_parent_code").val();
	 			var pcode = $("#input_parent_pcode").val();
	 			var name = $("#input_parent_name").val();
	 			
	 			var children_code = $("#input_children_code").val();
	 			var children_pcode = $("#input_children_pcode").val();
	 			var children_name = $("#input_children_name").val();
	 			var children_type = $("#input_children_type").val();
	 			
	 			if(name==''){
	 				alert("名称不能为空！");
	 				$("#input_parent_name").focus();
	 				return false;
	 			}else if(children_name==''){
	 				alert("名称不能为空！");
	 				$("#input_children_name").focus();
	 				return false;
	 			}else if(children_code==''){
	 				alert("code不能为空！");
	 				$("#input_children_code").focus();
	 				return false;
	 			}
	 			
	 			$.ajax({
					url:"<%=request.getContextPath() %>/manage/area/doAddOrUpdate.action",
					type:"post",
					data:{
						//父菜单信息
						id:id,
						code:code,
						pcode:pcode,
						name:name,
						
						//子菜单信息
						children_code:children_code,
						children_pcode:children_pcode,
						children_name:children_name,
						children_type:children_type
					},
					dataType:"text",
					success:function(data, textStatus){
						if(data=='0'){
							$("#showMsgDiv").html("操作成功!");
						}else if(data=="-1"){
							$("#showMsgDiv").html("非法请求!");
						}else{
							$("#showMsgDiv").html("操作失败!");
						}
						
						setTimeout(function(){$("#showMsgDiv").html("");},2000);
					},
					error:function(){
						alert("修改资源菜单失败!");
					}
				});
	 		});
	 		
		});
		//-->
		
		function changeType(){
			var _type = $("#input_area_type").val();
			console.log(_type);
			if(_type=='top'){console.log("is here");
				$("#children_pcode").attr("disabled","disabled").val("0");
			}else{
				$("#children_pcode").attr("disabled",false).val($("#input_parent_code").val());
			}
			
		}
	</SCRIPT>
</head>

<body style="text-align: center;">
<form action="menu" name="form1" namespace="/manage" theme="simple">
		<div id="showMsgDiv" style="text-align: center;"></div>
		<table id="result_table1" class="table table-bordered" style="width: 500px;margin: auto;margin-top: 20px;">
			<tr>
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>选中的项</strong>
				</td>
			</tr>
			<tr>
				<td>id</td>
				<td>
					<input id="input_parent_id" readonly="readonly" value="${e.id}"/>
				</td>
			</tr>
			<tr>
				<td>code</td>
				<td>
					<input id="input_parent_code" readonly="readonly"  value="${e.code}" />
				</td>
			</tr>
			<tr>
				<th>pcode</th>
				<td style="text-align: left;">
					<input id="input_parent_pcode" readonly="readonly" value="${e.pcode}" />
				</td>
			</tr>
			<tr>
				<th>名称</th>
				<td style="text-align: left;">
					<input id="input_parent_name" size="80" value="${e.name}" />
				</td>
			</tr>
		</table>
		<!-- item -->
			
		<table class="table table-bordered" style="width: 500px;margin: auto;margin-top: 20px;">
			<tr>
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>子项</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td>
					<input id="input_children_id" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>类型</th>
				<td style="text-align: left;">
					 <select id="input_children_type" name="type" class="input-medium" onchange="changeType()">
							<option value=''></option>
							<option value='children'
<%-- 								<c:if test='${e.type=="children"}'>selected='selected'</c:if> --%>
								>子项</option>
							<option value='top'
<%-- 								<c:if test='${e.type=="top"}'>selected='selected'</c:if> --%>
								>顶级</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>children_pcode</td>
				<td>
					<input id="input_children_pcode" readonly="readonly" value="${e.code}"/>
				</td>
			</tr>
			<tr>
				<td>code</td>
				<td>
					<input id="input_children_code" />
				</td>
			</tr>
			<tr>
				<th>名称</th>
				<td style="text-align: left;">
					<input id="input_children_name" size="60" />
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<input type="button" id="add" value="修改或添加" class="btn btn-primary"/>
				</td>
			</tr>
		</table>
</form>
</body>
</html>
