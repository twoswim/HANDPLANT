<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import= "java.net.HttpURLConnection"%>
<%@page import= "java.net.URL"%>
<%@page import= "java.time.LocalDateTime"%>
<%@page import= "java.time.format.DateTimeFormatter"%>
<%@page import= "javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import= "org.w3c.dom.Document"%>
<%@page import= "org.w3c.dom.Element"%>
<%@page import= "org.w3c.dom.NodeList"%>
<%@page import="com.hp.weather.model.vo.Weather"%>
<%@page import="com.hp.weather.api.WeatherOpenApi"%>
<%
Weather w = new Weather();
WeatherOpenApi api = new WeatherOpenApi();
String weather = WeatherOpenApi.get(37, 127, w); // 서울
%>
				<div>
					<a style="margin:auto;">
						<% if (w.getWeather().equals("맑음")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/sunny.png"
							style="width: 25px" />
	                    <%} else if(w.getWeather().equals("구름많음")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/cloud.png"
							style="width: 25px" />
	                    <%} else if(w.getWeather().equals("흐림")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/cloudy.png"
							style="width: 25px" />
	                    <%} else if(w.getWeather().equals("비")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/rain.png"
							style="width: 25px" />
	                    <%} else if(w.getWeather().equals("비/눈")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/rainSnow.png"
							style="width: 25px" />
						<%} else if(w.getWeather().equals("눈")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/snow.png"
							style="width: 25px" />
						<%} else if(w.getWeather().equals("빗방울")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/raindrop.png"
							style="width: 25px" />
						<%} else if(w.getWeather().equals("빗방울눈날림")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/raindropSnow.png"
							style="width: 25px" />
						<%} else if(w.getWeather().equals("눈날림")) { %>
	                    	<img src="<%=request.getContextPath()%>/source/img/weather/snowflake.png"
							style="width: 25px" />				
	                    <%}%>  
	                    <a style= "color : black; margin: auto; font-size : 14px;">
	                    	<%=w.getTemp()%>℃ / 서울
	                    </a>
                    </a>
				</div>
