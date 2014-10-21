//package net.jeeshop.core.servlet;
//
//import java.io.IOException;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.commons.lang.StringUtils;
//import org.apache.struts2.dispatcher.multipart.JakartaMultiPartRequest;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
///**
// * 文件上传工具类；此类和struts2有冲突，下面的代码已给出解决冲突的办法了。
// * @author huangf
// *
// */
//public class RequestParseWrapper extends JakartaMultiPartRequest{
//	private static final Logger log = LoggerFactory.getLogger(RequestParseWrapper.class);
//	public void parse(HttpServletRequest request, String saveDir)
//			throws IOException {
//		/**
//		 * 判断传入的参数是否是图片，如果是图片则屏蔽struts2的request功能，这个是为了解决jquery上传图片的插件以及kindedit和struts2的request上传文件时候的冲突。
//		 */
//		String image = request.getParameter("dir");
//		log.error(request+","+saveDir+",image="+image);
//		
//		if(StringUtils.isBlank(image) || !image.equals("image")){
//			super.parse(request, saveDir);
//		}
//	}
//}
