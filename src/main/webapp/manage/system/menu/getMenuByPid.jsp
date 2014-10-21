<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/base.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/zTree3.1/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>

<body>
	<ul id="treeDemo2" class="ztree"></ul>

<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/zTree3.1/js/jquery.ztree.all-3.1.min.js"></script>
<SCRIPT type="text/javascript">
	(function(){
		var setting = {
				check: {
					enable: false
				},
				callback: {
					onMouseDown: onMouseDown
				}
		};
		$.ajax({   
			url:"<%=request.getContextPath() %>/manage/menu/getMenusByPid.action?pid=0",
			type:"post",
			dataType:"text",
			success:function(data, textStatus){
				var zNodes = eval('('+data+')');
				$.fn.zTree.init($("#treeDemo2"), setting, zNodes);
			},
			error:function(){
				alert("error");
			}
		});
	})();
	
	function onMouseDown(event, treeId, treeNode) {
		alert(treeId+",treeNode:"+treeNode.id);
	}
</SCRIPT>
</body>
</html>
