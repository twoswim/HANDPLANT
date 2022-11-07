package com.hp.plant.model.vo;

public class PlantInfo {
	private int fNo;			// 꽃 번호
	private String fMonth;		// 꽃 월
	private String fDay;		// 꽃 일
	private String fKorNm;		// 꽃이름(국문)
	private String fSctNm;		// 꽃이름(학명)
	private String fEngNm;		// 꽃이름(영문)
	private String fLang; 		// 꽃말
	private String fContent;	// 내용
	private String fUse;		// 이용
	private String fGrow; 		// 기르기
	private String fType; 		// 자생지
	private String fileName1; 	// 이미지 원본파일명1
	private String fileName2; 	// 이미지 원본파일명2
	private String fileName3; 	// 이미지 원본파일명3
	private String imgUrl1; 	// 이미지 URL1
	private String imgUrl2; 	// 이미지 URL2
	private String imgUrl3; 	// 이미지 URL3
	private String fWatering; 	// 물주기
	private String fSunshine; 	// 햇빛
	private String fHumidity; 	// 습도
	private String fTemperture; // 온도
	private String fTag; // 온도
	
	public PlantInfo() {
		super();
	}
	
	
	public PlantInfo(int fNo, String fKorNm, String fSctNm, String fEngNm, String fLang, String fContent, String fUse,
			String fGrow, String fType, String imgUrl1, String imgUrl2, String imgUrl3, String fWatering,
			String fSunshine, String fHumidity, String fTemperture, String fTag) {
		super();
		this.fNo = fNo;
		this.fKorNm = fKorNm;
		this.fSctNm = fSctNm;
		this.fEngNm = fEngNm;
		this.fLang = fLang;
		this.fContent = fContent;
		this.fUse = fUse;
		this.fGrow = fGrow;
		this.fType = fType;
		this.imgUrl1 = imgUrl1;
		this.imgUrl2 = imgUrl2;
		this.imgUrl3 = imgUrl3;
		this.fWatering = fWatering;
		this.fSunshine = fSunshine;
		this.fHumidity = fHumidity;
		this.fTemperture = fTemperture;
		this.fTag = fTag;
	}


	public PlantInfo(int fNo, String fKorNm, String fSctNm, String fEngNm, String fLang, String fContent, String fUse,
			String fGrow, String fType, String imgUrl1, String imgUrl2, String imgUrl3) {
		super();
		this.fNo = fNo;
		this.fKorNm = fKorNm;
		this.fSctNm = fSctNm;
		this.fEngNm = fEngNm;
		this.fLang = fLang;
		this.fContent = fContent;
		this.fUse = fUse;
		this.fGrow = fGrow;
		this.fType = fType;
		this.imgUrl1 = imgUrl1;
		this.imgUrl2 = imgUrl2;
		this.imgUrl3 = imgUrl3;
	}

	





	public PlantInfo(int fNo, String fMonth, String fDay, String fKorNm, String fSctNm, String fEngNm, String fLang,
			String fContent, String fUse, String fGrow, String fType, String imgUrl1, String imgUrl2, String imgUrl3) {
		super();
		this.fNo = fNo;
		this.fMonth = fMonth;
		this.fDay = fDay;
		this.fKorNm = fKorNm;
		this.fSctNm = fSctNm;
		this.fEngNm = fEngNm;
		this.fLang = fLang;
		this.fContent = fContent;
		this.fUse = fUse;
		this.fGrow = fGrow;
		this.fType = fType;
		this.imgUrl1 = imgUrl1;
		this.imgUrl2 = imgUrl2;
		this.imgUrl3 = imgUrl3;
	}


	public PlantInfo(int fNo, String fMonth, String fDay, String fKorNm, String fSctNm, String fEngNm, String fLang,
			String fContent, String fUse, String fGrow, String fType, String fileName1, String fileName2,
			String fileName3, String imgUrl1, String imgUrl2, String imgUrl3, String fWatering,
			String fSunshine, String fHumidity, String fTemperture) {
		super();
		this.fNo = fNo;
		this.fMonth = fMonth;
		this.fDay = fDay;
		this.fKorNm = fKorNm;
		this.fSctNm = fSctNm;
		this.fEngNm = fEngNm;
		this.fLang = fLang;
		this.fContent = fContent;
		this.fUse = fUse;
		this.fGrow = fGrow;
		this.fType = fType;
		this.fileName1 = fileName1;
		this.fileName2 = fileName2;
		this.fileName3 = fileName3;
		this.imgUrl1 = imgUrl1;
		this.imgUrl2 = imgUrl2;
		this.imgUrl3 = imgUrl3;
		this.fWatering = fWatering;
		this.fSunshine = fSunshine;
		this.fHumidity = fHumidity;
		this.fTemperture = fTemperture;
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

	public String getfSctNm() {
		return fSctNm;
	}

	public void setfSctNm(String fSctNm) {
		this.fSctNm = fSctNm;
	}

	public String getfEngNm() {
		return fEngNm;
	}

	public void setfEngNm(String fEngNm) {
		this.fEngNm = fEngNm;
	}

	public String getfLang() {
		return fLang;
	}

	public void setfLang(String fLang) {
		this.fLang = fLang;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getfUse() {
		return fUse;
	}

	public void setfUse(String fUse) {
		this.fUse = fUse;
	}

	public String getfGrow() {
		return fGrow;
	}

	public void setfGrow(String fGrow) {
		this.fGrow = fGrow;
	}

	public String getfType() {
		return fType;
	}

	public void setfType(String fType) {
		this.fType = fType;
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


	public String getfWatering() {
		return fWatering;
	}

	public void setfWatering(String fWatering) {
		this.fWatering = fWatering;
	}

	public String getfSunshine() {
		return fSunshine;
	}

	public void setfSunshine(String fSunshine) {
		this.fSunshine = fSunshine;
	}

	public String getfHumidity() {
		return fHumidity;
	}

	public void setfHumidity(String fHumidity) {
		this.fHumidity = fHumidity;
	}

	public String getfTemperture() {
		return fTemperture;
	}

	public void setfTemperture(String fTemperture) {
		this.fTemperture = fTemperture;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("꽃번호 : ");
		sb.append(fNo);
		sb.append("\n국문명 : ");
		sb.append(fKorNm);
		sb.append("\n학명 : ");
		sb.append(fSctNm);
		sb.append("\n영문명 : ");
		sb.append(fEngNm);
		sb.append("\n꽃말 : ");
		sb.append(fLang);
		sb.append("\n날짜 : ");
		sb.append(fMonth);
		sb.append("월 ");
		sb.append(fDay);
		sb.append("일");
		sb.append("\n내용 : ");
		sb.append(fContent);
		sb.append("\n이용 : ");
		sb.append(fUse);
		sb.append("\n기르기 : ");
		sb.append(fGrow);
		sb.append("\n자생지 : ");
		sb.append(fType);
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
		sb.append(", \n물주기 : ");
		sb.append(fWatering);
		sb.append(", \n햇빛 : ");
		sb.append(fSunshine);
		sb.append(", \n습도 : ");
		sb.append(fHumidity);
		sb.append(", \n온도 : ");
		sb.append(fTemperture);
		return sb.toString();
	}

}
