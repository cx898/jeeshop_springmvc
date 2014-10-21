package net.jeeshop.services.common;

import java.io.Serializable;

import net.jeeshop.core.dao.page.PagerModel;


public class Lable extends PagerModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String desc1;
	private int type;
	private int lableIDSum;
	private int typeSum;
	private int order1;

	@Override
	public void clear() {
		super.clear();

		id = null;
		name = null;
		desc1 = null;
		type = 0;
		lableIDSum = 0;
		typeSum = 0;
		order1 = 0;
	}

	public int getOrder1() {
		return order1;
	}

	public void setOrder1(int order1) {
		this.order1 = order1;
	}

	public int getLableIDSum() {
		return lableIDSum;
	}

	public void setLableIDSum(int lableIDSum) {
		this.lableIDSum = lableIDSum;
	}

	public int getTypeSum() {
		return typeSum;
	}

	public void setTypeSum(int typeSum) {
		this.typeSum = typeSum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc1() {
		return desc1;
	}

	public void setDesc1(String desc1) {
		this.desc1 = desc1;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
