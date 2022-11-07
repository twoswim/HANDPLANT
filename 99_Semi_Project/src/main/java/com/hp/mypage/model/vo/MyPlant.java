package com.hp.mypage.model.vo;

import java.util.Date;

public class MyPlant {
	private int mpNo;            //내식물번호
	private int uNo;             //유저번호
	private String mpSctNm;      //품종
	private String mpName;       //내식물이름(애칭)
	private String mpWatering;   //물주기기록
	private String mpStatus;     //게시글 상태 y n
	private String mpCreateDate; //분양날짜
	private String mpFileName;   //게시물 첨부파일 - 내가지정한이름
	private String re_mpFileName;//게시물 첨부파일 - 컴터가지정한이름
	

	public MyPlant() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MyPlant(int mpNo, int uNo, String mpSctNm, String mpName, String mpWatering, String mpStatus,
			String mpCreateDate, String mpFileName, String re_mpFileName) {
		super();
		this.mpNo = mpNo;
		this.uNo = uNo;
		this.mpSctNm = mpSctNm;
		this.mpName = mpName;
		this.mpWatering = mpWatering;
		this.mpStatus = mpStatus;
		this.mpCreateDate = mpCreateDate;
		this.mpFileName = mpFileName;
		this.re_mpFileName = re_mpFileName;
	}


	public int getMpNo() {
		return mpNo;
	}


	public void setMpNo(int mpNo) {
		this.mpNo = mpNo;
	}


	public int getuNo() {
		return uNo;
	}


	public void setuNo(int uNo) {
		this.uNo = uNo;
	}


	public String getMpSctNm() {
		return mpSctNm;
	}


	public void setMpSctNm(String mpSctNm) {
		this.mpSctNm = mpSctNm;
	}


	public String getMpName() {
		return mpName;
	}


	public void setMpName(String mpName) {
		this.mpName = mpName;
	}


	public String getMpWatering() {
		return mpWatering;
	}


	public void setMpWatering(String mpWatering) {
		this.mpWatering = mpWatering;
	}


	public String getMpStatus() {
		return mpStatus;
	}


	public void setMpStatus(String mpStatus) {
		this.mpStatus = mpStatus;
	}


	public String getMpCreateDate() {
		return mpCreateDate;
	}


	public void setMpCreateDate(String mpCreateDate) {
		this.mpCreateDate = mpCreateDate;
	}


	public String getMpFileName() {
		return mpFileName;
	}


	public void setMpFileName(String mpFileName) {
		this.mpFileName = mpFileName;
	}


	public String getRe_mpFileName() {
		return re_mpFileName;
	}


	public void setRe_mpFileName(String re_mpFileName) {
		this.re_mpFileName = re_mpFileName;
	}



	
	

}
