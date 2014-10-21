<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
</head>

<body>
	<form action="oss" namespace="/manage" theme="simple" id="form" name="form">
		<table class="table table-bordered">
			<tr style="background-color: #dff0d8">
				<td colspan="2" style="background-color: #dff0d8;text-align: center;">
					<strong>存储编辑</strong>
				</td>
			</tr>
			<tr style="display: none;">
				<td>id</td>
				<td><input type="hidden" name="id" label="id" value="${e.id}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;width: 200px;">存储类型</td>
				<td style="text-align: left;">
				<select  name="code" >
							<option value='aliyun'
								<c:if test='${e.code== "aliyun"}'>selected='selected'</c:if>>阿里云存储</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">ACCESS_ID</td>   
				<td style="text-align: left;">
					<input type="text" name="aliyunOSS.ACCESS_ID" id="ACCESS_ID" value="${e.aliyunOSS.ACCESS_ID}"
					data-rule="ACCESS_ID:required;ACCESS_ID;length[1~50];" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">ACCESS_KEY</td>   
				<td style="text-align: left;" >
					<input type="text" name="aliyunOSS.ACCESS_KEY" id="ACCESS_KEY" value="${e.aliyunOSS.ACCESS_KEY}"
					 data-rule="ACCESS_KEY:required;ACCESS_KEY;length[1~50];" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">OSS_ENDPOINT</td>   
				<td style="text-align: left;" >
					<input type="text" name="aliyunOSS.OSS_ENDPOINT" id="OSS_ENDPOINT" value="${e.aliyunOSS.OSS_ENDPOINT}"
					 data-rule="OSS_ENDPOINT:required;OSS_ENDPOINT;length[1~50];" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">bucketName</td>   
				<td style="text-align: left;" >
					<input type="text" name="aliyunOSS.bucketName" id="bucketName" value="${e.aliyunOSS.bucketName}"
					data-rule="bucketName:required;bucketName;length[1~50];" />
				</td>
			</tr>
			<tr>
				<td style="text-align: right;">状态</td>
				<td style="text-align: left;">
					<select name="status" >
							<option value='y'
								<c:if test='${e.status=="y"}'>selected='selected'</c:if>>启用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<c:choose>		
			  			<c:when test="${e.id=='' or e.id==null}">
						   <button method="${ctx}/manage/oss/insert.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 新增
						</button>
						</c:when>
						<c:otherwise>
						  <button method="${ctx}/manage/oss/update.action" class="btn btn-success">
							<i class="icon-ok icon-white"></i> 保存
						</button>
						</c:otherwise>	
            		</c:choose>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
