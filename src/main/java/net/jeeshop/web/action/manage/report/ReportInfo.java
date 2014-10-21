package net.jeeshop.web.action.manage.report;

import java.io.Serializable;

import net.jeeshop.core.dao.QueryModel;
import net.jeeshop.core.dao.page.PagerModel;


/**
 * 报表数据对象
 * 
 * @author huangf
 * 
 */
public class ReportInfo extends QueryModel implements Serializable {
	private String productID;
	private String productName;//商品名称
	private int productSellCount;// 报表.商品销售总数
	private String createdate;// 订单创建日期
	private double sumAmount;// 订单支付汇总金额
	
	private String amountArr;
	private String orderdateArr;

	public void clear() {
		productID = null;
		productName = null;
		productSellCount = 0;
		createdate = null;
		sumAmount = 0;
		
		amountArr = null;
		orderdateArr = null;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public int getProductSellCount() {
		return productSellCount;
	}

	public void setProductSellCount(int productSellCount) {
		this.productSellCount = productSellCount;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public double getSumAmount() {
		return sumAmount;
	}

	public void setSumAmount(double sumAmount) {
		this.sumAmount = sumAmount;
	}

	public String getAmountArr() {
		return amountArr;
	}

	public void setAmountArr(String amountArr) {
		this.amountArr = amountArr;
	}

	public String getOrderdateArr() {
		return orderdateArr;
	}

	public void setOrderdateArr(String orderdateArr) {
		this.orderdateArr = orderdateArr;
	}
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "sumAmount="+sumAmount+",createdate="+createdate;
	}
}
