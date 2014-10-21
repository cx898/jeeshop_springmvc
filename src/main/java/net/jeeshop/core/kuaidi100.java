package net.jeeshop.core;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;

import net.jeeshop.core.util.HttpUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;

public class kuaidi100 {
	private static final Logger logger = LoggerFactory.getLogger(kuaidi100.class);
	public static void main(String[] agrs) throws Exception{
		
		if(1==1){
			String response = HttpUtil.get("http://127.0.0.1:8080/myshopFront/kuaidi100JSON.jsp",null,"UTF-8");
			logger.error("response = "+response);
//			Map map = JSON.toJavaObject(JSON.parseObject(response), Map.class);
			Map<String,Object> map = (Map<String, Object>) JSON.parse(response);
			logger.error("map = "+map.get("data"));
			return;
		}
		try {
			URL url = new URL(
					"http://api.kuaidi100.com/api?id=XXXX&com=tiantian&nu=11111&show=2&muti=1&order=desc");
			URLConnection con = url.openConnection();
			con.setAllowUserInteraction(false);
			InputStream urlStream = url.openStream();
			String type = con.guessContentTypeFromStream(urlStream);
			String charSet = null;
			if (type == null)
				type = con.getContentType();

			if (type == null || type.trim().length() == 0
					|| type.trim().indexOf("text/html") < 0)
				return;

			if (type.indexOf("charset=") > 0)
				charSet = type.substring(type.indexOf("charset=") + 8);

			byte b[] = new byte[10000];
			int numRead = urlStream.read(b);
			String content = new String(b, 0, numRead);
			while (numRead != -1) {
				numRead = urlStream.read(b);
				if (numRead != -1) {
					// String newContent = new String(b, 0, numRead);
					String newContent = new String(b, 0, numRead, charSet);
					content += newContent;
				}
			}
			// System.out.println("content:" + content);
			urlStream.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
