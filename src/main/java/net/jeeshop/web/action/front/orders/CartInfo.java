package net.jeeshop.web.action.front.orders;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

import net.jeeshop.core.dao.page.ClearBean;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.services.front.address.bean.Address;
import net.jeeshop.services.front.product.bean.Product;


/**
 * 购物车对象，独立出此对象是为了以后的方便操作，当业务进行扩展的时候不会导致系统混乱。
 * 
 * @author huangf
 * 
 */
public class CartInfo extends PagerModel implements Serializable {
	static final java.text.DecimalFormat df =new   java.text.DecimalFormat("#.00");
	
	private List<Product> productList;// 购物车中商品列表
//	private String productTotal;//商品总金额
	private String amount;// 合计总金额，也就是用户最终需要支付的金额
	private int totalExchangeScore;//总计所需积分
	
	private List<Address> addressList;//用户配送地址信息
	@Deprecated
	private Address address;//客户配送信息
	private String defaultAddessID;//用户的默认地址ID

	public List<Product> getProductList() {
		if(productList==null){
			productList = new LinkedList<Product>();
		}
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public Address getAddress() {
		if(address==null){
			address = new Address();
		}
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	/**
	 * 购物车汇总计算总金额
	 * @return
	 */
	public void totalCacl(){
		double _amount = 0;
		int _totalExchangeScore = 0;
		for(int i=0;i<getProductList().size();i++){
			Product p = getProductList().get(i);
			
			//积分商城的商品不参与金额计算
			if(p.getExchangeScore() > 0){
				_totalExchangeScore += p.getExchangeScore() * p.getBuyCount();
				continue;
			}
//			_productTotal += Double.valueOf(p.getNowPrice()) * p.getBuyCount();
			_amount += Double.valueOf(p.getNowPrice()) * p.getBuyCount();
		}
		
		this.totalExchangeScore = _totalExchangeScore;
//		this.productTotal = df.format(_productTotal);
		if(_amount!=0){
			this.amount = df.format(_amount);
		}else{
			this.amount = "0.00";
		}
	}

	@Override
	public void clear() {
		if(productList!=null){
			for(int i=0;i<productList.size();i++){
				productList.get(i).clear();
			}
			productList.clear();
			productList = null;
		}
		amount = null;
		if(address!=null){
			address.clear();
		}
	}

	public String getDefaultAddessID() {
		return defaultAddessID;
	}

	public void setDefaultAddessID(String defaultAddessID) {
		this.defaultAddessID = defaultAddessID;
	}

	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public int getTotalExchangeScore() {
		return totalExchangeScore;
	}

	public void setTotalExchangeScore(int totalExchangeScore) {
		this.totalExchangeScore = totalExchangeScore;
	}

	@Override
	public String toString() {
		return "CartInfo [productList=" + productList + ", amount=" + amount
				+ ", addressList=" + addressList + ", address=" + address
				+ ", defaultAddessID=" + defaultAddessID + "]";
	}
	
//	@Override
//	public String toString() {
//		StringBuilder buff = new StringBuilder();
//		buff.append("amount="+amount+",defaultAddessID="+defaultAddessID);
//		return buff.toString();
//	}
}
