package net.jeeshop.core.system.bean;

import net.jeeshop.core.dao.page.PagerModel;

/**
 * 权限
 * @author huangf
 *
 */
public class Privilege extends PagerModel{
	private String id;
	private String rid;
	private String mid;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public void clear() {
		// TODO Auto-generated method stub
		this.id = null;
		this.mid = null;
		this.rid = null;
	}

}
