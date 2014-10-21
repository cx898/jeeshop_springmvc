package net.jeeshop.core.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.io.FileUtils;

import com.alibaba.fastjson.JSON;
@Deprecated
public class CountUtil {
	private String fileName = CountUtil.class.getResource("/").getFile()+"count.info";
	private static CountInfoUtil obj = null;
	private static CountUtil instance = null;

	public static CountUtil getInstance() {
		if (instance == null) {
			instance = new CountUtil();
		}
		return instance;
	}

	private CountUtil() {
		System.out.println("fileName："+fileName);
		try {
			obj = read(fileName);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}

		if (obj == null) {
			obj = new CountInfoUtil();
		}
	}

	public int getTotalCount() {
		return obj.getTotalCount();
	}

	public int getDayCount() {
		return obj.getDayCount();
	}

	public int getMonthCount() {
		return obj.getMonthCount();
	}

	public int getWeekCount() {
		return obj.getWeekCount();
	}

	public int getYearCount() {
		return obj.getYearCount();
	}

	public synchronized void addcount(Date da) {// 比较日期增加计数

		if (new SimpleDateFormat("yyyy-MM-dd").format(this.obj.date).equals(
				new SimpleDateFormat("yyyy-MM-dd").format(da)))
			this.obj.setDayCount(this.obj.getDayCount() + 1);
		else
			this.obj.setDayCount(1);

		if (new SimpleDateFormat("yyyy-MM").format(this.obj.date).equals(
				new SimpleDateFormat("yyyy-MM").format(da)))
			this.obj.setMonthCount(this.obj.getMonthCount() + 1);
		else
			obj.setMonthCount(1);

		Calendar ca = Calendar.getInstance();
		ca.setTime(da);
		ca.setFirstDayOfWeek(Calendar.MONDAY);

		if (ca.get(Calendar.DAY_OF_WEEK) == Calendar.MONDAY
				&& !new SimpleDateFormat("yyyy-MM-dd").format(this.obj.date)
						.equals(new SimpleDateFormat("yyyy-MM-dd").format(da)))
			obj.setWeekCount(1);
		else
			obj.setWeekCount(obj.getWeekCount() + 1);

		if (new SimpleDateFormat("yyyy").format(this.obj.date).equals(
				new SimpleDateFormat("yyyy").format(da)))
			this.obj.setYearCount(this.obj.getYearCount() + 1);
		else
			obj.setYearCount(1);
		obj.setDate(da);

		obj.setTotalCount(obj.getTotalCount() + 1);
		obj.setTempCount(obj.getTempCount() + 1);
//		if (obj.getTempCount() >= -1) {// 只有当临时访问量大于等于20时才保存一次
			obj.setTempCount(0);// 临时计数器置0
			System.out.println("开始保存文件");
			write(fileName);
//		}
	}

	private void write(String fileName) {
		// try {
		// FileWriter writer = new FileWriter(fileName);
		// Marshaller.marshal(obj, writer);
		// writer.close();
		// } catch (Exception e) {
		// System.out.println(e);
		// }
		try {
			FileUtils.writeStringToFile(new File(fileName), JSON.toJSONString(obj), "utf-8");
			System.out.println("保存成功");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private CountInfoUtil read(String fileName) throws Exception {
		// FileReader reader = new FileReader(fileName);
		// CountInfoUtil result = (CountInfoUtil)
		//
		// Unmarshaller.unmarshal(CountInfoUtil.class, reader);
		// reader.close();
		// return result;
		String str = FileUtils.readFileToString(new File(fileName), "utf-8");
		obj = JSON.parseObject(str, CountInfoUtil.class);
		if(obj==null)obj = new CountInfoUtil();
		return obj;
	}
}
