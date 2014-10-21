<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>

<style type="text/css">
input,textarea{
	width: 80%;
}

.leftTd{
	text-align: right;width: 100px
}

.rightTd{
	text-align: left;
}
</style>
<script type="text/javascript">
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
	changeStyle();
});
function changeStyle(){
	var _png = "<%=request.getContextPath() %>/resource/bootstrap3.0.0/style/"+$("#style").val()+".png";
	$("#styleImg").attr("src",_png);
	$("#ceshiA").attr("href",$("#base_input").val()+$("#style").val());
}
</script>
</head>

<body style="padding: 5px;">
<form action="systemSetting" namespace="/manage" theme="simple" id="form">

<div style="text-align: center;border-bottom: 1px solid #ccc;padding: 5px;">
	<button method="${ctx}/manage/systemSetting/insertOrupdate.action" class="btn btn-success">
		<i class="icon-ok icon-white"></i> 保存
	</button>
</div>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">基本设置</a></li>
		<li><a href="#tabs-2">图片设置</a></li>
		<li><a href="#tabs-3">样式设置</a></li>
		<li><a href="#tabs-5">QQ店小二设置</a></li>
		<li><a href="#tabs-6">图集</a></li>
	</ul>
	<div id="tabs-1">
		<table class="table table-condensed">
					<tr style="display: none;">
						<td>id</td>
						<td><input type="hidden"  id="id" name="id" label="id" value="<c:out value='${e.id}' />"/></td>
					</tr>
					<tr>
						<td style="text-align: right;width: 100px">系统版本</td>
						<td style="text-align: left;">
						<input type="text" name="version" id="version" value="<c:out value='${e.version}' />" 
						data-rule="required;version;length[0~100];" /></td>
					</tr>
					<tr>
						<td style="text-align: right;width: 100px">系统代号</td>
						<td style="text-align: left;">
						<input type="text" name="systemCode" id="systemCode" value="<c:out value='${e.systemCode}' />" 
						data-rule="required;systemCode;length[1~30];" /></td>
					</tr>
					<tr>
						<td style="text-align: right;width: 100px">名称</td>
						<td style="text-align: left;">
						<input type="text" name="name" id="name" value="<c:out value='${e.name}' />" 
						data-rule="required;name;length[1~30];" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">门户地址</td>   
						<td style="text-align: left;">
						<input type="text" name="www" id="www" value="<c:out value='${e.www}' />" 
						data-rule="required;www;length[1~100];" size="100" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">后台地址</td>   
						<td style="text-align: left;">
						<input type="text" name="manageHttp" id="manageHttp" value="<c:out value='${e.manageHttp}' />" 
						data-rule="required;manageHttp;length[1~100];" size="100" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">log</td>
						<td style="text-align: left;">
						<input type="text" name="log" id="log" value="<c:out value='${e.log}' />" 
						data-rule="required;log;length[0~100];" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">网站标题</td>
						<td style="text-align: left;">
						<input type="text" name="title" id="title" value="<c:out value='${e.title}' />" 
						data-rule="required;title;length[0~100];" /></td>
					</tr>
					<tr>
						<td style="text-align: right;">description</td>
						<td style="text-align: left;">
						<input type="text" name="description" id="description" value="<c:out value='${e.description}' />" 
						data-rule="required;description;length[0~100];" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">keywords</td>
						<td style="text-align: left;">
						<input type="text" name="keywords" id="keywords" value="<c:out value='${e.keywords}' />" 
						data-rule="required;keywords;length[0~100];" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">shortcuticon</td>
						<td style="text-align: left;">
						<input type="text" name="shortcuticon" id="shortcuticon" value="<c:out value='${e.shortcuticon}' />" 
						data-rule="required;shortcuticon;length[0~100];" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">联系地址</td>
						<td style="text-align: left;">
						<input type="text" name="address" id="address" value="<c:out value='${e.address}' />" 
						data-rule="required;address;length[0~100];" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">联系电话</td>
						<td style="text-align: left;">
							<input type="text" name="tel" id="tel" value="<c:out value='${e.tel}' />" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">邮箱</td>
						<td style="text-align: left;">
						<input type="text" name="email" id="email" value="<c:out value='${e.email}' />" 
						 data-rule="required;email;length[0~100];" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">备案号</td>
						<td style="text-align: left;">
							<input type="text" name="icp" id="icp" value="<c:out value='${e.icp}' />" 
						 		data-rule="required;icp;length[0~100];" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">站长统计代码</td>
						<td style="text-align: left;">
							<input type="text" name="statisticsCode" id="statisticsCode" value="<c:out value='${e.statisticsCode}' />" 
						 		data-rule="required;statisticsCode;length[10~1000];" />
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">是否开放网站</td>
						<td style="text-align: left;">
						<c:choose>
							<c:when test="${ e.isopen == 'true' }">
							   <input type="radio" name="isopen" value="true" checked="checked"/>是
							   <input type="radio" name="isopen" value="false" />否
							</c:when>
							<c:otherwise>
							  <input type="radio" name="isopen" value="true" />是
							   <input type="radio" name="isopen" value="false" checked="checked"/>否
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">关闭信息</td>
						<td style="text-align: left;">
						 <textarea name="closeMsg" id="closeMsg" cols="300" rows="6" ><c:out value='${e.closeMsg}' /></textarea>
						</td>
					</tr>
				</table>
	</div>
	<div id="tabs-2">
		<table class="table table-condensed">
			<tr>
				<td style="text-align: right;width: 100px">是否启用响应式</td>
				<td style="text-align: left;">
					<select id="unit" name="openResponsive" class="input-small">
							<option value='y'
								<c:if test='${e.openResponsive=="y"}'>selected='selected'</c:if>>启用</option>
							<option value='n'
								<c:if test='${e.openResponsive=="n"}'>selected='selected'</c:if>>禁用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;width: 100px">图片根路径</td>
				<td style="text-align: left;">
				<input type="text" name="imageRootPath" id="imageRootPath" value="<c:out value='${e.imageRootPath}' />" 
						 		data-rule="required;imageRootPath;length[0~100];" /> </td>
			</tr>
			<tr>
				<td style="text-align: right;">产品默认图片</td>
				<td style="text-align: left;">
				<input type="text" name="defaultProductImg" id="defaultProductImg" value="<c:out value='${e.defaultProductImg}' />" 
						 		 data-rule="required;defaultProductImg;length[0~100];" />  </td>
			</tr>
			<tr>
				<td style="text-align: right;width: 100px">后台左侧菜单叶子节点的图标</td>
				<td style="text-align: left;">
				<input type="text" name="manageLeftTreeLeafIcon" id="manageLeftTreeLeafIcon" value="<c:out value='${e.manageLeftTreeLeafIcon}' />" 
						 		 data-rule="required;manageLeftTreeLeafIcon;length[0~100];" /> </td>
			</tr>
		</table>
	</div>
	<div id="tabs-3">
		<table class="table table-condensed">
			<tr>
				<td style="text-align: right;">选择样式</td>
				<td style="text-align: left;">
					<select id="style" name="style" class="input-medium" onchange="changeStyle()">
							<option value='amelia' <c:if test='${e.style=="amelia"}'>selected='selected'</c:if> >amelia</option>
							<option value='cerulean' <c:if test='${e.style=="cerulean"}'>selected='selected'</c:if> >cerulean</option>
							<option value='cosmo' <c:if test='${e.style=="cosmo"}'>selected='selected'</c:if> >cosmo</option>
							<option value='cyborg' <c:if test='${e.style=="cyborg"}'>selected='selected'</c:if> >cyborg</option>
							<option value='default' <c:if test='${e.style=="default"}'>selected='selected'</c:if> >default</option>
							<option value='flatly' <c:if test='${e.style=="flatly"}'>selected='selected'</c:if> >flatly</option>
							<option value='journal' <c:if test='${e.style=="journal"}'>selected='selected'</c:if> >journal</option>
							<option value='readable' <c:if test='${e.style=="readable"}'>selected='selected'</c:if> >readable</option>
							<option value='simplex' <c:if test='${e.style=="simplex"}'>selected='selected'</c:if> >simplex</option>
							<option value='slate' <c:if test='${e.style=="slate"}'>selected='selected'</c:if> >slate</option>
							<option value='spacelab' <c:if test='${e.style=="spacelab"}'>selected='selected'</c:if> >spacelab</option>
							<option value='united' <c:if test='${e.style=="united"}'>selected='selected'</c:if> >united</option>
							<option value='yeti' <c:if test='${e.style=="yeti"}'>selected='selected'</c:if> >yeti</option>
                   </select>	
					<br>
					<a id="ceshiA" target="_blank">
						<img alt="" src="" id="styleImg" style="border: 1px solid #aaa;" >
					</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="tabs-5">
		<table class="table table-bordered">
			<tr>
				<td style="text-align: left;" colspan="2">
					<div class="alert alert-info">
						请在下面填写站点客服的QQ组建HTML内容。可以从QQ的网站(http://connect.qq.com/intro/wpa)上取得HTML内容。号码和内容描述可以自己修改。
					</div>
					<textarea  name="qqHelpHtml" style="width:100%;height:200px;visibility:hidden;"><c:out value='${e.qqHelpHtml}' /></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div id="tabs-6">
		<div>
			<div class="alert alert-info">图集：如果广告位的属性设置为图集随机优先，则广告位的位置会优先选择显示图集中的图片。选择图片的方式为随机选取。</div>
			<table class="table table-bordered">
				<tr>
					<td colspan="11">
						<input style="display: none;" onclick="addTrFunc();" value="添加" class="btn btn-warning" type="button"/>
						<input type="submit" method="deleteImageByImgPaths" onclick="return deleteImageByImgPaths();"
									value="删除" class="btn btn-primary"/>
					</td>
				</tr>
				<tr style="background-color: #dff0d8">
					<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
					<th>图片地址</th>
				</tr>
				
				 <c:forEach items="${e.imagesList}" var="img">  
					  <tr>
					   <td><input type="checkbox" name="imagePaths" value="<c:out value='${img}' />" /></td>
					   <td>
							<a href="<%=SystemManager.systemSetting.getImageRootPath()%><c:out value='${img}' />" target="_blank">
								<img style="max-width: 100px;max-height: 100px;" alt="" 
								src="<%=SystemManager.systemSetting.getImageRootPath()%><c:out value='${img}' />">
							</a>
						</td>
					  </tr>
					 </c:forEach>
			</table>
		</div>
		<br>
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td>文件</td>
			</tr>
			<tr id="firstTr">
				<td>
					<%for(int i=0;i<10;i++){ %>
					<div>
						<input type="button" name="filemanager" value="浏览图片" class="btn btn-warning"/>
						<input type="text" ccc="imagesInput" name="images" style="width: 80%;" />
					</div>
					<%} %>
				</td>
			</tr>
		</table>
	</div>
	
</div>
</form>
<input value="<%=SystemManager.systemSetting.getWww()%>/index.jsp?style=" id="base_input" style="display: none;"/>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var qqHelpHtml;
	KindEditor.ready(function(K) {
		qqHelpHtml = K.create('textarea[name="qqHelpHtml"]', {
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

<script>
KindEditor.ready(function(K) {
	var editor = K.editor({
		fileManagerJson : '<%=request.getContextPath() %>/resource/kindeditor-4.1.7/jsp/file_manager_json.jsp'
	});
	K('input[name=filemanager]').click(function() {
		var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
		editor.loadPlugin('filemanager', function() {
			editor.plugin.filemanagerDialog({
				viewType : 'VIEW',
				dirName : 'image',
				clickFn : function(url, title) {
					//K('#picture').val(url);
					//alert(url);
					imagesInputObj.val(url);
					editor.hideDialog();
					clearRootImagePath(imagesInputObj);//$("#picture"));
				}
			});
		});
	});
	
});

//删除图片主路径
function clearRootImagePath(picInput){
	var _pifeSpan = $("#pifeSpan").text();
	var _imgVal = picInput.val();
	console.log("1===>_imgVal = "+_imgVal);
	console.log("2===>"+_imgVal.indexOf("/attached/"));
	picInput.val(_imgVal.substring(_imgVal.indexOf("/attached/")));
}

function deleteImageByImgPaths(){
	if ($("input:checked").size() == 0) {
		alert("请选择要删除的图片！");
		return false;
	}
	return confirm("确定删除选择的图片吗?");
}
</script>

</body>
</html>
