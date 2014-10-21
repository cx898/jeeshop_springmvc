<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
</head>

<body>
	<form action="indexImg" namespace="/manage" theme="simple" enctype="multipart/form-data">
		<span id="pifeSpan" class="input-group-addon" style="display:none"><%=SystemManager.systemSetting.getImageRootPath()%></span>
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong> 门 户 图 片 编 辑 </strong>
				</td>
			</tr>
			<tr style="display: none;">
				<th>id</th>
				<td><input type="hidden" id="idd" label="id" name="id" value="${e.id}" /></td>
			</tr>
			<tr>
				<th class="right">标题</th>
				<td style="text-align: left;">
				<input type="text" id="title" name="title" value="${e.title}" data-rule="标题:required;title;length[1~45];" />
				</td>
			</tr>
			<tr>
				<th>图片地址</th>
				<td style="text-align: left;" colspan="3">
					<input type="button" name="filemanager" value="浏览图片" class="btn btn-warning"/>
					<input type="text" id="picture" name="picture" value="${e.picture}" ccc="imagesInput" 
					style="width: 600px;" data-rule="图片地址:required;picture;" />
					<c:if test="${e.picture !=null }">
						<a target="_blank" href="<%=SystemManager.systemSetting.getImageRootPath()%>/..<c:out value="${e.picture}" />">
							<img style="max-width: 50px;max-height: 50px;" alt="" src="<%=SystemManager.systemSetting.getImageRootPath()%>/..<c:out value="${e.picture}" />">
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>广告链接</th>
				<td style="text-align: left;">
					<input type="text" name="link" id="link" value="${e.link}" />
				</td>
			</tr>
			<tr>
				<th>排序</th>
				<td style="text-align: left;">
				<input type="text" name="order1" id="order1" value="${e.order1}" data-rule="排序:integer;order1;length[1~5];" />
				</td>
			</tr>
			<tr>
				<th>描述</th>
				<td style="text-align: left;">
				<input type="text" name="desc1" id="desc1" value="${e.desc1}"  />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				
				<c:choose>		
		  			<c:when test="${e.id=='' or e.id==null}">
					   <button method="${ctx}/manage/indexImg/insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
					</c:when>
					<c:otherwise>
					  <button method="${ctx}/manage/indexImg/update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
					</c:otherwise>	
           		</c:choose>				
			</tr>
		</table>
	</form>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
//删除图片主路径
function clearRootImagePath(picInput){
	var _pifeSpan = $("#pifeSpan").text();
	var _imgVal = picInput.val();
	picInput.val(_imgVal.substring(_imgVal.indexOf("/attached/")));
	//if(_imgVal && _imgVal.length>0 && _imgVal.indexOf(_pifeSpan)==0){
		//picInput.val(_imgVal.substring(_pifeSpan.length));
	//}
}

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
</script>

</body>
</html>
