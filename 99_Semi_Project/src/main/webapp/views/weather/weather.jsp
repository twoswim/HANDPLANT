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

<%!
public static String get(int x, int y, Weather w) {
	HttpURLConnection con = null;
	String s = null; // 에러 메시지
	
	try {
		LocalDateTime t = LocalDateTime.now().minusMinutes(30); // 현재 시각 30분전

		URL url = new URL("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"
				+ "?ServiceKey=qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D" // 서비스키
				// + "&pageNo=1" // 페이지번호 Default: 1
				+ "&numOfRows=60" // 한 페이지 결과 수 (10개 카테고리값 * 6시간)
				// + "&dataType=XML" // 요청자료형식(XML/JSON) Default: XML
				+ "&base_date=" + t.format(DateTimeFormatter.ofPattern("yyyyMMdd")) // 발표 날짜
				+ "&base_time=" + t.format(DateTimeFormatter.ofPattern("HHmm")) // 발표 시각
				+ "&nx=" + x // 예보지점의 X 좌표값
				+ "&ny=" + y // 예보지점의 Y 좌표값
		);

		con = (HttpURLConnection) url.openConnection();
		Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(con.getInputStream());

		boolean ok = false; // <resultCode>00</resultCode> 획득 여부

		Element e;
		NodeList ns = doc.getElementsByTagName("header");
		if (ns.getLength() > 0) {
			e = (Element) ns.item(0);
			if ("00".equals(e.getElementsByTagName("resultCode").item(0).getTextContent())) {
				ok = true; // 성공 여부
			} else { // 에러 메시지
				s = e.getElementsByTagName("resultMsg").item(0).getTextContent();
			}
		}

		if (ok) {
			String fd = null, ft = null; // 가장 빠른 예보 시각
			String pty = null; // 강수형태
			String sky = null; // 하늘상태
			String cat; // category
			String val; // fcstValue

			ns = doc.getElementsByTagName("item");
			for (int i = 0; i < ns.getLength(); i++) {
				e = (Element) ns.item(i);

				if (ft == null) { // 가져올 예보 시간 결정
					fd = e.getElementsByTagName("fcstDate").item(0).getTextContent(); // 예보 날짜
					ft = e.getElementsByTagName("fcstTime").item(0).getTextContent(); // 예보 시각
				} else if (!fd.equals(e.getElementsByTagName("fcstDate").item(0).getTextContent())
						|| !ft.equals(e.getElementsByTagName("fcstTime").item(0).getTextContent())) {
					continue; // 결정된 예보 시각과 같은 시각의 것만 취한다.
				}

				cat = e.getElementsByTagName("category").item(0).getTextContent(); // 자료구분코드
				val = e.getElementsByTagName("fcstValue").item(0).getTextContent(); // 예보 값

				if ("PTY".equals(cat)) {
					pty = val; // 강수형태
				} else if ("SKY".equals(cat)) {
					sky = val; // 하늘상태
				} else if ("T1H".equals(cat)) {
					w.setTemp(val); // 기온
				}
			}

			if ("0".equals(pty)) { // 강수형태 없으면, 하늘상태로 판단
				if ("1".equals(sky)) {
					w.setWeather("맑음");
				} else if ("3".equals(sky)) {
					w.setWeather("구름많음");
				} else if ("4".equals(sky)) {
					w.setWeather("흐림");
				}
			} else if ("1".equals(pty)) {
				w.setWeather("비");
			} else if ("2".equals(pty)) {
				w.setWeather("비/눈");
			} else if ("3".equals(pty)) {
				w.setWeather("눈");
			} else if ("5".equals(pty)) {
				w.setWeather("빗방울");
			} else if ("6".equals(pty)) {
				w.setWeather("빗방울눈날림");
			} else if ("7".equals(pty)) {
				w.setWeather("눈날림");
			}
		}
	} catch (Exception e) {
		s = e.getMessage();
	}

	if (con != null)
		con.disconnect();

	return s;
}
%>
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
	                    <a style= "color : black; margin:auto; font-size : 14px;">
	                    	<%=w.getTemp()%>℃ / 서울
	                    </a>
                    </a>
				</div>
