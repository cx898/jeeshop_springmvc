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
<script type="text/javascript">
	$(function() {

	});
	function deleteSelect() {
		var node = $('#treegrid').treegrid('getSelected');
		if (!node) {
			alert("请选择要删除的类别！");
			return false;
		}
		var project_path = $("#namespace").val();
		try{
			if(confirm("确定删除选择的记录?")){
				$.blockUI({ message: "系统处理中，请等待...",css: { 
			        border: 'none', 
			        padding: '15px', 
			        backgroundColor: '#000', 
			        '-webkit-border-radius': '10px', 
			        '-moz-border-radius': '10px', 
			        opacity: .5, 
			        color: '#fff' 
			    }});
				var _url = project_path+"/manage/catalog/deleteByID.action?id="+node.id;
				$.ajax({
				  type: 'POST',
				  url: _url,
				  data: {},
				  async:false,
				  success: function(data){
					  console.log("ajax.data="+data);
					  if(data){
						  
						var _form = $("#form");
						_form.attr("action",project_path+"/manage/catalog/selectList.action");
						_form.submit();
							
						  //alert("删除成功！");
						  //document.form.action = "catalog!selectList.action";   
					      //document.form.submit();   
					  }
					  jQuery.unblockUI();
				  },
				  dataType: "text",
				  error:function(){
					  	jQuery.unblockUI();
						alert("加载失败，请联系管理员。");
				  }
				});
			}
		}catch(e){
			console.log("eee="+e);
		}
		return false;
	}
	//编辑
	function editSelect(){
		var node = $('#treegrid').treegrid('getSelected');
		if (!node) {
			alert("请选择要编辑的类别！");
			return false;
		}
		//document.form1.action = "catalog!toEdit.action?e.id="+node.id;   
        //document.form1.submit();
        var _url = $("#namespace").val()+"/manage/catalog/toEdit.action?id="+node.id;
        var _form = $("#form");
		_form.attr("action",_url);
		_form.submit();
	}
</script>
</head>

<body>
	<form action="catalog" name="form" id="form" namespace="/manage" method="post" theme="simple">
		<input type="hidden" id="_type" name="type" value="${e.type}" />
		<table class="table table-bordered table-condensed table-hover">
			<tr>
				<td colspan="16">
					<a method="selectList" href="${ctx}/manage/catalog/selectList.action" class="btn btn-primary">
						<i class="icon-search icon-white"></i> 查询
					</a>
					<a method="toAdd" href="${ctx}/manage/catalog/toAdd.action?type=${e.type}"  class="btn btn-success">
						<i class="icon-plus-sign icon-white"></i> 添加
					</a>
					<button class="btn btn-warning" onclick="return editSelect();">
						<i class="icon-edit icon-white"></i> 编辑
					</button>
					<button method="${ctx}/manage/catalog/deletes.action" class="btn btn-danger" onclick="return deleteSelect();">
						<i class="icon-remove-sign icon-white"></i> 删除
					</button>
				</td>
			</tr>
		</table>
	</form>

	<div class="alert alert-info" style="margin-bottom: 2px;">友情提示：商品目录一般分为两层，大类别、小类别。商品目录编码必须唯一。</div>
	<table id="treegrid" title="商品类别目录" class="easyui-treegrid" style="min-width:800px;min-height:250px"
			data-options="
				url: '<%=request.getContextPath() %>/manage/catalog/getRootWithTreegrid.action?type=<c:out value="${e.type}"/>',
				method: 'get',
				rownumbers: true,
				idField: 'id',
				treeField: 'name',
				onClickRow:function(row){
					//alert(row.id);
				}
			">
		<thead>
			<tr>
				<th data-options="field:'id'" nowrap="nowrap">ID</th>
				<th data-options="field:'name'" nowrap="nowrap">类别名称</th>
				<th data-options="field:'order1'" nowrap="nowrap">顺序</th>
				<th data-options="field:'code'" nowrap="nowrap">编码</th>
				<th data-options="field:'showInNavStr'" nowrap="nowrap">是否在导航条显示</th>
					<c:choose>
						<c:when test="${e.type == 'a'}">
						</c:when>
						<c:otherwise>
						  <th data-options="field:'productNum'" nowrap="nowrap" align="right">商品数量</th>
						</c:otherwise>
					</c:choose>
			</tr>
		</thead>
	</table>
	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/jquery-easyui-1.3.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/jquery-easyui-1.3.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/jquery-easyui-1.3.4/demo/demo.css">
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/jquery-easyui-1.3.4/jquery.min.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
</body>
</html>
