<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy2 -->
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.*"%>
<%@page import="net.jeeshop.services.front.news.bean.News"%>
<!-- tyy -->
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!-- <html class="no-js"> -->
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/validator-0.6.3/jquery.validator.css" />
<style type="text/css">
	#form .n-invalid {border: 1px solid #f00;}
</style>
<style type="text/css">
.centerImageCss{
	width: 560px;
	height: 180px;
}
.letters{
	font-weight: bold;
}
</style>
</head>

<body>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container" style="margin-top: 0px;padding-top: 0px;">
		<div class="row">
			<div class="col-xs-3" style="min-height: 300px;border: 0px solid red;">
				<%@ include file="userLeft.jsp"%>
			</div>
			
			<div class="col-xs-9" style="min-height: 500px;border: 0px solid red;">
				<div class="row" style="margin-top: 0px;">
					<table class="table table-striped" style="margin-bottom: 10px;">
						<tr style="background-color: #dff0d8">
							<th width="20px" style="display: none;"><input type="checkbox" id="firstCheckbox" /></th>
							<th style="text-align: center;">标题</th>
							<th width="150px" style="text-align: center;">时间</th>
							<th width="50px" style="text-align: center;">删除</th>
						</tr>
						<s:iterator value="pager.list" status="i" var="item">
							<tr>
								<td style="display: none;"><s:property value="id"/></td>
								<td style="text-align: left;">
									<a class="title" href="#" onclick="readLitters(this,<s:property value="id"/>);" title="<s:property value="title"/>" littersStatus="<s:property value="status"/>">
										<s:if test="status==0">
											<div class="letters">【系统】<s:property value="title"/></div>
										</s:if>
										<s:else>
											【系统】<s:property value="title"/>
										</s:else>
									</a>
								</td>
								<td style="text-align: center;width: 150px;"><s:property value="createtime"/></td>
								<td style="text-align: center;width: 50px;"><a href="#" onclick="del(this,<s:property value="id"/>);">删除</a></td>
							</tr>
							<tr style="display: none;">
								<td colspan="11">
									<div class="littersDiv">
										<s:property value="content" escapeXml="false"/>
									</div>
								</td>
							</tr>
						</s:iterator>
					</table>
				</div>
				
				<div class="row" style="margin-top: 0px;text-align: right;">
					<s:if test="!(pager.list==null or pager.list.size==0)">
						<%@ include file="../../pager.jsp"%>
					</s:if>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><b>删除信件</b></h4>
      </div>
      <div class="modal-body">
        您确认删除吗,删除后将不可恢复!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="delLetters();">确定</button>
        <button type="button" class="btn btn-primary" onclick="javascript:$('#myModal').modal('hide');">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
<%@ include file="/foot.jsp"%>
<%@ include file="/resource/common_js.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/validator-0.6.3/jquery.validator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/validator-0.6.3/local/zh_CN.js"></script>

<%-- <link href="<%=request.getContextPath()%>/resource/artDialog4.1.5/skins/opera.css" rel="stylesheet" /> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/artDialog4.1.5/artDialog.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/artDialog4.1.5/plugins/iframeTools.js"></script> --%>

<script type="text/javascript">
$(function() {
});

var _delID = 0;
function readLitters(t,id){
	//$(t).parent().find("div[class=littersDiv]").slideToggle();
	$(t).parent().parent().next().slideToggle();
	
	var _status = $(t).attr("littersStatus");
	if(_status==0){
		
		$.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/webAccount!setLettersStatus.action",
			data : {
				id : id
			},
			async : false,
			success : function(data) {
				if (data == "0") {
					$(t).attr("littersStatus",1);
					$(t).find("div[class=letters]").removeClass("letters");
					//alert("设置为已读");
					return true;
				}
			},
			error:function(){
				alert("error");
			}
		});
	}
	
	
	return false;
}
function delLetters(t){
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/webAccount!delLetters.action",
		data : {
			id : _delID
		},
		async : false,
		beforeSend : function() {
		},
		success : function(data) {
			if (data == "0") {
				return true;
			}
		},
		error:function(){
			alert("error");
		},
		complete : function() {
		}
	});
	
	location.reload();
	return false;
}
function del(t,id){
	_delID = id;
	$('#myModal').modal('toggle');
	
	/*art.dialog({
	    id: 'testID',
	    content: 'hello world!',
	    button: [
	        {
	            name: '同意',
	            callback: function () {
	                this.content('你同意了').time(2);
	                return false;
	            },
	            focus: true
	        },
	        {
	            name: '不同意',
	            callback: function () {
	                alert('你不同意')
	            }
	        },
	        {
	            name: '无效按钮',
	            disabled: true
	        },
	        {
	            name: '关闭我'
	        }
	    ]
	});*/
	return false;
}
</script>
</body>
</html>
