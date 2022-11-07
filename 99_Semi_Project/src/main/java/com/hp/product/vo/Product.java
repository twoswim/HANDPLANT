package com.hp.product.vo;

public class Product {
	
	private int prNo;
	private String prName;
	private String prType;
	private String prPrice;
	private String prImage;
	private String prUrl;
	
	
	public int getPrNo() {
		return prNo;
	}
	public void setPrNo(int prNo) {
		this.prNo = prNo;
	}
	public String getPrName() {
		return prName;
	}
	public void setPrName(String prName) {
		this.prName = prName;
	}
	public String getPrType() {
		return prType;
	}
	public void setPrType(String prType) {
		this.prType = prType;
	}
	public String getPrPrice() {
		return prPrice;
	}
	public void setPrPrice(String prPrice) {
		this.prPrice = prPrice;
	}
	public String getPrImage() {
		return prImage;
	}
	public void setPrImage(String prImage) {
		this.prImage = prImage;
	}
	public String getPrUrl() {
		return prUrl;
	}
	public void setPrUrl(String prUrl) {
		this.prUrl = prUrl;
	}
	@Override
	public String toString() {
		return "Product [prNo=" + prNo + ", prName=" + prName + ", prType=" + prType + ", prPrice=" + prPrice
				+ ", prImage=" + prImage + ", prUrl=" + prUrl + "]";
	}
	public Product(int prNo, String prName, String prType, String prPrice, String prImage, String prUrl) {
		super();
		this.prNo = prNo;
		this.prName = prName;
		this.prType = prType;
		this.prPrice = prPrice;
		this.prImage = prImage;
		this.prUrl = prUrl;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
