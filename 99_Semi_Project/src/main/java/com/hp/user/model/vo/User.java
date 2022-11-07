package com.hp.user.model.vo;

import java.util.Date;

public class User {
	private int 	uNo;		// 회원 번호
	private String 	uId;		// 회원 아이디
	private String 	uPw;		// 회원 비밀번호
	private String 	uRole;		// 회원 타입(default-일반유저/관리자)
	private String 	uName;		// 회원 명
	private String 	uNickname;	// 회원 별명
	private String 	uPhone;		// 회원 전화번호
	private String 	uAddr;		// 회원 주소
	private String 	uBirth;		// 회원 생년월일
	private String 	uImgUrl;		// 회원 프사 url
	private String 	uStatus;	// 회원 상태(default-Y/N)
	private Date 	uSignIn;	// 회원 가입일
	private Date 	uUpDate;	// 회원 수정일

	public User() {
		super();
	}

	public User(int uNo, String uIds, String uPw, String uRole, String uName, String uNickname, String uPhone,
			String uAddr, String uBirth,String 	uImgUrl, String uStatus, Date uSignIn, Date uUpDate) {
		super();
		this.uNo 		= uNo;
		this.uId 		= uIds;
		this.uPw 		= uPw;
		this.uRole 		= uRole;
		this.uName 		= uName;
		this.uNickname 	= uNickname;
		this.uPhone 	= uPhone;
		this.uAddr 		= uAddr;
		this.uBirth 	= uBirth;
		this.uStatus 	= uStatus;
		this.uSignIn 	= uSignIn;
		this.uUpDate 	= uUpDate;
		this.uImgUrl 	= uImgUrl;
	}

	
	
	public String getuImgUrl() {
		return uImgUrl;
	}

	public void setuImgUrl(String uImgUrl) {
		this.uImgUrl = uImgUrl;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getuIds() {
		return uId;
	}

	public void setuIds(String uIds) {
		this.uId = uIds;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuRole() {
		return uRole;
	}

	public void setuRole(String uRole) {
		this.uRole = uRole;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuAddr() {
		return uAddr;
	}

	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}

	public String getuBirth() {
		return uBirth;
	}

	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}

	public String getuStatus() {
		return uStatus;
	}

	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}

	public Date getuSignIn() {
		return uSignIn;
	}

	public void setuSignIn(Date uSignIn) {
		this.uSignIn = uSignIn;
	}

	public Date getuUpDate() {
		return uUpDate;
	}

	public void setuUpDate(Date uUpDate) {
		this.uUpDate = uUpDate;
	}

	@Override
	public String toString() {
		return "User [uNo=" + uNo + ", uId=" + uId + ", uPw=" + uPw + ", uRole=" + uRole + ", uName=" + uName
				+ ", uNickname=" + uNickname + ", uPhone=" + uPhone + ", uAddr=" + uAddr + ", uBirth=" + uBirth
				+ ", uImgUrl=" + uImgUrl + ", uStatus=" + uStatus + ", uSignIn=" + uSignIn + ", uUpDate=" + uUpDate
				+ "]";
	}

	
}
