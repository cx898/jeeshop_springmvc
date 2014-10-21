//package net.jeeshop.core.interceptor;
//
//import java.io.PrintWriter;
//import java.io.StringWriter;
//
//import net.jeeshop.core.ManageContainer;
//import net.jeeshop.core.system.bean.User;
//import net.jeeshop.web.action.manage.system.MenuAction;
//import net.jeeshop.web.action.manage.system.UserAction;
//
//import org.apache.commons.lang.StringUtils;
//import org.apache.struts2.ServletActionContext;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import com.opensymphony.xwork2.ActionInvocation;
//import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
//
///**
// * 后台拦截器,负责对用户的登陆、404,500，action异常等进行拦截处理。
// * @author jqsl2012@163.com
// *
// */
//public class ManageInterceptor extends AbstractInterceptor {
//	private static final long serialVersionUID = 1L;
//	
//	private static final Logger logger = LoggerFactory.getLogger(ManageInterceptor.class);
//	public static final String login = "login";//转到登陆页面
//	public static final String error = "error";//访问action异常
//	public static final String not_privilege = "not_privilege";//没有菜单资源或功能权限
//	public static final String not_db_privilege = "not_db_privilege";//没有数据库增、删、改、查 的权限
//
//	public String intercept(ActionInvocation actionInvocation) throws Exception {
//		logger.error("ManageInterceptor.intercept...");
//		try {
//			return intercept0(actionInvocation);
//		} catch (Throwable e) {
//			e.printStackTrace();
//			String msg = e.getMessage();
//			logger.error("msg="+msg);
//			if(StringUtils.isNotBlank(msg)){
//				ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_exception_error, msg);
//			}else{
//				ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_exception_error, "未知！");
//			}
//			
//			StringWriter sw = new StringWriter();
//			PrintWriter pw = new PrintWriter(sw);
//			e.printStackTrace(pw);
//			ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_exception_stack_error, sw.getBuffer().toString());
//		}
//		return error;
//	}
//	
//	private String intercept0(ActionInvocation actionInvocation) throws Exception {
//		String actionName = actionInvocation.getProxy().getActionName();
//		Object action = actionInvocation.getProxy().getAction();
//		String method = actionInvocation.getProxy().getMethod();
//		String namespace = actionInvocation.getProxy().getNamespace();
//		Object action2 = actionInvocation.getAction();
//		
//		if(StringUtils.isBlank(method)){
//			throw new NullPointerException("操作的action的method不能为空！");
//		}
//		
//		logger.error(">>ManageInterceptor==actionName="+actionName+";method="+method+";action="+action+";namespace="+namespace);
////		logger.error(">>ManageInterceptor==actionName="+actionName+";method="+method+";action="+action+";namespace="+namespace+";action2="+action2);
////		String url = actionName+"!"+method+".action";
////		StringBuffer urlBuff = new StringBuffer(actionName);
////		urlBuff.append("!").append(method).append(".action");
////		actionInvocation.getInvocationContext().
//		
//		if (action2 instanceof UserAction || action2 instanceof MenuAction) {
////			logger.error("不对用户登陆进行拦截。不对加载权限资源进行拦截");
//			return actionInvocation.invoke();
//		}
////		HttpSession session = ServletActionContext.getRequest().getSession();
//		User user = (User) ServletActionContext.getRequest().getSession().getAttribute(ManageContainer.manage_session_user_info);
//		if(user==null){
//			logger.error("用户失效，请登录！");
//			//转到登陆界面
////			ServletActionContext.getResponse().sendRedirect(SystemManager.systemSetting.getManageHttp()+"/error.jsp");
//			return login;
//		}
//		
//		if(user.getUsername().equals("admin")){
//			//如果是内置的系统超级管理员访问，则不予拦截，可以访问任何资源。
//			return actionInvocation.invoke();
//		}
//		
//		if(user.getUsername().equals("test1")){
//			if((actionName.equals("pay") && method.equals("toEdit")) 
//					|| actionName.equals("oss") && method.equals("toEdit")){
////				throw new RuntimeException("test1账号不具备此权限！");
//				ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_db_error,"测试账号不具备此权限！");
//				return not_db_privilege;
//			}
//		}
//		
//		//数据库权限检查，数据库的权限和action方法的名词一一对应
//		if(user.getDbPrivilegeMap()!=null && user.getDbPrivilegeMap().size()>0){
//			String dbMethod = null;//数据库的增、删、改、查操作
//			/*
//			 * 将action的方法前缀映射为数据库的操作
//			 */
//			if(method.startsWith(ManageContainer.db_insert)){
//				dbMethod = ManageContainer.db_insert;
//			}else if(method.startsWith(ManageContainer.db_update)){
//				dbMethod = ManageContainer.db_update;
//			}else if(method.startsWith(ManageContainer.db_delete)){
//				dbMethod = ManageContainer.db_delete;
//			}
//			
////			logger.error("optionMethod="+dbMethod);
//			if(dbMethod!=null){
//				logger.error("action-method权限检查：user.getDbPrivilegeMap()="+user.getDbPrivilegeMap()+",method="+method);
//				logger.error("user.getDbPrivilegeMap().get(optionMethod)="+user.getDbPrivilegeMap().get(dbMethod));
//				String op = user.getDbPrivilegeMap().get(dbMethod);//获取此人的权限
//				if(StringUtils.isBlank(op)){
//					/*
//					 * 如果此人没有dbMethod对应的数据库操作的权限，则判断是不具备哪一种权限
//					 */
//					if(dbMethod.equals(ManageContainer.db_insert)){
//						logger.error(ManageContainer.db_privilege_insert_error);
//						ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_db_error, ManageContainer.db_privilege_insert_error);
//					}else if(dbMethod.equals(ManageContainer.db_update)){
//						logger.error(ManageContainer.db_privilege_update_error);
//						ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_db_error, ManageContainer.db_privilege_update_error);
//					}else if(dbMethod.equals(ManageContainer.db_delete)){
//						logger.error(ManageContainer.db_privilege_delete_error);
//						ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_db_error, ManageContainer.db_privilege_delete_error);
//					}else{
//						logger.error("原因未知！请通知管理员检查原因！");
//						ServletActionContext.getRequest().getSession().setAttribute(ManageContainer.action_db_error, "原因未知！请通知管理员检查原因！");
//					}
//					return not_db_privilege;
//				} 
//			}
//		}
//		
//		logger.error("ManageInterceptor.actionInvocation.invoke().");
//		return actionInvocation.invoke();
//		
//		//对其他用户则进行权限验证，没有权限，则提示无权限。
////		if(PrivilegeUtil.check(ServletActionContext.getRequest().getSession(), urlBuff.toString())){
////			return actionInvocation.invoke();
////		}else{
////			logger.error("没有权限！");
//////			ServletActionContext.getResponse().sendRedirect(SystemManager.systemSetting.getManageHttp()+"/error.jsp");
////			return not_privilege;
////		}
//		
////		// 对LoginAction不做该项拦截
////		Object action = actionInvocation.getAction();
////		if (action instanceof LoginAction) {
////			System.out
////					.println("exit check login, because this is login action.");
////			return actionInvocation.invoke();
////		}
////
////		// 确认Session中是否存在LOGIN
////		Map session = actionInvocation.getInvocationContext().getSession();
////		String login = (String) session.get(LOGIN_KEY);
////		if (login != null && login.length() > 0) {
////			// 存在的情况下进行后续操作。
////			System.out.println("already login!");
////			return actionInvocation.invoke();
////		} else {
////			// 否则终止后续操作，返回LOGIN
////			System.out.println("no login, forward login page!");
////			return LOGIN_PAGE;
////		}
//	}
//}
