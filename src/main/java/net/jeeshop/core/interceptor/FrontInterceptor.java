//package net.jeeshop.core.interceptor;
//
//import java.io.PrintWriter;
//import java.io.StringWriter;
//
//import net.jeeshop.core.FrontContainer;
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
// * 前台拦截器，负责对前台404,、500、action访问产生的异常进行拦截处理
// * @author jqs2012@163.com
// *
// */
//public class FrontInterceptor extends AbstractInterceptor {
//	private static final long serialVersionUID = 1L;
//
//	private static final Logger logger = LoggerFactory.getLogger(ManageInterceptor.class);
//	public static final String error = "error";//访问action异常
//
//	public String intercept(ActionInvocation actionInvocation) throws Exception {
//		logger.error("CommonInterceptor.intercept...");
//		try {
//			return actionInvocation.invoke();
////			return intercept0(actionInvocation);
//		} catch (Throwable e) {
//			e.printStackTrace();
//			String msg = e.getMessage();
//			logger.error("msg="+msg);
//			if(StringUtils.isNotBlank(msg)){
//				ServletActionContext.getRequest().getSession().setAttribute(FrontContainer.action_exception_error, msg);
//			}else{
//				ServletActionContext.getRequest().getSession().setAttribute(FrontContainer.action_exception_error, "未知！");
//			}
//			
//			StringWriter sw = new StringWriter();
//			PrintWriter pw = new PrintWriter(sw);
//			e.printStackTrace(pw);
//			ServletActionContext.getRequest().getSession().setAttribute(FrontContainer.action_exception_stack_error, sw.getBuffer().toString());
//		}
//		return error;
//	}
//	
//	@Deprecated
//	private String intercept0(ActionInvocation actionInvocation) throws Exception {
//		String actionName = actionInvocation.getProxy().getActionName();
//		Object action = actionInvocation.getProxy().getAction();
//		String method = actionInvocation.getProxy().getMethod();
//		String namespace = actionInvocation.getProxy().getNamespace();
//		Object action2 = actionInvocation.getAction();
//		
//		logger.error("========CommonInterceptor interceptor! actionName="+actionName+";action="+action+";method="+method+";namespace="+namespace+";action2="+action2);
//		return actionInvocation.invoke();
//		
//	}
//}
