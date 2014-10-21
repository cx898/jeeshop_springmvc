package net.jeeshop.core.util;

import java.io.Serializable;
import java.util.Map;

//http://developer.baidu.com/map/webservice-geocoding.htm
public class BaiduMapInfo implements Serializable {
	private int status;
	private Result result;

	public Result getResult() {
		return result;
	}

	public void setResult(Result result) {
		this.result = result;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
