//package net.jeeshop.core.listener;
//
//import java.util.Date;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSessionEvent;
//import javax.servlet.http.HttpSessionListener;
//
//import net.jeeshop.core.util.CountUtil;
//import net.jeeshop.services.manage.sessionCount.SessionCountService;
//import net.jeeshop.services.manage.sessionCount.bean.SessionCount;
//
//import org.apache.struts2.ServletActionContext;
//import org.springframework.web.context.WebApplicationContext;
//import org.springframework.web.context.support.WebApplicationContextUtils;
//
//import com.opensymphony.xwork2.ActionContext;
//@Deprecated
//public class CountListener implements HttpSessionListener {
//
//	@Override
//	public void sessionCreated(HttpSessionEvent arg0) {
//		
//		WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(arg0.getSession().getServletContext());
//		SessionCountService sessionCountService = (SessionCountService) app.getBean("sessionCountService");
//		
//		System.out.println("session创建："+arg0.getSession().isNew());
////		CountUtil xmlcount = CountUtil.getInstance();
//		if (arg0.getSession().isNew()) {
//			SessionCount sessionCount = new SessionCount();
//			sessionCount.setIp(getIp((HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST)));
//			sessionCountService.insert(sessionCount );
//			
////			(HttpServletRequest)ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
////			System.out.println("是新创建的session");
////			xmlcount.addcount(new Date());// 增加访问量
////			int n = xmlcount.getTotalCount();// 取总访问量
////			String count = Integer.toString(n);
////			arg0.getSession().putValue("count", count);
//		}
//	}
//
//	@Override
//	public void sessionDestroyed(HttpSessionEvent arg0) {
//		// TODO Auto-generated method stub
////		System.out.println("session销毁");
//	}
//	/** 获取IP */
//	private String getIp(HttpServletRequest request) {
//		String ip = request.getHeader("x-forwarded-for");
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("Proxy-Client-IP");
//		}
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getHeader("WL-Proxy-Client-IP");
//		}
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//			ip = request.getRemoteAddr();
//		}
//
//		return ip;
//	}
//}
