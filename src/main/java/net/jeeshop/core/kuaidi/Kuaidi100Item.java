package net.jeeshop.core.kuaidi;

public class Kuaidi100Item {
	private String time;// 每条数据的时间
	private String context;// 每条数据的状态

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	@Override
	public String toString() {
		return "Kuaidi100Item [time=" + time + ", context=" + context + "]";
	}

}
