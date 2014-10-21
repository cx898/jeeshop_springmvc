package net.jeeshop.core.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.LinkedList;
import java.util.List;

import com.alibaba.fastjson.JSON;


public class Baidu {
	public static void main(String[] args) throws Exception {
//		String address = "http://api.map.baidu.com/geocoder/v2/?address=华夏东路&output=json&ak=E4805d16520de693a3fe707cdc962045";
//		getLatlon(address);
		
		List<String> addressList = new LinkedList<String>();
//		addressList.add("人民广场23号");
//		addressList.add("长寿路站33号");
//		addressList.add("徐汇区");
		addressList.add("上海市浦东新区华夏一路34");
		for(int i=0;i<addressList.size();i++){
			String address = "http://api.map.baidu.com/geocoder/v2/?address="+addressList.get(i)+"&output=json&ak=E4805d16520de693a3fe707cdc962045";
			try {
				getLatlon(address);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @param address
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	private static void getLatlon(String address) throws MalformedURLException,
			IOException {
		URL t = new URL(address);
		URLConnection conn = t.openConnection();
		InputStream in = conn.getInputStream();
		BufferedReader reader = new BufferedReader(new InputStreamReader(in));
		String line = reader.readLine();
//		System.out.println(line);
		
		BaiduMapInfo bInfo = JSON.parseObject(line, BaiduMapInfo.class);
//		System.out.println(bInfo);
		System.out.println(bInfo.getResult().getLocation());
	}
}
