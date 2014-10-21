package net.jeeshop.core;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import net.jeeshop.core.kuaidi.Kuaidi100Info;
import net.jeeshop.core.util.HttpUtil;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;

/**
 * 圆通快递单号：9225856722
 * 
 * https://code.google.com/p/kuaidi-api/wiki/Open_API_API_URL
 * @author huangf
 *
 */
public class kuaidi100Helper {
	private static final Logger logger = LoggerFactory.getLogger(kuaidi100Helper.class);
	
	public static Kuaidi100Info selectKuaidi100(){
		try {
			String response = HttpUtil.get("http://api.kuaidi100.com/api?id=7fdd7136ff90ef2d&com=yunda&nu=1201205716323&valicode=&show=0&muti=1&order=desc",null,"UTF-8");
			logger.error("response = "+response);
			Kuaidi100Info info = JSON.parseObject(response, Kuaidi100Info.class);
//			logger.error(info.getData().toString());
			logger.error(info.toString());
			return info;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] agrs) throws Exception{
		if(true){
			String sHtmlText = "<?xml version=\"1.0\" encoding=\"utf-8\"?><alipay><is_success>F</is_success><error>TRADE_NOT_EXIST</error></alipay>";
			//			selectKuaidi100();
			//解析支付宝返回的XML
			Document doc = DocumentHelper.parseText(sHtmlText );
			System.out.println("selectSingleNode="+doc.selectSingleNode("//is_success"));
			
			return ;
		}
		
		if(1==2){
			String response = HttpUtil.get("http://127.0.0.1:8080/myshopFront/kuaidi100JSON.jsp",null,"UTF-8");
			logger.error("response = "+response);
			Kuaidi100Info info = JSON.parseObject(response, Kuaidi100Info.class);
			logger.error(info.getData().toString());
//			Map map = JSON.toJavaObject(JSON.parseObject(response), Map.class);
//			Map<String,Object> map = (Map<String, Object>) JSON.parse(response);
//			logger.error("map = "+map.get("data"));
//			
//			List<Kuaidi100Info> list = (List<Kuaidi100Info>) map.get("data");
//			logger.error("list="+list.size());
//			for(int i=0;i<list.size();i++){
//				logger.error(list.get(i).toString());
//			}
			return;
		}
		
		try {
			//9225856722
			//韵达 单号1201092278342，没有查到相关信息。单号暂未收录或已过期
			//http://api.kuaidi100.com/api?id=b64b5b6a00ad44f8&com=yunda&nu=1201092278342&show=2&muti=1&order=desc
			//快递公司网络异常，请稍后查询.
			//http://api.kuaidi100.com/api?id=b64b5b6a00ad44f8&com=shunfeng&nu=688558133773&show=0&muti=1&order=desc
//			URL url = new URL("http://api.kuaidi100.com/api?id=b64b5b6a00ad44f8&com=yuantong&nu=9225856722&show=2&muti=1&order=desc");
			URL url = new URL("http://api.kuaidi100.com/api?id=7fdd7136ff90ef2d&com=yunda&nu=1201205716323&valicode=&show=0&muti=1&order=desc");
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
			 System.out.println("content:" + content);
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
