package net.jeeshop.core;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import net.jeeshop.core.task.CancelOrderTask;
import net.jeeshop.core.task.ManageCacheTask;
import net.jeeshop.core.task.SystemAutoNotifyTask;
import net.jeeshop.services.manage.task.bean.Task;

import org.apache.commons.lang.time.DateUtils;
import org.slf4j.LoggerFactory;

import com.aliyun.common.utils.DateUtil;



/**
 * 任务管理，负责管理定时启动的任务。
 * 
 * @author huangf
 * 
 */
public class TaskManager {
	private static final org.slf4j.Logger logger = LoggerFactory
			.getLogger(TaskManager.class);
	// 秒钟
//	private static final long task_default_seconds_time = Integer.valueOf(SystemManager.getInstance().get("task_default_seconds_time"));
	private static final ExecutorService pool = Executors.newCachedThreadPool();
	public static final Map<String, Task> taskPool = new HashMap<String, Task>();//任务池
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private CancelOrderTask cancelOrderTask;
	private SystemAutoNotifyTask systemAutoNotifyTask;
	private ManageCacheTask manageCacheTask;

	public void setManageCacheTask(ManageCacheTask manageCacheTask) {
		this.manageCacheTask = manageCacheTask;
	}

	public void setSystemAutoNotifyTask(
			SystemAutoNotifyTask systemAutoNotifyTask) {
		this.systemAutoNotifyTask = systemAutoNotifyTask;
	}

	public void setCancelOrderTask(CancelOrderTask cancelOrderTask) {
		this.cancelOrderTask = cancelOrderTask;
	}

	public static Map<String, Task> getTaskpool() {
		return taskPool;
	}

	public void start() {
		logger.error("TaskManager.start()");
		pool.execute(cancelOrderTask);
		pool.execute(systemAutoNotifyTask);
		pool.execute(manageCacheTask);
		
		//根据任务的完整类名，去实例化类对象，并分配线程去执行任务，同时将线程绑定到任务上，以后可以方便的对线程进行start/stop操作
//		for(Iterator<Entry<String, Task>> it = taskPool.entrySet().iterator();it.hasNext();){
//			Task task = it.next().getValue();
//			
//			doOneTask0(task);
//		}
	}

	//处理某个任务
	private void doOneTask0(Task task) {
		logger.error("doOneTask0...");
		
		try {
			Runnable runnable = (Runnable) Class.forName(task.getClz()).newInstance();
			if(runnable!=null){
				Thread thread = new Thread(runnable);
				task.setThread(thread);
				
				//计算出此任务下一次的执行时间点
				String nextWorkTime = null;
				if(task.getUnit().equalsIgnoreCase("DAYS")){
					nextWorkTime = sdf.format(DateUtils.addDays(new Date(), Integer.valueOf(task.getSleep())));
				}else if(task.getUnit().equalsIgnoreCase("HOURS")){
					nextWorkTime = sdf.format(DateUtils.addHours(new Date(), Integer.valueOf(task.getSleep())));
				}else if(task.getUnit().equalsIgnoreCase("MINUTES")){
					nextWorkTime = sdf.format(DateUtils.addMinutes(new Date(), Integer.valueOf(task.getSleep())));
				}else if(task.getUnit().equalsIgnoreCase("SECONDS")){
					nextWorkTime = sdf.format(DateUtils.addSeconds(new Date(), Integer.valueOf(task.getSleep())));
				}else if(task.getUnit().equalsIgnoreCase("MILLISECONDS")){
					nextWorkTime = sdf.format(DateUtils.addMilliseconds(new Date(), Integer.valueOf(task.getSleep())));
				}
				task.setNextWorkTime(nextWorkTime);
				task.setCurrentStatus(Task.task_currentStatus_wait);
						
				thread.setDaemon(true);
				thread.setName(task.getCode());
				thread.start();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过任务代号得到任务对象
	 * @param taskCode
	 * @return
	 */
	public static Task getTask(String taskCode){
		return taskPool.get(taskCode);
	}
	
	public void startTask(String taskCode){
		Task task = taskPool.get(taskCode);
		if(task.getThread()==null){
			doOneTask0(task);
		}else{
			if(task.getThread().isAlive()){
				
			}
		}
	}
	
	public void stopTask(String taskCode){
		
	}
}
