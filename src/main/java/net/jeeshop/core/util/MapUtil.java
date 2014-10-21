package net.jeeshop.core.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.MessageFormat;

public class MapUtil {
	private static  String OUTPUT = null;
	private static  String SENSOR = null;
	private static  String KEY = null;

	public static void getCoordinate(String addr) {
		String addrs = "";
		String address = null;
		try {
			address = java.net.URLEncoder.encode(addr, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		;
		String output = "csv";
		String key = "abc";
		String url = String.format(
				"http://maps.google.com/maps/geo?q=%s&output=%s&key=%s",
				address, output, key);
		URL myURL = null;
		URLConnection httpsConn = null;
		// 进行转码
		try {
			myURL = new URL(url);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

		try {
			httpsConn = (URLConnection) myURL.openConnection();
			if (httpsConn != null) {
				InputStreamReader insr = new InputStreamReader(
						httpsConn.getInputStream(), "UTF-8");
				BufferedReader br = new BufferedReader(insr);
				String data = null;
				if ((data = br.readLine()) != null) {
					System.out.println(data);
					String[] retList = data.split(",");
					if (retList.length > 2 && ("200".equals(retList[0]))) {
						addrs = retList[2];
						addrs = addr.replace("", "");
					} else {
						addrs = "";
					}
				}
				insr.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(addrs);
	}
//	http://maps.googleapis.com/maps/api/js/GeocodeService.Search?4s%E4%B8%8A%E6%B5%B7&7sUS&9szh-CN&callback=_xdc_._eum1kj&token=12256
	/**
	 * 利用googlemap api 通过 HTTP 进行地址解析
	 * 
	 * @param address
	 *            地址
	 * @return HTTP状态代码,精确度（请参见精确度常数）,纬度,经度
	 */
	private static  String getLatlng(String address) {
		String ret = "";
		if (address != null && !address.equals("")) {
			try {
				address = URLEncoder.encode(address, "UTF-8");// 进行这一步是为了避免乱码
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
//				logger.error("转码失败", e1);
			}
			String[] arr = new String[4];
			arr[0] = address;
			arr[1] = OUTPUT;
			arr[2] = SENSOR;
			arr[3] = KEY;
			String url = MessageFormat
					.format("http://maps.google.com/maps/geo?q={0}&output={1}&sensor={2}&key={3}",
							arr);
			URL urlmy = null;
			try {
				urlmy = new URL(url);
				HttpURLConnection con = (HttpURLConnection) urlmy
						.openConnection();
				con.setFollowRedirects(true);
				con.setInstanceFollowRedirects(false);
				con.connect();
				BufferedReader br = new BufferedReader(new InputStreamReader(
						con.getInputStream(), "UTF-8"));
				String s = "";
				StringBuffer sb = new StringBuffer("");
				while ((s = br.readLine()) != null) {
					sb.append(s + "\r\n");
				}
				ret = "" + sb;
			} catch (MalformedURLException e) {e.printStackTrace();
//				logger.error("通过http方式获取地址信息失败", e);
			} catch (IOException e) {e.printStackTrace();
//				logger.error("文件读取失败", e);
			}
		}
		return ret;
	}

	public static void main(String[] args) {
		getCoordinate("上海市长寿路站");
//		getLatlng("上海市长寿路站");
	}
}
