<%@page import="net.jeeshop.core.PrivilegeUtil"%>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
.product-name {
	display: inline-block;
	width: 250px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
</style>

</head>

<body>
	<form action="product" namespace="/manage" method="post" theme="simple">
		<input type="hidden" id="catalogID" value="<c:out value="${e.catalogID}" />" />
		<table class="table table-bordered table-condensed">
			<tr>
				<td style="text-align: right;">商品编号</td>
				<td style="text-align: left;"><input type="text" name="id"  id="id"  value="${e.id}" class="search-query input-small"/></td>
				<td style="text-align: right;">状态</td>
				<td style="text-align: left;">
					<select id="status" name="status" class="input-small">
							<option value='0'></option>
							<option value='1' <c:if test='${e.status=="1"}'>selected='selected'</c:if>>新增</option>
							<option value='2' <c:if test='${e.status=="2"}'>selected='selected'</c:if>>已上架</option>
							<option value='3' <c:if test='${e.status=="3"}'>selected='selected'</c:if>>已下架</option>
					</select>	
				</td>
				<td style="text-align: right;">
					商品分类
				</td>
				<td>
					<%
					application.setAttribute("catalogs", SystemManager.catalogs);
					%>
					<select onchange="catalogChange(this)" name="catalogID" id="catalogSelect" class="input-medium">
						<option></option>
						<c:forEach items="${catalogs}" var="cata">
							<option pid="0" value="<c:out value="${cata.id}" />"
							<c:if test='${e.catalogID==cata.id}'>selected='selected'</c:if>
							><font color='red'><c:out value="${cata.name}"/></font></option>
							<c:forEach items="${cata.children}" var="cata_child">
								<option value="<c:out value="${cata_child.id}" />"
								<c:if test='${e.catalogID==cata_child.id}'>selected='selected'</c:if>
								>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cata_child.name}" /></option>
							</c:forEach>
						</c:forEach>
					</select>
				</td>
				<td style="text-align: right;">新品</td>
				<td style="text-align: left;">
					<select id="isnew" name="isnew" class="input-small">
							<option value=''></option>
							<option value='y' <c:if test='${e.isnew=="y"}'>selected='selected'</c:if>>是</option>
							<option value='n' <c:if test='${e.isnew=="n"}'>selected='selected'</c:if>>否</option>
					</select>
				</td>
				<td style="text-align: right;">特价</td>
				<td style="text-align: left;" >
					<select id="sale" name="sale" class="input-small">
							<option value=''></option>
							<option value='y' <c:if test='${e.sale=="y"}'>selected='selected'</c:if>>是</option>
							<option value='n' <c:if test='${e.sale=="n"}'>selected='selected'</c:if>>否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">商品名称</td>
				<td style="text-align: left;">
					<input type="text" id="name" name="name" value="${e.name}" class="input-small" />
				</td>
				<td style="text-align: right;">录入日期</td>
				<td style="text-align: left;" colspan="9">
					<input id="d4311" class="Wdate search-query input-small" type="text" name="startDate"
					value="<c:out value="${e.startDate}" />"
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input id="d4312" class="Wdate search-query input-small" type="text" name="endDate" 
					value="<c:out value="${e.endDate}" />"
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
				</td>
			</tr>
			<tr>
				<td colspan="20">
					<%if(PrivilegeUtil.check(request.getSession(), "product/selectList.action")){%>
						<button method="${ctx}/manage/product/selectList.action" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
					<%} %>
					
					<%if(PrivilegeUtil.check(request.getSession(), "product/toAdd.action")){%>
						<a method="toAdd" href="${ctx}/manage/product/toAdd.action" class="btn btn-success">
							<i class="icon-plus-sign icon-white"></i> 添加
						</a>
					<%} %>
					
					<%if(PrivilegeUtil.check(request.getSession(), "product/deletes.action")){%>
						<button method="${ctx}/manage/product/deletes.action" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
							<i class="icon-remove-sign icon-white"></i> 删除
						</button>
					<%} %>
					
					<%if(PrivilegeUtil.check(request.getSession(), "product/updateUp.action")){%>
						<button method="${ctx}/manage/product/updateUp.action" class="btn btn-warning" onclick="return submitIDs(this,'确定上架选择的记录?');">
							<i class="icon-arrow-up icon-white"></i> 上架
						</button>
					<%} %>
					
					<%if(PrivilegeUtil.check(request.getSession(), "product/updateDown.action")){%>
						<button method="${ctx}/manage/product/!updateDown.action" class="btn btn-warning" onclick="return submitIDs(this,'确定下架选择的记录?');">
							<i class="icon-arrow-down icon-white"></i> 下架
						</button>
					<%} %>
					<a target="_blank" href="<%=SystemManager.systemSetting.getWww()%>/product/selectMemoryStock.html" class="btn btn-info">
					<i class="icon-eye-open icon-white"></i> 内存库存查询</a>
<%-- 					<a href="<%=SystemManager.systemSetting.getWww()%>/freemarker!create.action?method=products" class="btn btn-danger" onclick="javascript:return confirm('此操作将静态化前台所有商品的商品介绍，确定这么做吗？');">所有商品介绍全部静态化</a> --%>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;"> <%@ include file="/manage/system/pager.jsp"%>
					</div>
				</td>
			</tr>
		</table>

		<table class="table table-bordered table-condensed table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">商品编号</th>
				<th>名称</th>
				<th>定价</th>
				<th>现价</th>
				<th>录入日期</th>
				<th>新品</th>
				<th>特价</th>
				<th>浏览次数</th>
				<th>库存</th>
				<th>销量</th>
				<th>状态</th>
				<th width="60">操作</th>
			</tr>
			
			<c:forEach items="${pager.list}" var="product">  
			  <tr>
			   <td><input type="checkbox" name="ids" value="<c:out value="${product.id}"/>" /></td>
					<td nowrap="nowrap">&nbsp;<c:out value="${product.id}" /></td>
					<td >
					    <c:if test="${product.giftID !=null and product.giftID !='' }">【赠品】</c:if>
						<a class="product-name" title="<c:out value="${product.name}" />" 
						href="${ctx}/manage/product/toEdit.action?id=<c:out value="${product.id}" />"><c:out value='${product.name}' /></a>
					</td>
					<td>&nbsp;<c:out value="${product.price}" /></td>
					<td>&nbsp;<c:out value="${product.nowPrice}" /></td>
					<td>&nbsp;<c:out value="${product.createtime}" /></td>
					<td>&nbsp;
					<c:choose>
						<c:when test="${product.isnew == 'n'}">
						   <font color='red'></font>
						</c:when>
						<c:when test="${product.isnew == 'y'}">
						   <img alt="新品" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						</c:when>
						<c:otherwise>
						  
						</c:otherwise>
					</c:choose>
					</td>
					<td>&nbsp;
					<c:choose>
						<c:when test="${product.sale == 'n'}">
						   <font color='red'></font>
						</c:when>
						<c:when test="${product.sale == 'y'}">
						   <img alt="特价" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					</td>
					<td>&nbsp;<c:out value="${product.hit}" /></td>
					<td>&nbsp;
					<c:choose>
						<c:when test="${product.stock > 0 }">
						   <c:out value="${product.stock}" />
						</c:when>
						<c:otherwise>
						  <span class="badge badge-important">库存告急</span>
						</c:otherwise>
					</c:choose>
					</td>
					<td>&nbsp;<c:out value="${product.sellcount}" /></td>
					<td>&nbsp;
						<c:choose>
							<c:when test="${product.status==1}">
							   <img alt="新增" src="<%=request.getContextPath() %>/resource/images/action_add.gif">
							</c:when>
							<c:when test="${product.status==2}">
							   <img alt="已上架" src="<%=request.getContextPath() %>/resource/images/action_check.gif">
							</c:when>
							<c:when test="${product.status==3}">
							   <img alt="已下架" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</td>
					<td ><a href="${ctx}/manage/product/toEdit.action?id=<c:out value="${product.id}" /> ">编辑</a>|
					<a target="_blank" href="<%=SystemManager.systemSetting.getWww()%>/product/<c:out value="${product.id}"/>.html">查看</a>
					</td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="70" style="text-align: center;"><%@ include file="/manage/system/pager.jsp"%></td>
			</tr>
		</table>
		
		<div class="alert alert-info" style="text-align: left;font-size: 14px;margin: 2px 0px;">
			图标含义：<BR>
			<img alt="新增" src="<%=request.getContextPath() %>/resource/images/action_add.gif">：新增商品
			<img alt="已上架" src="<%=request.getContextPath() %>/resource/images/action_check.gif">：商品已上架
			<img alt="已下架" src="<%=request.getContextPath() %>/resource/images/action_delete.gif">：商品已下架
		</div>

	</form>
	
<script type="text/javascript">
	$(function() {
		selectDefaultCatalog();
	});
	function selectDefaultCatalog(){
		var _catalogID = $("#catalogID").val();
		if(_catalogID!='' && _catalogID>0){
			$("#catalogSelect").attr("value",_catalogID);
		}
	}
</script>
</body>
</html>
