<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/docs.css" type="text/css">

<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/zTree3.1/js/jquery.ztree.all-3.1.min.js"></script>

<SCRIPT type="text/javascript">
	$(function(){
 		$("#add").add("#update").click(function(){
 			art.dialog.open('<%=request.getContextPath()%>/menu/toEdit.action',
 					{title: '个人信息',width:500, height:350,lock:true});	 			
 		});
	});
</SCRIPT>
<SCRIPT type="text/javascript">
		$(function(){
			var setting = {
					check: {
						enable: true,
						dblClickExpand: false
					},view: {
						fontCss: getFontCss
					},callback: {
						onClick: onClick
					}
			};
			function onClick(e,treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
				zTree.expandNode(treeNode);
			}
			
			function getFontCss(treeId, treeNode) {
				return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
			}
			
			loadMenusTree($("#id").val());
			
			//加载菜单树
			function loadMenusTree(id){
				$.ajax({
					url:"<%=request.getContextPath()%>/manage/menu/getMenusByPid.action?pid=0",
					type:"post",
					data:{id:id},
					dataType:"text",
					success:function(data, textStatus){
						var zNodes = eval('('+data+')');
						$.fn.zTree.init($("#treeDemo2"), setting, zNodes);
						
						$("#role_name").focus();
					},
					error:function(){
						alert("error");
					}
				});
			}
			
			//编辑角色
			$("#saveRoleBtn").click(function(){
				var roleName = $("#role_name").val();
				if(roleName==''){
					alert("角色名称不能为空！");
					return;
				}
				//jQuery.blockUI({ message: "处理中，请稍候...", css: {color:'#fff',border:'3px solid #aaa',backgroundColor:'#CC3300'},overlayCSS: { opacity:'0.0' }}); 
				
				$.blockUI({ message: "处理中，请稍候...",css: { 
		            border: 'none', 
		            padding: '15px', 
		            backgroundColor: '#000', 
		            '-webkit-border-radius': '10px', 
		            '-moz-border-radius': '10px', 
		            opacity: .5, 
		            color: '#fff' 
		        } }); 
				
				var ids = "";
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo2");
				var nodes = treeObj.getCheckedNodes(true);
				for(var i=0;i<nodes.length;i++){
					ids+=nodes[i].id+",";
				}
				
				$.ajax({
					url:"<%=request.getContextPath()%>/manage/role/save.action",
				type : "post",
				data : {
					privileges : ids,
					insertOrUpdate : $("#insertOrUpdate").val(),
					id : $("#id").val(),
					roleName : roleName,
					roleDesc : $("#role_desc").val(),
					role_dbPrivilege : $("#role_dbPrivilege").val(),
					status : $("#status").val()
				},
				dataType : "text",
				success : function(data) {
					// 						var zNodes = eval('('+data+')');
					// 						$.fn.zTree.init($("#treeDemo2"), setting, zNodes);
					if (data == 1) {
						// 							loadMenusTree();
						jQuery.unblockUI();
						alert("修改角色成功！");
						// 						document.form1.submit();
					} else {
						jQuery.unblockUI();
						alert("修改角色失败！");
					}
				},
				error : function() {
					jQuery.unblockUI();
					alert("修改角色失败！");
				}

			});
			return false;
		});

			$("#expandOrCollapseAllBtn").bind("click", {
			type : "expandOrCollapse"
		}, expandNode);
		$("#checkAllTrueOrFalse").bind("click", {
			type : "checkAllTrueOrFalse"
		}, expandNode);
	});

	var expandAllFlg = true;
	var checkAllTrueOrFalseFlg = true;
	function expandNode(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo2"), type = e.data.type, nodes = zTree
				.getSelectedNodes();

		if (type == "expandAll") {
			zTree.expandAll(true);
		} else if (type == "collapseAll") {
			zTree.expandAll(false);
		} else if (type == "expandOrCollapse") {
			zTree.expandAll(expandAllFlg);
			expandAllFlg = !expandAllFlg;
		} else if (type == "checkAllTrueOrFalse") {
			zTree.checkAllNodes(checkAllTrueOrFalseFlg);
			checkAllTrueOrFalseFlg = !checkAllTrueOrFalseFlg;
		} else {
			if (type.indexOf("All") < 0 && nodes.length == 0) {
				alert("请先选择一个父节点");
			}
			var callbackFlag = $("#callbackTrigger").attr("checked");
			for (var i = 0, l = nodes.length; i < l; i++) {
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
</SCRIPT>
</head>

<body>
	<form action="role" name="form1" theme="simple">
		<input id="insertOrUpdate" type="hidden" value='<s:property value="${role.insertOrUpdate }"/>' />

		<table class="table table-bordered"
			style="width: 500px; margin: auto;">
			<tr>
				<td colspan="2"
					style="background-color: #dff0d8; text-align: center;"><strong>角色编辑</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<th>id</th>
				<td><input type="hidden" name="id" id="id" value="${e.id}" />${e.id}</td>
			</tr>
			<tr>
				<th style="background-color: #dff0d8; text-align: center;">角色名称</th>
				<td style="text-align: left;">					
					<c:choose>
						<c:when test="${e.id==null}">
						   <input type="text" name="role_name" id="role_name" value="${e.role_name}" />
						</c:when>
						<c:otherwise>
						  <input type="text" name="role_name" id="role_name" readonly="readonly" value="${e.role_name}"/>
						</c:otherwise>
					</c:choose>
					</td>
			</tr>
			<tr>
				<th style="background-color: #dff0d8; text-align: center;">角色描述</th>
				<td style="text-align: left;"><input type="text" name="role_desc" id="role_desc" value="${e.role_desc}"/> </td>
			</tr>
			<tr>
				<th style="background-color: #dff0d8; text-align: center;">数据库权限</th>
				<td style="text-align: left;">
				
				<select id="role_dbPrivilege" name="role_dbPrivilege" class="input-small">
							<option value='select'
								<c:if test='${e.role_dbPrivilege=="select"}'>selected='selected'</c:if>>select</option>
							<option value='select,insert'
								<c:if test='${e.role_dbPrivilege=="select,insert"}'>selected='selected'</c:if>>select,insert</option>
							<option value='select,insert,update'
							<c:if test='${e.role_dbPrivilege=="select,insert,update"}'>selected='selected'</c:if>>select,insert,update</option>
							<option value='select,insert,update,delete'
							<c:if test='${e.role_dbPrivilege=="select,insert,update,delete"}'>selected='selected'</c:if>>select,insert,update,delete</option>
					</select>
						</td>
			</tr>
			<tr>
				<th style="background-color: #dff0d8; text-align: center;">状态</th>
				<td style="text-align: left;">
				<select id="status" name="status" class="input-small">
							<option value=''></option>
							<option value='y'
								<c:if test='${e.status=="y"}'>selected='selected'</c:if>>启用</option>
							<option value='n'
								<c:if test='${e.status=="n"}'>selected='selected'</c:if>>禁用</option>
					</select>
						</td>
			</tr>
			<tr>
				<th style="background-color: #dff0d8; text-align: center;">角色权限</th>
				<td>
					<div id="optionDiv">
						[<a id="expandOrCollapseAllBtn" href="#" title="展开/折叠全部资源"
							onclick="return false;">展开/折叠</a>] [<a id="checkAllTrueOrFalse"
							href="#" title="全选/全不选" onclick="return false;">全选/全不选</a>]
					</div>
					<ul id="treeDemo2" class="ztree"></ul>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
				<button method="${ctx}/manage/role/save.action"
								class="btn btn-primary" id="saveRoleBtn">
								<i class="icon-ok icon-white"></i> 保存
							</button>
						</td>
			</tr>
		</table>
	</form>
</body>
</html>
