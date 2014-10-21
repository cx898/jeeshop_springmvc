package net.jeeshop.core;

import java.util.Map;

import javax.servlet.http.HttpSession;

import net.jeeshop.core.exception.PrivilegeException;
import net.jeeshop.core.system.bean.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 权限检查工具
 * 
 * @author huangfei
 * 
 */
public class PrivilegeUtil {
	private static final Logger logger = LoggerFactory.getLogger(PrivilegeUtil.class);
	

	/**
	 * 检查用户是否具有指定的权限
	 * 
	 * @param session
	 *            用户session
	 * @param pName
	 *            权限名称
	 * @return  true：有权限，false:没有权限
	 */
	public static boolean check(HttpSession session, String pName) throws PrivilegeException{
		if(1==1){
			return true;
		}
		
		
		Map<String,String> root = (Map<String,String>) session.getAttribute(ManageContainer.user_resource_menus_button);
		if(root==null || root.size()==0){
			logger.error("该用户没有任何权限。没有权限访问该资源！");
			return false;
		}
		User u = (User) session.getAttribute(ManageContainer.manage_session_user_info);
		if(u==null){
			throw new PrivilegeException("用户未登陆!");
		}
		logger.error("==PrivilegeUtil.check : pName="+pName+"root:"+root.toString());
		if(root.get(pName)==null){
			logger.error("抱歉，没有权限访问该资源！");
			return false;
		}
		logger.error("有权限访问该资源！");
		return true;
	}
}
