package net.jeeshop.core.system.bean;

import net.jeeshop.core.dao.page.PagerModel;

/**
 * 资源
 * @author huangf
 *
 */
public class Menu extends PagerModel {
	private String id;
	private String pid;
	private String url;
	private String name;
	private int orderNum;
	private String type;// module：模块 ; page：页面 ; button：功能

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void clear() {
		id = null;
		pid = null;
		url = null;
		name = null;
		orderNum = 0;
		type = null;

	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "[id:" + id + ",pid:" + pid + "]";
	}

}
