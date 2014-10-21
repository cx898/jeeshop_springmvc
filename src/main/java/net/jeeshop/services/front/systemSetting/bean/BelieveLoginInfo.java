package net.jeeshop.services.front.systemSetting.bean;

import java.util.HashMap;
import java.util.Map;

import net.jeeshop.core.dao.page.ClearBean;

import com.alibaba.fastjson.JSON;

/**
 * 信任登陆配置
 * 
 * @author jqsl2012@163.com
 * 
 */
@Deprecated
public class BelieveLoginInfo implements ClearBean{
	private BelieveLoginConfig qq;// qq信任登陆配置
	private BelieveLoginConfig sinawb;// 新浪微博信任登陆配置

	public void clear() {
		if(this.qq!=null){
			this.qq.clear();
			this.qq = null;
		}
		
		if(this.sinawb!=null){
			this.sinawb.clear();
			this.sinawb = null;
		}
	}

	/**
	 * 获取信任登陆的JSON配置
	 * @return
	 */
	public String getJsonStr() {
		Map<String, Map<String, String>> map = new HashMap<String, Map<String, String>>();
		map.put("qq", qq.getMap());
		map.put("sinawb", sinawb.getMap());

		return JSON.toJSONString(map);
	}

	public BelieveLoginConfig getQq() {
		return qq;
	}

	public void setQq(BelieveLoginConfig qq) {
		this.qq = qq;
	}

	public BelieveLoginConfig getSinawb() {
		return sinawb;
	}

	public void setSinawb(BelieveLoginConfig sinawb) {
		this.sinawb = sinawb;
	}

	@Override
	public String toString() {
		return "BelieveLoginInfo [qq=" + qq + ", sinawb=" + sinawb + "]";
	}

	
	
}
