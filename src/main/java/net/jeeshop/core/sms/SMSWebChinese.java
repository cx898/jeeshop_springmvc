package net.jeeshop.core.sms;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import net.jeeshop.services.manage.sms.bean.Sms;

import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.PostMethod;

/**
 * http://www.webchinese.com.cn   此公司的SMS短信平台
 * @author jqsl2012@163.com
 *
 */
public class SMSWebChinese {
	public static void main(String[] args) throws HttpException, IOException {
		sendSMS(null);
	}

	public static void sendSMS(Sms sms) throws IOException, HttpException,
			UnsupportedEncodingException {
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://utf8.sms.webchinese.cn");
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf-8");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", "jqsl2012"),
				new NameValuePair("Key", "8376220944aae870d31a"),
				new NameValuePair("smsMob", sms.getPhone()),
				new NameValuePair("smsText", sms.getContent()) };
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:" + statusCode);
		for (Header h : headers) {
			System.out.println("h.toString()="+h.toString());
		}
		String returnCode = new String(post.getResponseBodyAsString().getBytes(
				"gbk"));
		System.out.println("result="+returnCode);

		post.releaseConnection();
		
		sms.setReturnCode(returnCode);
	}
}
