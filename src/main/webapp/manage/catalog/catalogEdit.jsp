<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#title").focus();
		//$('#cc').combotree('setValue', "随遇而安随遇而安随遇而安随遇而安随遇而安");
	});

	function onSubmit() {
		//if($("#pid").val()==''){
			//var t = $('#cc').combotree('tree');	// get the tree object
			//var n = t.tree('getSelected');		// get selected node
			//if(!n || !n.id){
				//alert("请选择父亲类别");
				//return false;
			//}
			//$("#pid").val(n.id);
		//}
		
		if ($.trim($("#name").val()) == "") {
			alert("名称不能为空!");
			$("#title").focus();
			return false;
		}
	}
</script>
</head>

<body>
	<form action="catalog" namespace="/manage" theme="simple" id="form" name="form">
		<input id="catalogID" value="<c:out value="${e.pid}"/>" style="display: none;"/>
		<input id="catalogID_currentID" value="<c:out value="${e.id}"/>" style="display: none;"/>
		<input type="hidden" id="type" name="type"  value="${e.type}"/>
		<table class="table table-bordered" style="width: 95%;margin: auto;">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>编辑分类</strong>
					<c:choose>
						<c:when test="${e.type == 'p'}">
							<span class="badge badge-important">商品分类</span>&nbsp;<strong>
						</c:when>
						<c:otherwise>
						  	<span class="badge badge-success">文章分类</span>&nbsp;<strong>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" name="id" label="id" value="${e.id}"/></td>
			</tr>
				<tr>
				<td style="text-align: right;">大类</td>
				<td style="text-align: left;">
					<%
					request.setAttribute("catalogs", null);
					%>
					<c:choose>
						<c:when test="${e.type!=null and e.type == 'p'}">
						   <%request.setAttribute("catalogs", SystemManager.catalogs);%>
						</c:when>
						<c:when test="${e.type!=null and e.type == 'a'}">
						   <%request.setAttribute("catalogs", SystemManager.catalogsArticle);%>
						</c:when>
						<c:otherwise>
						  	<%
// 								try{
// 									throw new NullPointerException();
// 								}catch{Exception e}{
// 									throws e;
// 								}
							%>
						</c:otherwise>
					</c:choose>
					<select onchange="catalogChange(this)" name="pid" id="catalogSelect">
						<option></option>
						<c:forEach items="${catalogs}" var="cata">
							<option pid="0" value="<c:out value="${cata.id}" />"
							<c:if test='${e.pid==cata.id}'>selected='selected'</c:if>
							><font color='red'><c:out value="${cata.name}"/></font></option>
							<c:forEach items="${cata.children}" var="cata_child">
								<option value="<c:out value="${cata_child.id}" />"
								<c:if test='${e.pid==cata_child.id}'>selected='selected'</c:if>
								>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cata_child.name}" /></option>
							</c:forEach>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">名称</td>
				<td style="text-align: left;">
				<input type="text" name="name" id="name" value="${e.name}" data-rule="名称;required;name;" size="20" maxlength="20" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">编码</td>
				<td style="text-align: left;">
				<input type="text" name="code" id="code" value="${e.code}" 
				data-rule="编码;required;code;length[1~45];remote[${ctx}/manage/catalog/unique.action?id=${e.id}]" size="45" maxlength="45"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">顺序</td>
				<td style="text-align: left;">
				<input type="text" name="order1" id="order1" value="${e.order1}"  data-rule="顺序;required;integer;order1;" size="20" maxlength="20" />
				</td>
			</tr>
			
			<c:if test="${e.type!=null and e.type == 'p' }">
				<tr>
					<td style="text-align: right;">是否在导航条显示</td>
					<td style="text-align: left;">
						<select id="showInNav" name="showInNav">
							<option value='n' <c:if test='${e.showInNav=="n"}'>selected='selected'</c:if>>否</option>
							<option value='y' <c:if test='${e.showInNav=="y"}'>selected='selected'</c:if>>是</option>
						</select>
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" style="text-align: center;">
				<c:choose>		
		  			<c:when test="${e.id=='' or e.id==null}">
					   <button method="${ctx}/manage/catalog/insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</c:when>
					<c:otherwise>
					  <button method="${ctx}/manage/catalog/update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</c:otherwise>	
           		</c:choose>
				</td>
			</tr>
		</table>
	</form>
	
<script type="text/javascript">
$(function(){
	selectDefaultCatalog();
	
	$("#name").blur(function(){
		getCode();
	});
});
function selectDefaultCatalog(){
	var _catalogID = $("#catalogID").val();
	console.log("selectDefaultCatalog._catalogID="+_catalogID);
	//if(_catalogID!='' && _catalogID>0){
		$("#catalogSelect").val(_catalogID);
	//}
}

function catalogChange(obj){
	var _pid = $(obj).find("option:selected").attr("pid");
	console.log("_pid="+_pid);
	if(!(_pid && _pid==0)){
		alert("不能选择子类!");
		selectDefaultCatalog();
		return false;
	}
}

function getCode(){
	var _name = $("#name").val();
	//var _url = "catalog!autoCode.action?e.name="+_name;
	var _url = $("#namespace").val()+"/manage/catalog/autoCode.action";
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {"e.name":_name},
	  dataType:"text",
	  //async:false,
	  success: function(data){
		  if(!data){return null;}
		  console.log("data="+data);
		  $("#code").val(data);
	  },
	  error:function(){
		  console.log("加载数据失败，请联系管理员。");
	  }
	});
}
	
</script>
	
</body>
</html>
