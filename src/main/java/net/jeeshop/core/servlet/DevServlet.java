/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.jeeshop.core.servlet;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author huangf
 * 
 */
@Deprecated
public class DevServlet extends HttpServlet {
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest
	 * , javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		arg0.setCharacterEncoding("utf-8");
		arg1.setCharacterEncoding("utf-8");
		String devPath = DevServlet.class.getResource("/").getFile()
				+ "/开发日志.txt";
		
		FileReader r = new FileReader(devPath);
//		BufferedReader reader = new BufferedReader(new InputStreamReader(
//				new FileInputStream(devPath)));
		
		BufferedReader reader = new BufferedReader(r);
		
//		StringBuilder buff = new StringBuilder();
		String s = "";
		while (true) {
			String line = reader.readLine();
			if (line == null) {
				break;
			}
//			buff.append(line);
			s+=line;
		}
		System.out.println(s);
		System.out.println(new String(s.getBytes("utf-8")));
//		buff.
//		ByteArrayOutputStream out = new ByteArrayOutputStream();
//		ByteArrayInputStream in = new ByteArrayInputStream(buff.toString().getBytes());

		arg1.getWriter().write(s);
		reader.close();
	}
}
