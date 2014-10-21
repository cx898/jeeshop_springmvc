<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Viewport metatags -->
<meta name="HandheldFriendly" content="true" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="shortcut icon" href="<%=SystemManager.systemSetting.getShortcuticon()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/404/1/css/dandelion.css"  media="screen" />

<title>404页面</title>

</head>

<body>
    
	<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
	<div id="da-wrapper" class="fluid">
    
        <!-- Content -->
        <div id="da-content">
            
            <!-- Container -->
            <div class="da-container clearfix">
            
            	<div id="da-error-wrapper">
                	
                   	<div id="da-error-pin"></div>
                    <div id="da-error-code">
                    	404 <br></br><div style="font-size: 22px;">抱歉，页面不存在！</div>                    </div>
                
                	<h1 class="da-error-heading" style="display: none;">抱歉，您没有此权限！</h1>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <div id="da-footer">
        	<div class="da-container clearfix">
           	<p style="text-align: center;"><%=SystemManager.systemSetting.getIcp() %>
						<a target="_blank" href="http://www.aliyun.com/"><img src="http://gtms01.alicdn.com/tps/i1/T1W6.aFbFbXXcZj_6s-96-18.png" alt="运行在阿里云" /></a>
					</p>
			</div>
        </div>
    </div>
    
</body>
</html>
