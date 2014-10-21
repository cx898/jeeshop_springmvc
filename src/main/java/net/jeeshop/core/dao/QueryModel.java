package net.jeeshop.core.dao;

import java.io.Serializable;

import net.jeeshop.core.dao.page.PagerModel;


/**
 * 后台公共的查询条件层
 * @author huangf
 *
 */
public class QueryModel extends PagerModel implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/*
	 * 记录创建日期查询条件
	 */
	protected String startDate;// 订单开始时间
	protected String endDate;// 订单结束时间
	
	@Override
	public void clear() {
		super.clear();
		this.startDate = null;
		this.endDate = null;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
