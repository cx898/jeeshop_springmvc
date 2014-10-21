package net.jeeshop.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.time.DateUtils;

public class DateTimeUtil {
	public static void main(String[] args) throws Exception {
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println(getDateTimeString(sdf.parse("2013-11-2 7:00:00")));
//		System.out.println(getDateTimeString(sdf.parse("2013-11-2 6:00:00")));
//		System.out.println(getDateTimeString(sdf.parse("2013-11-1 6:00:00")));
//		System.out.println(getDateTimeString(sdf.parse("2013-10-31 6:00:00")));
////		System.out.println(getDateTimeString(sdf.parse("2013-10-30 8:00:00")));
//		System.out.println(getDateTimeString(sdf.parse("2013-10-30 6:00:00")));
//		
//		System.out.println(sdf.format(DateUtils.addHours(new Date(), 2)));
		
		System.out.println(getActivityEndDateTimeString("2014-04-30 6:00:00"));
	}
	private static final long m = 60*1000L;//分
	private static final long hour = 3600*1000L;//小时
	private static final long day = 24*hour;//天
	public static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	/**
	 * 日期时间转换成文字
	 * @param date
	 * @return
	 */
	public static String getDateTimeString(Date date){
		if(date==null){
			throw new NullPointerException();
		}
		
		Date currentDate = new Date();
		long cha = Math.abs(date.getTime()-currentDate.getTime());
//		System.out.println("cha="+cha);
		long hours = cha/hour;
//		System.out.println(hours);
		if(hours<1){
			if(cha/m<=0){
				return "刚刚";
			}
			return cha/m+"分钟前";
		}
		if(hours<24){
			return cha/hour+"小时前";
		}
		if(hours<=72){
			int nn = Integer.valueOf(cha/day+"");
			if(cha%day>0){
				nn++;
			}
			return nn+"天前";
		}
		return sdf.format(date);
	}
	
	public static boolean compareDateTime(Date d1,Date d2) {
		return d1.getTime() > d2.getTime();
	}
	
	/**
	 * 获取促销商品活动的结束时间的字符串
	 * @param date
	 * @return
	 * @throws Exception 
	 */
	public static String getActivityEndDateTimeString(String activityEndDateTime) {
        long nd = 1000 * 24 * 60 * 60;// 一天的毫秒数   
        long nh = 1000 * 60 * 60;// 一小时的毫秒数   
        long nm = 1000 * 60;// 一分钟的毫秒数   
        long ns = 1000;// 一秒钟的毫秒数   
        long diff;   
        long day = 0;   
        long hour = 0;   
        long min = 0;   
        long sec = 0;   
        // 获得两个时间的毫秒时间差异   
        try {   
            diff = sdf.parse(activityEndDateTime).getTime() - (new Date()).getTime();   
            day = diff / nd;// 计算差多少天   
            hour = diff % nd / nh + day * 24;// 计算差多少小时   
            min = diff % nd % nh / nm + day * 24 * 60;// 计算差多少分钟   
            sec = diff % nd % nh % nm / ns;// 计算差多少秒
            
            StringBuilder buff = new StringBuilder();
            
            if(day > 0){
            	buff.append(day).append("天");
            }
            
            if((hour - day * 24) > 0){
            	buff.append(hour - day * 24).append("小时");
            }
            
            if((min - day * 24 * 60) > 0){
            	buff.append(min - day * 24 * 60).append("分钟");
            }
            
            if(sec > 0){
            	buff.append(sec).append("秒");
            }
            
//            String cha = day + "天" + (hour - day * 24) + "小时"  + (min - day * 24 * 60) + "分钟" + sec + "秒";
            
            return buff.toString();
        } catch (ParseException e) {   
            e.printStackTrace();   
        }
        return null;
	}
	
}
