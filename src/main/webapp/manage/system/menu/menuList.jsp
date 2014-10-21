<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>	
<SCRIPT type="text/javascript">
	$(function(){
 		$("#add").add("#update").click(function(){
 			art.dialog.open('<%=request.getContextPath() %>/menu/toEdit.action',
 					{title: '个人信息',width:500, height:350,lock:true});
 		});
	});
	//-->
</SCRIPT>
	
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>

<body>
<form action="" name="form1" style="display: none;">
<input type="hidden" name="id" id="dfsfsf">
</form>


<table class="table table-bordered" >
	<tr class="warning">
		<td colspan="2">
			<div>
				<font color="red">在父菜单下的所有子菜单全部勾选的情况下，是否级联删除父菜单：<input type="checkbox" id="deleteParent"></font><br>
				提示：点击菜单项，此处则能编辑该菜单项或增加顶级菜单或子菜单项。<br> 
				<input type="button" id="deleteMenus" value="删除选择的菜单" class="btn btn-danger"/>
				<font color="red">(默认只删除叶子菜单)</font>
				[<a id="expandOrCollapseAllBtn" href="#" title="展开/折叠全部资源" onclick="return false;">展开/折叠</a>]
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div style="min-width: 200px;">
				<div id="loadImg" style="text-align: center;">
					<img alt="菜单加载中......" src="<%=request.getContextPath() %>/resource/images/loader.gif">资源加载中...
				</div>			
				<ul id="treeDemo2" style="display: none;" class="ztree"></ul>
			</div>
		</td>
		<td>
			<iframe src="" width="600" id="iframeMenuEdit" height="800">
				点击菜单项，此处则能编辑该菜单项或增加顶级菜单或子菜单项。
			</iframe>
		</td>
	</tr>
</table>

<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/zTree3.1/js/jquery.ztree.all-3.1.min.js"></script>
<SCRIPT type="text/javascript">
$(function(){
var setting = {
		check: {
			enable: true,
			dblClickExpand: false
		},callback: {
			onClick: onClick,
			onMouseDown: onMouseDown
		}
};
function onClick(e,treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
	zTree.expandNode(treeNode);
}

loadMenusTree();

//加载菜单树
function loadMenusTree(){
	$.ajax({
		url:"<%=request.getContextPath() %>/manage/menu/getMenusByPid.action?pid=0",
					type:"post",
					dataType:"text",
					success:function(data, textStatus){
						var zNodes = eval('('+data+')');
						
						$.fn.zTree.init($("#treeDemo2"), setting, zNodes);
						$("#loadImg").hide();
						$("#treeDemo2").show();
					},
					error:function(){
						alert("error");
					}
				});
			}
			
			//点击菜单项
			function onMouseDown(event, treeId, treeNode) {
				var url = "<%=request.getContextPath() %>/manage/menu/toAddOrUpdate.action?id="+treeNode.id;
				
				if(true){
					$("#iframeMenuEdit").attr("src",url);
					return;
				}
				//alert(url);
				$("#dfsfsf").val(treeNode.id);
				document.form1.action = url;
				document.form1.submit();
			}
			
			//删除菜单
			$("#deleteMenus").click(function(){
				
				if(!confirm("确定删除选择的菜单项?")){
					return false;
				}
				var ids = "";
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
				var nodes = treeObj.getCheckedNodes(true);
				if(nodes.length==0){
					return false;
				}
				for(var i=0;i<nodes.length;i++){
					ids+=nodes[i].id+",";
				}
				
				$.ajax({
					url:"<%=request.getContextPath() %>/manage/menu/delete.action",
					type:"post",
					data:{ids:ids,deleteParent:$("#deleteParent").attr("checked")?"1":"-1"},
					dataType:"text",
					success:function(data){
						if(data==1){
							loadMenusTree();
						}else{
							alert("删除菜单失败！");
						}
					},
					error:function(){
						alert("删除菜单失败！");
					}
				});
			});
			
			
			var expandAllFlg = true;
			function expandNode(e) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2"),
				type = e.data.type,
				nodes = zTree.getSelectedNodes();

				if (type == "expandAll") {
					zTree.expandAll(true);
				} else if (type == "collapseAll") {
					zTree.expandAll(false);
				} else if (type == "expandOrCollapse") {
					zTree.expandAll(expandAllFlg);
					expandAllFlg = !expandAllFlg;
				} else {
					if (type.indexOf("All")<0 && nodes.length == 0) {
						alert("请先选择一个父节点");
					}
					var callbackFlag = $("#callbackTrigger").attr("checked");
					for (var i=0, l=nodes.length; i<l; i++) {
						zTree.setting.view.fontCss = {};
						if (type == "expand") {
							zTree.expandNode(nodes[i], true, null, null, callbackFlag);
						} else if (type == "collapse") {
							zTree.expandNode(nodes[i], false, null, null, callbackFlag);
						} else if (type == "toggle") {
							zTree.expandNode(nodes[i], null, null, null, callbackFlag);
						} else if (type == "expandSon") {
							zTree.expandNode(nodes[i], true, true, null, callbackFlag);
						} else if (type == "collapseSon") {
							zTree.expandNode(nodes[i], false, true, null, callbackFlag);
						}
					}
				}
			}
			$("#expandOrCollapseAllBtn").bind("click", {type:"expandOrCollapse"}, expandNode);
		});
</SCRIPT>
</body>
</html>
