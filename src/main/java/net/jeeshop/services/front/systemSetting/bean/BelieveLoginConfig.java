package net.jeeshop.services.front.systemSetting.bean;

import java.util.HashMap;
import java.util.Map;

import net.jeeshop.core.dao.page.ClearBean;



/**
 * 信任登陆配置
 * 
 * @author jqsl2012@163.com
 * 
 */
@Deprecated
public class BelieveLoginConfig implements ClearBean{
	
	private String status;
	private String app_ID;//引用ID
	private String app_KEY;//秘钥
	private String redirect_URI;//回调地址
	
	public void clear() {
		this.status = null;
		this.app_ID = null;
		this.app_KEY = null;
		this.redirect_URI = null;
	}

	public Map<String,String> getMap(){
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", this.getStatus());
		map.put("app_ID", this.getApp_ID());
		map.put("app_KEY", this.getApp_KEY());
		map.put("redirect_URI", this.getRedirect_URI());
		return map;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApp_ID() {
		return app_ID;
	}

	public void setApp_ID(String app_ID) {
		this.app_ID = app_ID;
	}

	public String getApp_KEY() {
		return app_KEY;
	}

	public void setApp_KEY(String app_KEY) {
		this.app_KEY = app_KEY;
	}

	public String getRedirect_URI() {
		return redirect_URI;
	}

	public void setRedirect_URI(String redirect_URI) {
		this.redirect_URI = redirect_URI;
	}

	@Override
	public String toString() {
		return "BelieveLoginConfig [status=" + status + ", app_ID=" + app_ID
				+ ", app_KEY=" + app_KEY + ", redirect_URI=" + redirect_URI
				+ "]";
	}

}
