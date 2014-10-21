package net.jeeshop.core.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.jeeshop.core.ManageContainer;


/**
 * 用户登录过滤器
 * 
 * @author huangf
 * 
 */
public class LoginFilter implements Filter {
//	SessionCountService sessionCountService;
	public void init(FilterConfig arg0) throws ServletException {
//		WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
//		sessionCountService = (SessionCountService) app.getBean("sessionCountService");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		if(true){
			chain.doFilter(request, response);
			return ;
		}
		
		HttpServletRequest req = (HttpServletRequest) request;
//		System.out.println(req.getServletPath());
//		System.out.println(req.getSession().isNew());
//		if(req.getSession().isNew()){
//			SessionCount sessionCount = new SessionCount();
//			sessionCount.setIp(getIp(req));
////			sessionCount.setStarttime()
//			sessionCountService.insert(sessionCount);
//		}
		
		//如果用户未访问action，直接反问的是JSP页面，则请求转到action
		if(req.getServletPath().startsWith("/index.jsp") && req.getSession().getAttribute("fromActionOut")==null){
			HttpServletResponse res = (HttpServletResponse) response;
			String url = req.getRequestURL().toString();
			String f = url.substring(0, url.indexOf(req.getContextPath()));
			String p = f + req.getContextPath() + "/index!q.action?id=-1";
//			System.out.println("sendRedirect...");
			res.sendRedirect(p);
			return;
		}
		//用户可能是从action中出来，要删除
		req.getSession().setAttribute("fromActionOut",null);
		
		if (req.getSession().getAttribute(ManageContainer.manage_session_user_info) == null){
			// 如果用户未登陆过，并且试图访问后台地址,并且访问的地址不是可以畅通浏览的地址,则重定向到后台登录页面
			if (req.getServletPath().startsWith("/manage") 
					&& !req.getServletPath().startsWith("/manage/admin.jsp") 
					&& !canPass(req.getServletPath())) {
				HttpServletResponse res = (HttpServletResponse) response;
				String url = req.getRequestURL().toString();
				String f = url.substring(0, url.indexOf(req.getContextPath()));
				String p = f + req.getContextPath() + "/manage/admin.jsp";
//				System.out.println("sendRedirect...");
				res.sendRedirect(p);
				return;
			}
			
			//其他，则可能访问到正确的页面或出现404
			
		}else{
			//如果用户已经登陆了，并且试图访问后台页面，则自动登陆后台
			if(req.getServletPath().equals("/manage") || req.getServletPath().equals("/manage/")){
				HttpServletResponse res = (HttpServletResponse) response;
				String url = req.getRequestURL().toString();
				String f = url.substring(0, url.indexOf(req.getContextPath()));
				String p = f + req.getContextPath() + "/manage/user!login.action";
//				System.out.println("sendRedirect...");
				res.sendRedirect(p);
				return;
			}
			
			//其他，则可能访问到正确的页面或出现404
		}
		
		chain.doFilter(request, response);
		
	}

	
	/** 获取IP */
	private String getIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}
    
	// 可以通过的URL集合
	static Map<String, String> canMap = new HashMap<String, String>();

	// 当前应该选中的菜单
	static Map<String, String> menuMap = new HashMap<String, String>();

	static {
		canMap.put("indexJsp1", "/index.jsp");
		canMap.put("admin", "/admin.jsp");
		canMap.put("indexJsp", "login/index.jsp");
		canMap.put("indexAction", "user!login.action");//用户登录页面
		// http://220.112.70.238:8080/crawl/barcode!query.action?id=1368333295621
//		canMap.put("crawl/barcode!query.action", "barcode!query.action");
//		canMap.put("barcode.do", "barcode.do");
//		canMap.put("/manage/news!toIndex.action", "/manage/news!toIndex.action");
		canMap.put("/manage/account!ajaxLogin.action", "/manage/account!ajaxLogin.action");//后台AJAX注销请求
		canMap.put("manage/account!loginOut.action", "manage/account!loginOut.action");//后台注销
//		canMap.put("/manage/account.action", "/manage/account.action");
//		canMap.put("/regeist/manage/account!ajaxLogin.action", "/regeist/manage/account!ajaxLogin.action");

//		menuMap.put("/toIndex.jsp", "");
//		menuMap.put("/manage/news!toIndex.action", "");
//		menuMap.put("/search!p.action", "");
//		menuMap.put("/search!g.action", "");
//		menuMap.put("/publish!publish.action", "");
//		menuMap.put("/download!download.action", "");
//		menuMap.put("/barcode!barcode.action", "");
//		menuMap.put("/about!about.action", "");
	}

	/**
	 * 能否通过
	 * 
	 * @param servletPath
	 * @return true:可以通过;false:不能通过
	 */
	private boolean canPass(String servletPath) {
		for (Iterator<Entry<String, String>> it = canMap.entrySet().iterator(); it
				.hasNext();) {
			Entry<String, String> entry = it.next();
			if (servletPath.indexOf(entry.getValue()) != -1) {
				return true;
			}
		}
		return false;
	}

	public void destroy() {

	}
}
