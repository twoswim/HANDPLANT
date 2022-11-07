package com.hp.plant.model.vo;

public class PlantList {
	private int fNo;			// 꽃 번호
	private String fMonth;		// 꽃 월
	private String fDay;		// 꽃 일
	private String fKorNm;		// 꽃이름(국문)
	private String fLang; 		// 꽃말
	private String fileName1; 	// 이미지 원본파일명1
	private String fileName2; 	// 이미지 원본파일명2
	private String fileName3; 	// 이미지 원본파일명3
	private String imgUrl1; 	// 이미지 URL1
	private String imgUrl2; 	// 이미지 URL2
	private String imgUrl3; 	// 이미지 URL3
	private String publishOrg; 	// 컨텐츠 출처기관
	
	public PlantList() {
		super();
	}

	public PlantList(int fNo, String fMonth, String fDay, String fKorNm, String fLang, String fileName1,
			String fileName2, String fileName3, String imgUrl1, String imgUrl2, String imgUrl3, String publishOrg) {
		super();
		this.fNo = fNo;
		this.fMonth = fMonth;
		this.fDay = fDay;
		this.fKorNm = fKorNm;
		this.fLang = fLang;
		this.fileName1 = fileName1;
		this.fileName2 = fileName2;
		this.fileName3 = fileName3;
		this.imgUrl1 = imgUrl1;
		this.imgUrl2 = imgUrl2;
		this.imgUrl3 = imgUrl3;
		this.publishOrg = publishOrg;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfMonth() {
		return fMonth;
	}

	public void setfMonth(String fMonth) {
		this.fMonth = fMonth;
	}

	public String getfDay() {
		return fDay;
	}

	public void setfDay(String fDay) {
		this.fDay = fDay;
	}

	public String getfKorNm() {
		return fKorNm;
	}

	public void setfKorNm(String fKorNm) {
		this.fKorNm = fKorNm;
	}

	public String getfLang() {
		return fLang;
	}

	public void setfLang(String fLang) {
		this.fLang = fLang;
	}

	public String getFileName1() {
		return fileName1;
	}

	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}

	public String getFileName2() {
		return fileName2;
	}

	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}

	public String getFileName3() {
		return fileName3;
	}

	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}

	public String getImgUrl1() {
		return imgUrl1;
	}

	public void setImgUrl1(String imgUrl1) {
		this.imgUrl1 = imgUrl1;
	}

	public String getImgUrl2() {
		return imgUrl2;
	}

	public void setImgUrl2(String imgUrl2) {
		this.imgUrl2 = imgUrl2;
	}

	public String getImgUrl3() {
		return imgUrl3;
	}

	public void setImgUrl3(String imgUrl3) {
		this.imgUrl3 = imgUrl3;
	}

	public String getPublishOrg() {
		return publishOrg;
	}

	public void setPublishOrg(String publishOrg) {
		this.publishOrg = publishOrg;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("\n꽃번호 : ");
		sb.append(fNo);
		sb.append("\n꽃이름 : ");
		sb.append(fKorNm);
		sb.append("\n꽃말 : ");
		sb.append(fLang);
		sb.append(", \n이미지 원본파일명1 : ");
		sb.append(fileName1);
		sb.append(", \n이미지 원본파일명2 : ");
		sb.append(fileName2);
		sb.append(", \n이미지 원본파일명3 : ");
		sb.append(fileName3);
		sb.append(", \n이미지 URL1 : ");
		sb.append(imgUrl1);
		sb.append(", \n이미지 URL2 : ");
		sb.append(imgUrl2);
		sb.append(", \n이미지 URL3 : ");
		sb.append(imgUrl3);
		sb.append(", \n컨텐츠 출처기관 : ");
		sb.append(publishOrg);
		sb.append("\n");
		return sb.toString();
	}
	
}
