package com.hp.weather.model.vo;

public class Weather {

//	private String date;		// 날짜
//	private String time;		// 시간
	private String weather; 	// 날씨
	private String temp; 		// 기온
//	private String Humidity;	// 습도
	
	public Weather() {
	}

	public Weather(String weather, String temp) {
		super();
		this.weather = weather;
		this.temp = temp;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	@Override
	public String toString() {
		return "Weather [weather=" + weather + ", temp=" + temp + "]";
	}
	
}
