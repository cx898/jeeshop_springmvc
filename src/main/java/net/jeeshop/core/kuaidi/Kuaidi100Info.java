package net.jeeshop.core.kuaidi;

import java.util.List;

public class Kuaidi100Info {
	private String message;//消息体
	private String status;//查询的结果状态。0：运单暂无结果，1：查询成功，2：接口出现异常，408：验证码出错（仅适用于APICode url，可忽略) 。遇到其他情况，请按获得身份授权key的邮件中的方法获得技术支持。
	private String state;//快递单当前的状态 。0：在途中,1：已发货，2：疑难件，3： 已签收 ，4：已退货。该状态还在不断完善中，有更多的参数需求，欢迎发邮件至 kuaidi@kingdee.com 提出
	private List<Kuaidi100Item> data;//数据集合

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<Kuaidi100Item> getData() {
		return data;
	}

	public void setData(List<Kuaidi100Item> data) {
		this.data = data;
	}

	public void clear() {
		this.message = null;
		this.status = null;
		this.state = null;
		
		if(this.data!=null){
			this.data.clear();
			this.data = null;
		}
	}

	@Override
	public String toString() {
		return "Kuaidi100Info [message=" + message + ", status=" + status
				+ ", state=" + state + ", data=" + data + "]";
	}

}
