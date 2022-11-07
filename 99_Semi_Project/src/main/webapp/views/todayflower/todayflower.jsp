<%@page import="com.hp.plant.model.vo.PlantInfo"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
              
<%@page import=" javax.xml.parsers.DocumentBuilder"%>
<%@page import=" javax.xml.parsers.DocumentBuilderFactory"%>
              
<%@page import=" org.w3c.dom.Document"%>
<%@page import=" org.w3c.dom.Element"%>
<%@page import=" org.w3c.dom.Node"%>
<%@page import=" org.w3c.dom.NodeList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:forward page="/plant/plantInfo.do" />  --%>
<%!private static String getStrData(Element eElement, String tagName) {
	try {
		return eElement.getElementsByTagName(tagName).item(0).getTextContent();
	} catch (Exception e) {
		return "-";
	}
}

private static int getIntData(Element eElement, String tagName){
	try {
		return Integer.parseInt(eElement.getElementsByTagName(tagName).item(0).getTextContent());
	} catch (Exception e) {
		return 0;
	}
}%>
<%PlantInfo today = new PlantInfo();
try {
	StringBuilder urlbBuilder = new StringBuilder(
			"http://apis.data.go.kr/1390804/NihhsTodayFlowerInfo01/selectTodayFlower01");
	urlbBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
			+ "=qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D");

	URL url = new URL(urlbBuilder.toString());
	HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	conn.setRequestMethod("GET");
	conn.setRequestProperty("Content-type", "application/json");
//	System.out.println("Response code: " + conn.getResponseCode());

	DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	DocumentBuilder db = dbf.newDocumentBuilder();
	Document doc = db.parse(conn.getInputStream());
	doc.getDocumentElement().normalize();

	NodeList nList = doc.getElementsByTagName("result");
	for (int i = 0; i < nList.getLength(); i++) {
		Node node = nList.item(i);
		if (node.getNodeType() == Node.ELEMENT_NODE) {
			Element eElement = (Element) node;
			int fNo = getIntData(eElement, "dataNo");
			String fMonth = getStrData(eElement, "fMonth");
			String fDay = getStrData(eElement, "fDay");
			String fKorNm = getStrData(eElement, "flowNm");
			String fSctNm = getStrData(eElement, "fSctNm");
			String fEngNm = getStrData(eElement, "fEngNm");
			String fLang = getStrData(eElement, "flowLang");
			String fContent = getStrData(eElement, "fContent");
			String fUse = getStrData(eElement, "fUse");
			String fGrow = getStrData(eElement, "fGrow");
			String fType = getStrData(eElement, "fType");
			String imgUrl1 = getStrData(eElement, "imgUrl1");
			String imgUrl2 = getStrData(eElement, "imgUrl2");
			String imgUrl3 = getStrData(eElement, "imgUrl3");

			today = new PlantInfo(fNo, fMonth, fDay, fKorNm, fSctNm, fEngNm, fLang, fContent, fUse, fGrow, fType, imgUrl1, imgUrl2, imgUrl3);
		}
	}
} catch (Exception e) {
	e.printStackTrace();
}%>
    			<!-- 오늘의 꽃 -->
                <section class="container py-5 my-4 my-sm-0 py-sm-6 py-md-7 font-GyenggiM" style="position: absolute; top: 2.5rem; z-index: 1000; width: 45rem;">
                    <div class="row pb-2">
                        <div class="col-lg-6">
                            <div class="accordion" id="faq">
                                <div class="accordion-item" style="border: none;">
                                    <h2 class="accordion-header" id="faq-heading-1">
                                        <button class="_accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1" aria-expanded="true" aria-controls="faq-content-1">핸드플랜트가 추천하는 오늘의 꽃</button>
                                    </h2>
                                    <div class="accordion-collapse collapse show" id="faq-content-1" aria-labelledby="faq-heading-1" data-bs-parent="#faq">
                                        <div class="accordion-body">
                                             <div><img src="<%=today.getImgUrl1() %>" alt="P_flowers"></div>
                                            <%-- <div><img src="<%=today.getImgUrl2() %>" alt="P_flowers"></div> 
                                            <div><img src="<%=today.getImgUrl3() %>" alt="P_flowers"></div> --%>
                                            <div class="fs-m text-dark" style="margin-top: 1rem;"><%=today.getfMonth()%>월 <%=today.getfDay()%>일의 꽃 - <%=today.getfKorNm() %></div>
                                            <div class="fs-sm ._font_lidark">꽃말 : <%=today.getfLang()%></div>
                                            <div class="fs-sm ._font_lidark"><%=today.getfContent()%></div>
                                          <%--   <div class="fs-sm ._font_lidark"><%=today.getfUse()%></div> --%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>