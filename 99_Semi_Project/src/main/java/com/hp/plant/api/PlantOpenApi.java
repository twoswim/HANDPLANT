package com.hp.plant.api;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.hp.common.Util;
import com.hp.plant.model.vo.PlantInfo;
import com.hp.plant.model.vo.PlantList;

public class PlantOpenApi {
	
	// 일반검색
	public static List<PlantList> searchByPlantName(String pName) {
		PlantList pt = new PlantList();
		List<PlantList> plants = new ArrayList<>();

		System.out.println("타입 : [1:꽃명(국문), 2:꽃명(학명), 3:꽃명(영문),4:꽃말, 5:내용, 6:이용, 7:기르기, 8:자생지, 9:내용전체]");
		System.out.print("검색 타입을 선택해주세요 : ");
		String type = Util.readStrForConsol();
		System.out.print("검색어를 입력해주게요 : ");
		String name = Util.readStrForConsol();

		try {
			StringBuilder urlbBuilder = new StringBuilder(
					"http://apis.data.go.kr/1390804/NihhsTodayFlowerInfo01/selectTodayFlowerList01");
			urlbBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D");
			urlbBuilder.append("&" + URLEncoder.encode("searchType", "UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));
//			1:꽃명(국문), 2:꽃명(학명), 3:꽃명(영문),4:꽃말, 5:내용, 6:이용, 7:기르기, 8:자생지, 9:내용전체
			urlbBuilder.append(
					"&" + URLEncoder.encode("searchWord", "UTF-8") + "=" + URLEncoder.encode(name, "UTF-8"));

			URL url = new URL(urlbBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println("Response code: " + conn.getResponseCode());

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("result");
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;
					int dataNo = getIntData(eElement, "dataNo");
					String fMonth = getStrData(eElement, "fMonth");
					String fDay = getStrData(eElement, "fDay");
					String flowNm = getStrData(eElement, "flowNm");
					String flowLang = getStrData(eElement, "flowLang");
					String fileName1 = getStrData(eElement, "fileName1");
					String fileName2 = getStrData(eElement, "fileName2");
					String fileName3 = getStrData(eElement, "fileName3");
					String imgUrl1 = getStrData(eElement, "imgUrl1");
					String imgUrl2 = getStrData(eElement, "imgUrl2");
					String imgUrl3 = getStrData(eElement, "imgUrl3");
					String publishOrg = getStrData(eElement, "publishOrg");

					pt = new PlantList(dataNo, fMonth, fDay, flowNm, flowLang, fileName1, fileName2, fileName3, imgUrl1, imgUrl2, imgUrl3, publishOrg);
					plants.add(pt);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plants;
	}
	
	//전체 불러오기
	public static List<PlantList> searchAll() {
		PlantList pt = new PlantList();
		List<PlantList> plants = new ArrayList<>();

		System.out.println("타입 : [1:꽃명(국문), 2:꽃명(학명), 3:꽃명(영문),4:꽃말, 5:내용, 6:이용, 7:기르기, 8:자생지, 9:내용전체]");
		System.out.print("검색 타입을 선택해주세요 : ");
		String type = Util.readStrForConsol();
		System.out.print("검색어를 입력해주게요 : ");
		String name = Util.readStrForConsol();

		try {
			StringBuilder urlbBuilder = new StringBuilder(
					"http://apis.data.go.kr/1390804/NihhsTodayFlowerInfo01/selectTodayFlowerList01");
			urlbBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D");
			urlbBuilder.append("&" + URLEncoder.encode("searchType", "UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));
//			1:꽃명(국문), 2:꽃명(학명), 3:꽃명(영문),4:꽃말, 5:내용, 6:이용, 7:기르기, 8:자생지, 9:내용전체
			urlbBuilder.append(
					"&" + URLEncoder.encode("searchWord", "UTF-8") + "=" + URLEncoder.encode(name, "UTF-8"));

			URL url = new URL(urlbBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println("Response code: " + conn.getResponseCode());

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("result");
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;
					int dataNo = getIntData(eElement, "dataNo");
					String fMonth = getStrData(eElement, "fMonth");
					String fDay = getStrData(eElement, "fDay");
					String flowNm = getStrData(eElement, "flowNm");
					String flowLang = getStrData(eElement, "flowLang");
					String fileName1 = getStrData(eElement, "fileName1");
					String fileName2 = getStrData(eElement, "fileName2");
					String fileName3 = getStrData(eElement, "fileName3");
					String imgUrl1 = getStrData(eElement, "imgUrl1");
					String imgUrl2 = getStrData(eElement, "imgUrl2");
					String imgUrl3 = getStrData(eElement, "imgUrl3");
					String publishOrg = getStrData(eElement, "publishOrg");

					pt = new PlantList(dataNo, fMonth, fDay, flowNm, flowLang, fileName1, fileName2, fileName3, imgUrl1, imgUrl2, imgUrl3, publishOrg);
					plants.add(pt);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		System.out.println(plants.toString());
		return plants;
	}
	
	// 상세검색(식물번호)
	public static PlantInfo detailInfo(int no) {
		PlantInfo info = new PlantInfo();
		int index = no;

		try {
			StringBuilder urlbBuilder = new StringBuilder(
					"http://apis.data.go.kr/1390804/NihhsTodayFlowerInfo01/selectTodayFlowerView01");
			urlbBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D");
			urlbBuilder.append(
					"&" + URLEncoder.encode("dataNo", "UTF-8") + "=" + index);
			System.out.println("URL : " + urlbBuilder);
			URL url = new URL(urlbBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("result");
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;
					int pNo = getIntData(eElement, "dataNo");
					String pKorName = getStrData(eElement, "flowNm");
					String pSctName = getStrData(eElement, "fSctNm");
					String pEngName = getStrData(eElement, "fEngNm");
					String pLang = getStrData(eElement, "flowLang");
					String pContent = getStrData(eElement, "fContent");
					String pUse = getStrData(eElement, "fUse");
					String pGrow = getStrData(eElement, "fGrow");
					String pType = getStrData(eElement, "fType");
					String pImgUrl1 = getStrData(eElement, "imgUrl1");
					String pImgUrl2 = getStrData(eElement, "imgUrl2");
					String pImgUrl3 = getStrData(eElement, "imgUrl3");
	

					info = new PlantInfo(pNo, pKorName ,pSctName, pEngName ,pLang, pContent, pUse, pGrow ,pType, 
							pImgUrl1 , pImgUrl2 ,pImgUrl3 ) ;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	
	// 오늘의 꽃
	public static void todayPlant() {
		PlantInfo today = new PlantInfo();

		try {
			StringBuilder urlbBuilder = new StringBuilder(
					"http://apis.data.go.kr/1390804/NihhsTodayFlowerInfo01/selectTodayFlower01");
			urlbBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D");
			
			System.out.println("URL : " + urlbBuilder);
			URL url = new URL(urlbBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.getDocumentElement().normalize();

			NodeList nList = doc.getElementsByTagName("result");
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;
					int pNo = getIntData(eElement, "pNo");
					String pKorName = getStrData(eElement, "pKorName");
					String pSctName = getStrData(eElement, "pSctName");
					String pEngName = getStrData(eElement, "pEngName");
					String pLang = getStrData(eElement, "pLang");
					String pContent = getStrData(eElement, "pContent");
					String pUse = getStrData(eElement, "pUse");
					String pGrow = getStrData(eElement, "pGrow");
					String pType = getStrData(eElement, "pType");
					String pImgUrl1 = getStrData(eElement, "pImgUrl1");
					String pImgUrl2 = getStrData(eElement, "pImgUrl2");
					String pImgUrl3 = getStrData(eElement, "pImgUrl3");
					

					today = new PlantInfo(pNo, pKorName ,pSctName, pEngName ,pLang, pContent, pUse, pGrow ,pType, 
							pImgUrl1 , pImgUrl2 ,pImgUrl3 ) ;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(today.toString());
	}
	
	private static String getStrData(Element eElement, String tagName) {
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
	}

	public static void main(String[] args) {
//		searchByPlantName("");
		detailInfo(1);
//		todayPlant();
	}
}