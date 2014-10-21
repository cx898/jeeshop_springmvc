package net.jeeshop.core.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.jeeshop.core.FrontContainer;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/** 
 * @author super
 * 异常处理类
 * @version
 */
@Controller
public class ExceptionHandlerCtrl implements HandlerExceptionResolver {
	private static Logger logger = Logger.getLogger(ExceptionHandlerCtrl.class.getName());
	@Autowired
	HttpSession session;
	
	/**
	 * 统一的异常处理，把异常信息写入日志
	 * @author super
	 * @param request--出现异常的请求
	 * @param response
	 * @param obj
	 * @param exception--出现异常的对象
	 */
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object obj, Exception exception) {
		String requestUri = request.getRequestURI();
		if(requestUri.contains("/manage")){  // 后台发生异常
			logger.error("manager exception : "+exception.getMessage());
			request.getSession().setAttribute(FrontContainer.action_exception_error, exception.getMessage());
			return new ModelAndView("redirect:/manage/common/error.jsp");  
		}else{
			logger.error("front exception : "+exception.getMessage());
			request.getSession().setAttribute(FrontContainer.action_exception_error, exception.getMessage());
			return new ModelAndView("redirect:/error.jsp");  
		}
	}
}
