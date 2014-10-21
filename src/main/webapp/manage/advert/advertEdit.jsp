<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
.btnCCC{
	background-image: url("../img/glyphicons-halflings-white.png");
	background-position: -288px 0;
}
</style>
</head>

<body>
<div class="navbar navbar-inverse" >
	<div id="insertOrUpdateMsg">
		<c:out value="${insertOrUpdateMsg}"/>
		<%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
	</div>
</div>
	
<form action="advert" namespace="/manage" theme="simple" name="form1">
			<table class="table table-bordered" style="width: 95%;margin: auto;">
				<tr>
					<td colspan="2" style="text-align: center;" >
					<c:choose>		
			  			<c:when test="${e.id=='' or e.id==null}">
						   <button method="${ctx}/manage/advert/insert.action" class="btn btn-success">
								<i class="icon-ok icon-white"></i> 新增
							</button>
						</c:when>
						<c:otherwise>
						  <button method="${ctx}/manage/advert/update.action" class="btn btn-success">
								<i class="icon-ok icon-white"></i> 保存
							</button>
						</c:otherwise>	
            		</c:choose>
            		</td>
				</tr>
				<tr style="background-color: #dff0d8">
					<td colspan="2" style="background-color: #dff0d8;text-align: center;">
						<strong>广告内容编辑 </strong>
					</td>
				</tr>
				<tr style="display: none;">
					<td>id</td>
					<td><input type="hidden" name="id" label="id" value="${e.id}"/></td>
				</tr>
				<tr>
					<td style="text-align: right;">类型</td>
					<td style="text-align: left;">
					<select id="style" name="code" class="input-medium">
						<option value='index_top' <c:if test='${e.code=="index_top"}'>selected='selected'</c:if>>index_top</option>
						<option value='index_right_top' <c:if test='${e.code=="index_right_top"}'>selected='selected'</c:if>>index_right_top</option>
						<option value='index_right_bottom' <c:if test='${e.code=="index_right_bottom"}'>selected='selected'</c:if>>index_right_bottom</option>
						<option value='newslist_right_top' <c:if test='${e.code=="newslist_right_top"}'>selected='selected'</c:if>>newslist_right_top</option>
						<option value='newslist_right_bottom' <c:if test='${e.code=="newslist_right_bottom"}'>selected='selected'</c:if>>newslist_right_bottom</option>
						<option value='flashlist_right_top' <c:if test='${e.code=="flashlist_right_top"}'>selected='selected'</c:if>>flashlist_right_top</option>
						<option value='flashlist_right_bottom' <c:if test='${e.code=="flashlist_right_bottom"}'>selected='selected'</c:if>>flashlist_right_bottom</option>
						<option value='advert_login_page' <c:if test='${e.code=="advert_login_page"}'>selected='selected'</c:if>>advert_login_page</option>
						<option value='advert_register_page' <c:if test='${e.code=="advert_register_page"}'>selected='selected'</c:if>>advert_register_page</option>
					</select>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">标题</td>
					<td style="text-align: left;">
					<input type="text" id="title" name="title" value="${e.title}" data-rule="标题:required;title;length[1~45];" /> 
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">备注</td>
					<td style="text-align: left;">
					<input type="text" id="remark" name="remark" value="${e.remark}" data-rule="标题:required;title;length[1~45];" /> 
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">状态</td>
					<td style="text-align: left;">
					<select id="status" name="status">
							<option value='y' <c:if test='${e.status=="y"}'>selected='selected'</c:if>>启用</option>
							<option value='n' <c:if test='${e.status=="n"}'>selected='selected'</c:if>>禁用</option>
					</select>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">是否优先使用图集</td>
					<td style="text-align: left;">
					<select id="useImagesRandom" name="useImagesRandom">
							<option value='y' <c:if test='${e.status=="y"}'>selected='selected'</c:if>>优先</option>
							<option value='n' <c:if test='${e.status=="n"}'>selected='selected'</c:if>>不优先</option>
					</select>	
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">日期时间范围</td>
					<td style="text-align: left;">
							<input id="d4311" class="Wdate search-query" type="text" name="startdate"
							value="<c:out value="${e.startdate}" />"
							onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
							~ 
							<input id="d4312" class="Wdate search-query" type="text" name="enddate" 
							value="<c:out value="${e.enddate}" />"
							onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">内容</td>
					<td style="text-align: left;">
					<textarea name="html" style="width:100%;height:300px;visibility:hidden;" data-rule="内容:required;content;">
						<c:out value="${e.html}"></c:out>
					</textarea>
					</td>
				</tr>
			</table>
</form>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-all.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>

<script type="text/javascript">
	$(function() {
		$("#title").focus();
		
		var ccc = $("#insertOrUpdateMsg").html();
		console.log("insertOrUpdateMsg="+insertOrUpdateMsg);
		if(ccc!='' && ccc.trim().length>0){
			$("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
		};
	});
	
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="html"]', {
			allowFileManager : true
		});
		K('input[name=getHtml]').click(function(e) {
			alert(editor.html());
		});
		K('input[name=isEmpty]').click(function(e) {
			alert(editor.isEmpty());
		});
		K('input[name=getText]').click(function(e) {
			alert(editor.text());
		});
		K('input[name=selectedHtml]').click(function(e) {
			alert(editor.selectedHtml());
		});
		K('input[name=setHtml]').click(function(e) {
			editor.html('<h3>Hello KindEditor</h3>');
		});
		K('input[name=setText]').click(function(e) {
			editor.text('<h3>Hello KindEditor</h3>');
		});
		K('input[name=insertHtml]').click(function(e) {
			editor.insertHtml('<strong>插入HTML</strong>');
		});
		K('input[name=appendHtml]').click(function(e) {
			editor.appendHtml('<strong>添加HTML</strong>');
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
</script>
</body>
</html>
