package net.jeeshop.services.manage.order.bean;

/**
 * 后台首页综合报表统计数据
 * 
 * @author jqsl2012@163.com
 * 
 */
public class OrdersReport {
	private int cancelCount;
//	private AtomicInteger notPayCount;// 未付款订单数
	private volatile int notPayCount;// 未付款订单数
	private int payButNotPassCount;// 已付款，但未审核订单数
	private int waitSendGoodsCount;// 等待发货订单数

	private int WAIT_SELLER_AGREE;// 退款协议等待卖家确认中
	private int SELLER_REFUSE_BUYER;// 卖家不同意协议,等待买家修改
	private int WAIT_BUYER_RETURN_GOODS;// 退款协议达成,等待买家退货
	private int WAIT_SELLER_CONFIRM_GOODS;// 等待卖家收货
	// private String REFUND_SUCCESS;//退款成功
	// private String REFUND_CLOSED;//退款关闭

	private int outOfStockProductCount;// 缺货商品数
	private int notReplyCommentCount;//会员评论数

	public int getSELLER_REFUSE_BUYER() {
		return SELLER_REFUSE_BUYER;
	}

	public void setSELLER_REFUSE_BUYER(int sELLER_REFUSE_BUYER) {
		SELLER_REFUSE_BUYER = sELLER_REFUSE_BUYER;
	}

	public int getWaitSendGoodsCount() {
		return waitSendGoodsCount;
	}

	public void setWaitSendGoodsCount(int waitSendGoodsCount) {
		this.waitSendGoodsCount = waitSendGoodsCount;
	}

	public int getCancelCount() {
		return cancelCount;
	}

	public void setCancelCount(int cancelCount) {
		this.cancelCount = cancelCount;
	}

	public int getWAIT_SELLER_AGREE() {
		return WAIT_SELLER_AGREE;
	}

	public void setWAIT_SELLER_AGREE(int wAIT_SELLER_AGREE) {
		WAIT_SELLER_AGREE = wAIT_SELLER_AGREE;
	}

	public int getWAIT_BUYER_RETURN_GOODS() {
		return WAIT_BUYER_RETURN_GOODS;
	}

	public void setWAIT_BUYER_RETURN_GOODS(int wAIT_BUYER_RETURN_GOODS) {
		WAIT_BUYER_RETURN_GOODS = wAIT_BUYER_RETURN_GOODS;
	}

	public int getWAIT_SELLER_CONFIRM_GOODS() {
		return WAIT_SELLER_CONFIRM_GOODS;
	}

	public void setWAIT_SELLER_CONFIRM_GOODS(int wAIT_SELLER_CONFIRM_GOODS) {
		WAIT_SELLER_CONFIRM_GOODS = wAIT_SELLER_CONFIRM_GOODS;
	}

	public int getNotPayCount() {
		return notPayCount;
	}

	public void setNotPayCount(int notPayCount) {
		synchronized (this) {
			this.notPayCount = notPayCount;
		}
	}

//	public AtomicInteger getNotPayCount() {
//		return notPayCount;
//	}
//
//	public void setNotPayCount(AtomicInteger notPayCount) {
//		this.notPayCount = notPayCount;
//	}

	public int getPayButNotPassCount() {
		return payButNotPassCount;
	}

	public void setPayButNotPassCount(int payButNotPassCount) {
		this.payButNotPassCount = payButNotPassCount;
	}

	public int getOutOfStockProductCount() {
		return outOfStockProductCount;
	}

	public void setOutOfStockProductCount(int outOfStockProductCount) {
		this.outOfStockProductCount = outOfStockProductCount;
	}

	public int getNotReplyCommentCount() {
		return notReplyCommentCount;
	}

	public void setNotReplyCommentCount(int notReplyCommentCount) {
		this.notReplyCommentCount = notReplyCommentCount;
	}

	@Override
	public String toString() {
		return "OrdersReport [cancelCount=" + cancelCount + ", notPayCount="
				+ notPayCount + ", payButNotPassCount=" + payButNotPassCount
				+ ", waitSendGoodsCount=" + waitSendGoodsCount
				+ ", WAIT_SELLER_AGREE=" + WAIT_SELLER_AGREE
				+ ", SELLER_REFUSE_BUYER=" + SELLER_REFUSE_BUYER
				+ ", WAIT_BUYER_RETURN_GOODS=" + WAIT_BUYER_RETURN_GOODS
				+ ", WAIT_SELLER_CONFIRM_GOODS=" + WAIT_SELLER_CONFIRM_GOODS
				+ ", outOfStockProductCount=" + outOfStockProductCount
				+ ", notReplyCommentCount=" + notReplyCommentCount + "]";
	}

}
