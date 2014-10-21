package net.jeeshop.core.interceptor;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.jeeshop.core.FrontContainer;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class FrontMvcInterceptor implements HandlerInterceptor{
	private static final long serialVersionUID = 1L;

	private static final Logger logger = LoggerFactory.getLogger(FrontMvcInterceptor.class);
	public static final String error = "/error.jsp";//访问action异常
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		logger.info("=========================================== after exception =============");
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {

		try {
			return true;
//			return intercept0(actionInvocation);
		} catch (Throwable e) {
			e.printStackTrace();
			String msg = e.getMessage();
			logger.error("msg="+msg);
			if(StringUtils.isNotBlank(msg)){
				request.getSession().setAttribute(FrontContainer.action_exception_error, msg);
			}else{
				request.getSession().setAttribute(FrontContainer.action_exception_error, "未知！");
			}
			
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			request.getSession().setAttribute(FrontContainer.action_exception_stack_error, sw.getBuffer().toString());
		}
		/// 前面没有 return true，执行到此 说明发生错误
		response.sendRedirect(error);
		return false;
	}

}
