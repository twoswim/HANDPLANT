package com.hp.board.model.vo;

import java.util.Date;

public class Reply {
	 private int coNo;
	 private int boNo;
	 private int uNo;
	 private String coId;
	 private String uName;
	 private String coContent;
	 private String coStatus;
	 private Date coCreateDate;	
	 private Date coModifyDate;
	 
	 
	public Reply() {
		super();
	}


	public Reply(int coNo, int boNo, int uNo, String coId, String uName, String coContent, String coStatus,
			Date coCreateDate, Date coModifyDate) {
		super();
		this.coNo = coNo;
		this.boNo = boNo;
		this.uNo = uNo;
		this.coId = coId;
		this.uName = uName;
		this.coContent = coContent;
		this.coStatus = coStatus;
		this.coCreateDate = coCreateDate;
		this.coModifyDate = coModifyDate;
	}


	public int getCoNo() {
		return coNo;
	}


	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}


	public int getBoNo() {
		return boNo;
	}


	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}


	public int getuNo() {
		return uNo;
	}


	public void setuNo(int uNo) {
		this.uNo = uNo;
	}


	public String getCoId() {
		return coId;
	}


	public void setCoId(String coId) {
		this.coId = coId;
	}


	public String getuName() {
		return uName;
	}


	public void setuName(String uName) {
		this.uName = uName;
	}


	public String getCoContent() {
		return coContent;
	}


	public void setCoContent(String coContent) {
		this.coContent = coContent;
	}


	public String getCoStatus() {
		return coStatus;
	}


	public void setCoStatus(String coStatus) {
		this.coStatus = coStatus;
	}


	public Date getCoCreateDate() {
		return coCreateDate;
	}


	public void setCoCreateDate(Date coCreateDate) {
		this.coCreateDate = coCreateDate;
	}


	public Date getCoModifyDate() {
		return coModifyDate;
	}


	public void setCoModifyDate(Date coModifyDate) {
		this.coModifyDate = coModifyDate;
	}


	@Override
	public String toString() {
		return "Reply [coNo=" + coNo + ", boNo=" + boNo + ", uNo=" + uNo + ", coId=" + coId + ", uName=" + uName
				+ ", coContent=" + coContent + ", coStatus=" + coStatus + ", coCreateDate=" + coCreateDate
				+ ", coModifyDate=" + coModifyDate + "]";
	}



	
}
