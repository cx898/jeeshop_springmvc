<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>

<body style="background-color: #C1DAD7">

<div id="loadImg" style="text-align: center;">
	<img style="margin-top: 20px;" alt="菜单加载中......" src="<%=request.getContextPath() %>/resource/images/loader.gif"><br>资源加载中...
</div>

<div id="loadID" style="display: none;">
	<input type="text" id="key" value="菜单关键字" class="empty" style="width: 100px;"/>
	[<a id="expandOrCollapseAllBtn" href="#" title="展开/折叠全部资源" onclick="return false;">展开/折叠</a>]
	<div style="display: none;">
		属性( key )：<input type="radio" id="name" name="keyType" class="radio first" checked /><span>name (string)</span><br/>
		<input type="radio" id="level" name="keyType" class="radio" style="margin-left:68px;" /><span>level (number) ... 根节点 level = 0</span><br/>
		<input type="radio" id="id" name="keyType" class="radio" style="margin-left:68px;" /><span>id (number)</span><br/>
		方法：<input type="radio" id="getNodeByParam" name="funType" class="radio first" /><span>getNodeByParam</span><br/>
		<input type="radio" id="getNodesByParam" name="funType" class="radio" style="margin-left:36px;" /><span>getNodesByParam</span><br/>
		<input type="radio" id="getNodesByParamFuzzy" name="funType" class="radio" style="margin-left:36px;" checked /><span>getNodesByParamFuzzy (only string)</span><br/>
		<input type="radio" id="getNodesByFilter" name="funType" class="radio" style="margin-left:36px;" /><span>getNodesByFilter (参考本页源码中 function filter)</span><br/>
	</div>
	<ul id="treeDemo" class="ztree"></ul>
</div>

<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/zTree3.1/js/jquery.ztree.all-3.1.min.js"></script>
<SCRIPT type="text/javascript">
(function(){
	var setting = {
			check: {
				enable: false,
				dblClickExpand: false
			},view: {
				fontCss: getFontCss
			},callback: {
				onClick: onClick
			}
	};
	function onClick(e,treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.expandNode(treeNode);
	}
	var key;
	$.ajax({
		url:"<%=request.getContextPath() %>/manage/menu/selectJsonMenu.action",
		type:"post",
		dataType:"text",
		success:function(data, textStatus){
			var zNodes = eval('('+data+')');
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			
			key = $("#key");
			key.bind("focus", focusKey)
			.bind("blur", blurKey)
			.bind("propertychange", searchNode)
			.bind("input", searchNode);
			$("#getNodesByParamFuzzy").bind("change", clickRadio);
			
			$("#loadImg").hide();
			$("#loadID").show();
		},
		error:function(){
			alert("加载菜单失败！");
		}
	});
	
	
	function focusKey(e) {key.val("");
		if (key.hasClass("empty")) {
			key.removeClass("empty");
		}
	}
	function blurKey(e) {
		if(key.val()==''){
			key.val("请输入菜单关键字");
			key.addClass("empty");
		}
		if (key.get(0).value === "") {
			key.addClass("empty");
		}
	}
	var lastValue = "", nodeList = [], fontCss = {};
	function clickRadio(e) {
		lastValue = "";
		searchNode(e);
	}
	function searchNode(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		if (!$("#getNodesByFilter").attr("checked")) {
			var value = $.trim(key.get(0).value);
			var keyType = "";
			if ($("#name").attr("checked")) {
				keyType = "name";
			} else if ($("#level").attr("checked")) {
				keyType = "level";
				value = parseInt(value);
			} else if ($("#id").attr("checked")) {
				keyType = "id";
				value = parseInt(value);
			}
			if (key.hasClass("empty")) {
				value = "";
			}
			if (lastValue === value) return;
			lastValue = value;
			if (value === "") return;
			updateNodes(false);

			if ($("#getNodeByParam").attr("checked")) {
				var node = zTree.getNodeByParam(keyType, value);
				if (node === null) {
					nodeList = [];
				} else {
					nodeList = [node];
				}
			} else if ($("#getNodesByParam").attr("checked")) {
				nodeList = zTree.getNodesByParam(keyType, value);
			} else if ($("#getNodesByParamFuzzy").attr("checked")) {
				nodeList = zTree.getNodesByParamFuzzy(keyType, value);
			}
		} else {
			updateNodes(false);
			nodeList = zTree.getNodesByFilter(filter);
		}
		updateNodes(true);
	}
	
	function updateNodes(highlight) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		for( var i=0, l=nodeList.length; i<l; i++) {
			nodeList[i].highlight = highlight;
			zTree.updateNode(nodeList[i]);
		}
	}
	function getFontCss(treeId, treeNode) {
		return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
	}
	function filter(node) {
		return !node.isParent && node.isFirstNode;
	}
	
	var expandAllFlg = true;
	function expandNode(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
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
})();

</SCRIPT>
</body>
</html>
