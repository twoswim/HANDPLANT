package com.hp.board.model.vo;

import java.util.Date;
import java.util.List;

public class Board {
	private int boNo;				// 게시물 번호
	private int uNo;				// 작성자 번호
	private int rowNum;
	private String uIds;			// 작성자 아이디
	private String uName;			// 작성자 이름
	private String boTitle;			// 게시물 제목
	private String boCont;			// 게시물 내용
	private String boType;			// 게시물 타입
	private String boFileName;		// 게시물 첨부파일
	private String re_boFileName;	// 게시물 첨부파일
	private int boView;				// 게시물 조회수
	private String boStatus;		// 게시물 상태
	private Date boCreateDate;		// 게시물 작성일
	private Date boModifyDate;		// 게시물 수정일
	private List<Reply> replies;	// 게시물 댓글 리스트
	private String boImgUrl;	// 게시물 댓글 리스트

	public Board() {
		super();
	}

	public Board(int boNo, int uNo, int rowNum, String uIds, String uName, String boTitle, String boCont, String boType,
			String boFileName, String re_boFileName, int boView, String boStatus, Date boCreateDate, Date boModifyDate,
			List<Reply> replies, String boImgUrl) {
		super();
		this.boNo = boNo;
		this.uNo = uNo;
		this.rowNum = rowNum;
		this.uIds = uIds;
		this.uName = uName;
		this.boTitle = boTitle;
		this.boCont = boCont;
		this.boType = boType;
		this.boFileName = boFileName;
		this.re_boFileName = re_boFileName;
		this.boView = boView;
		this.boStatus = boStatus;
		this.boCreateDate = boCreateDate;
		this.boModifyDate = boModifyDate;
		this.replies = replies;
		this.boImgUrl = boImgUrl;
	}
	
	

	public String getBoImgUrl() {
		return boImgUrl;
	}

	public void setBoImgUrl(String boImgUrl) {
		this.boImgUrl = boImgUrl;
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

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public String getuIds() {
		return uIds;
	}

	public void setuIds(String uIds) {
		this.uIds = uIds;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getBoTitle() {
		return boTitle;
	}

	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}

	public String getBoCont() {
		return boCont;
	}

	public void setBoCont(String boCont) {
		this.boCont = boCont;
	}

	public String getBoType() {
		return boType;
	}

	public void setBoType(String boType) {
		this.boType = boType;
	}

	public String getBoFileName() {
		return boFileName;
	}

	public void setBoFileName(String boFileName) {
		this.boFileName = boFileName;
	}

	public String getRe_boFileName() {
		return re_boFileName;
	}

	public void setRe_boFileName(String re_boFileName) {
		this.re_boFileName = re_boFileName;
	}

	public int getBoView() {
		return boView;
	}

	public void setBoView(int boView) {
		this.boView = boView;
	}

	public String getBoStatus() {
		return boStatus;
	}

	public void setBoStatus(String boStatus) {
		this.boStatus = boStatus;
	}

	public Date getBoCreateDate() {
		return boCreateDate;
	}

	public void setBoCreateDate(Date boCreateDate) {
		this.boCreateDate = boCreateDate;
	}

	public Date getBoModifyDate() {
		return boModifyDate;
	}

	public void setBoModifyDate(Date boModifyDate) {
		this.boModifyDate = boModifyDate;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	@Override
	public String toString() {
		return "Board [boNo=" + boNo + ", uNo=" + uNo + ", rowNum=" + rowNum + ", uIds=" + uIds + ", uName=" + uName
				+ ", boTitle=" + boTitle + ", boCont=" + boCont + ", boType=" + boType + ", boFileName=" + boFileName
				+ ", re_boFileName=" + re_boFileName + ", boView=" + boView + ", boStatus=" + boStatus
				+ ", boCreateDate=" + boCreateDate + ", boModifyDate=" + boModifyDate + ", replies=" + replies + "]";
	}
	
	
}
