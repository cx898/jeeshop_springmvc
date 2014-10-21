package net.jeeshop.core.task;

import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

import net.jeeshop.core.front.SystemManager;
import net.jeeshop.services.manage.emailNotifyProduct.EmailNotifyProductService;

//import org.apache.struts2.ServletActionContext;
import org.slf4j.LoggerFactory;

//import com.opensymphony.xwork2.ActionContext;

/**
 * 系统自动到货通知定时器
 * 
 * @author huangf
 * 
 */
public class SystemAutoNotifyTask implements Runnable {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SystemAutoNotifyTask.class);
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private EmailNotifyProductService emailNotifyProductService;

	public void setEmailNotifyProductService(
			EmailNotifyProductService emailNotifyProductService) {
		this.emailNotifyProductService = emailNotifyProductService;
	}

	/**
	 * 1、查询出没有发送通知的系统到货通知列表
	 * 2、从第一步查询出的列表中去分析这些数据对应的商品是否缺货，如果不缺货，则按照指定的邮件模板发送邮件到指定邮箱，通知商品已到货。
	 */
	@Override
	public void run() {
//		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
//		WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
//		EmailNotifyProductService emailNotifyProductService = (EmailNotifyProductService) app.getBean("emailNotifyProductServiceManage");
		logger.error("emailNotifyProductService="+emailNotifyProductService);
		while (true) {
			try {
//				TimeUnit.DAYS.sleep(1);
				TimeUnit.SECONDS.sleep(Long.valueOf(SystemManager.getInstance().get("task_SystemAutoNotifyTask_time")));
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			logger.error("OrderCancelTask.run...");
			emailNotifyProductService.autoNotify();
		}
	}

}
