<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 用户评论列表 -->
<div>
	<!-- Duoshuo Comment BEGIN -->
	<div class="ds-thread" data-form-position="top" data-limit="25" data-order="desc" data-thread-key="<s:property value="e.id" escapeXml="false"/>"></div>
	<script type="text/javascript">
	var duoshuoQuery = {short_name:"jeeshop"};
		(function() {
			var ds = document.createElement('script');
			ds.type = 'text/javascript';ds.async = true;
			ds.src = 'http://static.duoshuo.com/embed.js';
			ds.charset = 'UTF-8';
			(document.getElementsByTagName('head')[0] 
			|| document.getElementsByTagName('body')[0]).appendChild(ds);
		})();
	</script>
	<!-- Duoshuo Comment END -->
</div>