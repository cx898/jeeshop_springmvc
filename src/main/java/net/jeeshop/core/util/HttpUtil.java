package net.jeeshop.core.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.URL;
import java.net.URLConnection;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sun.util.logging.resources.logging;

import freemarker.template.utility.StringUtil;

public class HttpUtil {
	private static final String default_charset = "utf-8";
	private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);
	public static String get(String url0,String data,String charset) throws IOException {
		if(StringUtils.isBlank(charset)){
			charset = default_charset;
		}
		/**
		 * 首先要和URL下的URLConnection对话。 URLConnection可以很容易的从URL得到。比如： // Using
		 * java.net.URL and //java.net.URLConnection
		 */
		URL url = new URL(url0);
		URLConnection conn = url.openConnection();
		/**
		 * 然后把连接设为输出模式。URLConnection通常作为输入来使用，比如下载一个Web页。
		 * 通过把URLConnection设为输出，你可以把数据向你个Web页传送。下面是如何做：
		 */
		conn.setDoOutput(true);
		
		//当存在post的值时，才打开OutputStreamWriter  
        if(data!=null && data.toString().trim().length()>0){  
        	/**
    		 * 最后，为了得到OutputStream，简单起见，把它约束在Writer并且放入POST信息中，例如： ...
    		 */
    		OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(),charset);
    		out.write("username=kevin&password=*********"); // post的关键所在！
    		// remember to clean up
    		out.flush();
    		out.close();
        }
        
		/**
		 * 这样就可以发送一个看起来象这样的POST： POST /jobsearch/jobsearch.cgi HTTP 1.0 ACCEPT:
		 * text/plain Content-type: application/x-www-form-urlencoded
		 * Content-length: 99 username=bob password=someword
		 */
		// 一旦发送成功，用以下方法就可以得到服务器的回应：
		String sCurrentLine = null;
		StringBuilder buff = new StringBuilder();
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),charset));
		while ((sCurrentLine = reader.readLine()) != null) {
//			buff.append(new String(sCurrentLine.getBytes(), charset));
			logger.error("sCurrentLine="+sCurrentLine);
			buff.append(sCurrentLine);
		}
		return buff.toString();
	}

	public static void main(String[] args) throws IOException {
		System.out.println(HttpUtil.get("http://www.baidu.com",null,"gbk"));
	}
}
