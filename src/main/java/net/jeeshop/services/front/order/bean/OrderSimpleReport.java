package net.jeeshop.services.front.order.bean;

import net.jeeshop.core.dao.page.ClearBean;

/**
 * 订单简单报表信息
 * 
 * @author jqsl2012@163.com
 * 
 */
public class OrderSimpleReport implements ClearBean {
	private int orderWaitPayCount;
	private int orderCancelCount;
	private int orderCompleteCount;

	public int getOrderWaitPayCount() {
		return orderWaitPayCount;
	}

	public void setOrderWaitPayCount(int orderWaitPayCount) {
		this.orderWaitPayCount = orderWaitPayCount;
	}

	public int getOrderCancelCount() {
		return orderCancelCount;
	}

	public void setOrderCancelCount(int orderCancelCount) {
		this.orderCancelCount = orderCancelCount;
	}

	public int getOrderCompleteCount() {
		return orderCompleteCount;
	}

	public void setOrderCompleteCount(int orderCompleteCount) {
		this.orderCompleteCount = orderCompleteCount;
	}

	@Override
	public String toString() {
		return "OrderSimpleReport [orderWaitPayCount=" + orderWaitPayCount
				+ ", orderCancelCount=" + orderCancelCount
				+ ", orderCompleteCount=" + orderCompleteCount + "]";
	}

	public void clear() {
		this.orderWaitPayCount = 0;
		this.orderCancelCount = 0;
		this.orderCompleteCount = 0;
	}

}
