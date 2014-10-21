package net.jeeshop.core.interceptor;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.jeeshop.core.ManageContainer;
import net.jeeshop.core.system.bean.User;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class ManagerMvcInterceptor implements HandlerInterceptor{
private static final long serialVersionUID = 1L;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerMvcInterceptor.class);
	public static final String login =            "/manage/admin.jsp";//转到登陆页面
//	public static final String not_privilege =    "/manage/common/error.jsp";//没有菜单资源或功能权限
	public static final String not_db_privilege = "/manage/common/not_db_privilege.jsp";//没有数据库增、删、改、查 的权限

	
	public static final String error            = "/manage/common/error.jsp";//访问action异常
	
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {

		logger.error("ManageInterceptor.intercept...");
		try {
			return preHandle0(request,response,handler);
		} catch (Throwable e) {
			e.printStackTrace();
			String msg = e.getMessage();
			logger.error("msg="+msg);
			if(StringUtils.isNotBlank(msg)){
				request.getSession().setAttribute(ManageContainer.action_exception_error, msg);
			}else{
				request.getSession().setAttribute(ManageContainer.action_exception_error, "未知！");
			}
			
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			request.getSession().setAttribute(ManageContainer.action_exception_stack_error, sw.getBuffer().toString());
		}
		response.sendRedirect(error);
		return false;
	}
	
//	private boolean preHandle0()
	
	
	public boolean preHandle0(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		boolean result = true;
		HttpSession session=request.getSession();
		String uri=request.getServletPath();
		logger.error(">>ManageMvcInterceptor==uri="+uri);
		if(uri.contains("/manage/user") || uri.contains("/manage/menu")){
//			logger.error("不对用户登陆进行拦截。不对加载权限资源进行拦截");
			return true;
		}
		
		User user = (User) session.getAttribute(ManageContainer.manage_session_user_info);
		if(user==null){
			logger.error("用户失效，请登录！");
			//转到登陆界面
			response.sendRedirect(login);
			result = false;
		}
		
		if(user.getUsername().equals("admin")){
			//如果是内置的系统超级管理员访问，则不予拦截，可以访问任何资源。
			response.sendRedirect(request.getContextPath() + "/");
		}
		
		if(user.getUsername().equals("test1")){
			if((uri.contains("pay") && uri.contains("toEdit")) 
					|| uri.contains("oss") && uri.contains("toEdit")){
//				throw new RuntimeException("test1账号不具备此权限！");
				session.setAttribute(ManageContainer.action_db_error,"测试账号不具备此权限！");
				response.sendRedirect(not_db_privilege);
				result = false;
			}
		}
		
		//数据库权限检查，数据库的权限和action方法的名词一一对应
		if(user.getDbPrivilegeMap()!=null && user.getDbPrivilegeMap().size()>0){
			String dbMethod = null;//数据库的增、删、改、查操作
			/*
			 * 将action的方法前缀映射为数据库的操作
			 */
			
			if(uri.contains(ManageContainer.db_insert)){
				dbMethod = ManageContainer.db_insert;
			}else if(uri.contains(ManageContainer.db_update)){
				dbMethod = ManageContainer.db_update;
			}else if(uri.contains(ManageContainer.db_delete)){
				dbMethod = ManageContainer.db_delete;
			}
			
//			logger.error("optionMethod="+dbMethod);
			if(dbMethod!=null){
				logger.error("action-method权限检查：user.getDbPrivilegeMap()="+user.getDbPrivilegeMap()+",method=");
				logger.error("user.getDbPrivilegeMap().get(optionMethod)="+user.getDbPrivilegeMap().get(dbMethod));
				String op = user.getDbPrivilegeMap().get(dbMethod);//获取此人的权限
				if(StringUtils.isBlank(op)){
					/*
					 * 如果此人没有dbMethod对应的数据库操作的权限，则判断是不具备哪一种权限
					 */
					if(dbMethod.equals(ManageContainer.db_insert)){
						logger.error(ManageContainer.db_privilege_insert_error);
						session.setAttribute(ManageContainer.action_db_error, ManageContainer.db_privilege_insert_error);
					}else if(dbMethod.equals(ManageContainer.db_update)){
						logger.error(ManageContainer.db_privilege_update_error);
						session.setAttribute(ManageContainer.action_db_error, ManageContainer.db_privilege_update_error);
					}else if(dbMethod.equals(ManageContainer.db_delete)){
						logger.error(ManageContainer.db_privilege_delete_error);
						session.setAttribute(ManageContainer.action_db_error, ManageContainer.db_privilege_delete_error);
					}else{
						logger.error("原因未知！请通知管理员检查原因！");
						session.setAttribute(ManageContainer.action_db_error, "原因未知！请通知管理员检查原因！");
					}
//					return not_db_privilege;  返回 not_db_privilege视图
					response.sendRedirect(not_db_privilege);
					result = false;
				} 
			}
		}
		logger.error("ManageInterceptor.actionInvocation.invoke().");
		return result;
	}

}
