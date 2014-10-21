<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
</head>

<body>
<s:form action="questionnaire" namespace="/manage" theme="simple" id="form">

<div style="text-align: center;border-bottom: 1px solid #ccc;padding: 5px;">
	<s:if test="e.id=='' or e.id==null">
		<s:submit method="insert" onclick="return onSubmit();" value="新增问卷" class="btn btn-primary"/>
	</s:if> 
	<s:else>
		<a class="btn btn-warning" href="<%=SystemManager.systemSetting.getWww() %>/question/show.html?id=<s:property value="e.id" />" target="_blank">查看</a>
		<s:submit method="update" onclick="return onSubmit();" value="保存问卷" class="btn btn-primary"/>
		
		<s:a href="questionnaire!toEdit.action?e.id=%{e.id}&e.addQuestionnaireItem=true&e.editQuestionnaireItem=false" class="btn btn-success">增加题目</s:a>
<!-- 		<input type="button" id="addQuestionItemBtn" value="增加题目" onclick="return addQuestionItemFunc(this);" class="btn btn-warning"/> -->
		<s:submit method="deleteItem" onclick="return deleteSelect();" value="删除题目" class="btn btn-warning"/>
	</s:else>
	<s:submit method="back" value="返回" class="btn btn-inverse"/>
</div>

<s:if test="e.editQuestionnaireItem or e.addQuestionnaireItem">
	<div id="addQuestionItemDiv">
</s:if>
<s:else>
	<div id="addQuestionItemDiv" style="display: none;">
</s:else>
	<table class="table">
		<tr>
			<td style="text-align: right;"></td>
			<td style="text-align: left;">
				<s:hidden name="e.questionnaireItem.id"></s:hidden>
				题目：<s:textfield name="e.questionnaireItem.subject" id="subject" placeholder="请输入问卷题目内容"/>
				
				<s:select list="#{'radio':'单选','checkbox':'多选','text':'文本'}" 
				name="e.questionnaireItem.type" />
				
				<s:select list="#{'inline':'一行显示','lines':'多行显示'}" 
				name="e.questionnaireItem.display" />
				顺序<s:textfield name="e.questionnaireItem.order1" id="order1" placeholder="请输入题目顺序,必须是数字"/>
				<br>
				
				<!-- 编辑题目模式 -->
				<s:if test="e.editQuestionnaireItem">
					<s:iterator value="e.questionnaireItem.optionList" status="i" var="item">
						选项：<input type="text" name="e.questionnaireItem.optionArr" id="option" width="400px" maxLength="100" value="<s:property value="item" />"/><br>
					</s:iterator>
				</s:if>
				
				选项：<s:textfield name="e.questionnaireItem.optionArr" id="option" placeholder="请输入选项内容" width="400px" maxLength="100"/><br>
				选项：<s:textfield name="e.questionnaireItem.optionArr" id="option" placeholder="请输入选项内容" width="400px" maxLength="100"/><br>
				选项：<s:textfield name="e.questionnaireItem.optionArr" id="option" placeholder="请输入选项内容" width="400px" maxLength="100"/><br>
				选项：<s:textfield name="e.questionnaireItem.optionArr" id="option" placeholder="请输入选项内容" width="400px" maxLength="100"/>
<!-- 				<input type="button" value="添加选项" class="btn"> -->
				<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<s:if test="e.questionnaireItem.id=='' or e.questionnaireItem.id==null">
					<s:submit method="insertQuestionItem" action="questionnaire"  onclick="return onSubmit(this);" value="新增题目" class="btn btn-warning"/>
				</s:if>
				<s:else>
					<s:submit method="insertQuestionItem" action="questionnaire"  onclick="return onSubmit(this);" value="修改题目" class="btn btn-warning"/>
				</s:else>
				<input id="cancelAddQuestionItemBtn" type="button" value="取消" class="btn"/>
			</td>
		</tr>
	</table>
</div>


<div id="tabs">
	<ul>
		<li><a href="#tabs-1">问卷信息</a></li>
		<li><a href="#tabs-2">题目列表</a></li>
	</ul>
	<div id="tabs-1">
		<table class="table table-condensed">
			<tr style="display: none;">
				<td>id</td>
				<td><s:hidden name="e.id" label="id" id="id"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">问卷名称</td>
				<td style="text-align: left;"><s:textfield name="e.title" 
						id="nickname" /></td>
			</tr>
			<tr>
				<td style="text-align: right;">副标题</td>   
				<td style="text-align: left;"><s:textarea name="e.title2" rows="3" cols="40" cssStyle="width:500px;"
						id="questionnaire"></s:textarea></td>
			</tr>
			<tr>
				<td style="text-align: right;">是否启用</td>
				<td style="text-align: left;">
					<s:select list="#{'n':'否','y':'是'}" id="status" name="e.status" 
					listKey="key" listValue="value"  /></td>
			</tr>
			<tr>
				<td style="text-align: right;">显示的开始/结束日期</td>
				<td style="text-align: left;">
					<input id="d4311" class="Wdate search-query input-small" type="text" name="e.showStartDate"
						value="<s:property value="e.showStartDate" />"
						onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
						~ 
						<input id="d4312" class="Wdate search-query input-small" type="text" name="e.showEndDate" 
						value="<s:property value="e.showEndDate" />"
						onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>		
				</td>
			</tr>
		</table>
	</div>
	<div id="tabs-2">
		<table class="table table-condensed">
			<tr style="background-color: #dff0d8">
				<th width="20" nowrap="nowrap"><input type="checkbox" id="firstCheckbox" /></th>
				<th>序号</th>
				<th>题目</th>
				<th>类型</th>
				<th>顺序</th>
			</tr>
			<s:iterator value="e.questionnaireItemMap" status="i" var="item">
				<tr>
					<td><input type="checkbox" name="ids"
						value="<s:property value="value.id"/>" /></td>
					<td width="60px"><s:property value="#i.index+1" /></td>
					<td>&nbsp;
						<s:a href="questionnaire!toEdit.action?e.id=%{value.qid}&e.questionnaireItem.id=%{value.id}&e.editQuestionnaireItem=true" >
						<s:property value="value.subject" /></s:a><br>
						
						<div style="margin-left: 20px;">
							<div style="display: table-row;">
								<s:if test="value.display.equals(\"inline\")">
									<s:iterator value="value.optionList" status="ii" var="option">
										<div class="pull-left" style="margin-right: 30px;">
											<s:property value="#ii.index+1" />、<s:property value="option" />
										</div>
									</s:iterator>
								</s:if>
								<s:else>
									<s:iterator value="value.optionList" status="ii" var="option">
										<s:property value="#ii.index+1" />、<s:property value="option" /><br>
									</s:iterator>
								</s:else>
							</div>
						</div>
					</td>
					<td width="60px">
						<s:if test="value.type.equals(\"radio\")">单选</s:if>
						<s:elseif test="value.type.equals(\"checkbox\")">多选</s:elseif>
						<s:else>文本</s:else>
					</td>
					<td>
						<s:textfield name="value.order1"/>
					</td>
				</tr>
			</s:iterator>
		</table>
	</div>
</div>
</s:form>

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/jquery-1.5.1.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>

<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="e.productHTML"]', {
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
		
<script type="text/javascript">
$(function() {
	$( "#tabs" ).tabs({
		//event: "mouseover"
	});
	
	$("#title").focus();
	
	$("#cancelAddQuestionItemBtn").click(function(){
		$("#addQuestionItemDiv").slideUp();
		$("#addQuestionItemBtn").show();
		return false;
	});
	
	function c1(f) {
		$(":checkbox").each(function() {
			$(this).attr("checked", f);
		});
	}
	$("#firstCheckbox").click(function() {
		if ($(this).attr("checked")) {
			c1(true);
		} else {
			c1(false);
		}
	});
});
function addQuestionItemFunc(){
	$("#addQuestionItemDiv").slideDown();
	$("#addQuestionItemBtn").hide();
	return false;
}
function deleteSelect() {
	if ($("input:checked").size() == 0) {
		alert("请选择要删除的题目！");
		return false;
	}
	return confirm("确定删除选择的记录?");
}
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</body>
</html>
