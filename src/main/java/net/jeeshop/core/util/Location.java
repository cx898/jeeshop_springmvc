package net.jeeshop.core.util;

import java.io.Serializable;

public class Location implements Serializable{

	Double lat;//纬度值
	Double lng;//经度值

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "lat:" + lat + ",lng:" + lng;
	}

}
