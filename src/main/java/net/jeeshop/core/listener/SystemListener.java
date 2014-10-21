package net.jeeshop.core.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.jeeshop.core.TaskManager;
import net.jeeshop.core.front.SystemManager;
import net.jeeshop.core.oscache.FrontCache;
import net.jeeshop.core.oscache.ManageCache;

import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


/**
 * 系统配置加载监听器
 * 
 * @author huangf
 * 
 */
public class SystemListener implements ServletContextListener {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SystemListener.class);
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent arg0) {
		try {
			SystemManager.getInstance();

			WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
			FrontCache frontCache = (FrontCache) app.getBean("frontCache");
			ManageCache manageCache = (ManageCache) app.getBean("manageCache");
			frontCache.loadAllCache();
			manageCache.loadAllCache();
			
			TaskManager taskManager = (TaskManager) app.getBean("taskManager");
			taskManager.start();
		} catch (Throwable e) {
			e.printStackTrace();
			logger.error("System load faild!"+e.getMessage());
			try {
				throw new Exception("系统初始化失败！");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

}
