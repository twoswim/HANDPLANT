<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hp.board.model.vo.Reply"%>
<%@ page import="com.hp.board.model.vo.Board"%>

<%
	Board b = (Board)request.getAttribute("board");
	String Bofile = b.getBoFileName();
	String Re_bofile = b.getRe_boFileName();
	Random ran = new Random();
	int num = ran.nextInt(5);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>HANDPLANTS</title>
<link rel="icon" type="image/png" sizes="32x32"
			href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
		

<!-- Vendor Styles-->
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/vendor/tiny-slider/dist/tiny-slider.css" />
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/vendor/lightgallery.js/dist/css/lightgallery.min.css" />


<!-- 1_MainPage.css -->
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/css/1_Mainpage.css" />

<!-- JQuery 사용 선언  -->
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>

<style>
body {
	font-family: 'GyeonggiTitleM' !important;
	background-color: #f6ebe6;
}

.banner {
	padding-top: 50px !important;
	padding-left: 336.5px !important;
	margin-top: 10px !important;
	height: 300px !important;
	background-image: url(<%= request.getContextPath ()%>/source/img/4_store/banner4.png)
		!important;
	background-size: cover;
}
</style>

<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/css/theme.min.css" />
<!-- Header Footer CSS-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/source/css/headerfooter.css" />
</head>

<!-- Body-->
<body>
	<main class="page-wrapper">

		<%@ include file="/views/common/header.jsp"%>

		<!-- Page content-->
		<div class="container position-relative zindex-5 pb-4 mb-md-3"
			style="margin-top: 90px">
			<div class="row">

				<%@ include file="/views/common/sidebar.jsp"%>

				<!-- 게시판 상세내용 시작  -->
				<!-- Content-->
				<div class="col-lg-8">
					<div
						class="d-flex flex-column h-100 bg-light rounded-0 shadow-lg p-4">
						<div class="py-2 p-md-3">
							<!-- Title + Delete link-->
							<%if(loginUser != null){
									if(loginUser.getuIds().equals(b.getuIds()) || loginUser.getuRole().equals("관리자")){%>
							<div class="font-GyenggiL"
								style="position: absolute; right: 0; padding-right: 54px">
								<button class="g-btn-outline g-btn" style="font-size: 12px"
									type="button"
									onclick="location.href='<%= request.getContextPath() %>/board/update?boardNo=<%=b.getBoNo()%>'">수정</button>
								<button class="g-btn-outline g-btn" style="font-size: 12px"
									type="button" id="btnDelete">삭제</button>
							</div>
							<%}
								}%>
							<div class="h3 align-middle badge bg-info rounded-0"><%=b.getBoType()%></div>
							<div
								class="d-sm-flex align-items-center justify-content-between pb-4 text-center text-sm-start">
								<h1 class="h3 mb-2 text-nowrap"><%=b.getBoTitle()%>
								</h1>
								<div class="p mb-0 fs-ms text-muted">
									조회수
									<%=b.getBoView()%></div>
							</div>

							<!-- Content-->
							<div class="bg-secondary rounded-0 p-4 mb-4"
								style="padding-top: 0.5rem !important;">
								<div class="p mb-0 fs-ms text-muted"
									style="position: relative; left: 33rem;"><%=b.getBoCreateDate()%>/<%=b.getBoModifyDate()%></div>
								<div class="d-block d-sm-flex align-items-center">
									<% if(b.getBoImgUrl() != null){ %>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										src="<%=b.getBoImgUrl()%>" alt="urlprofil" style="width: 70px; height: 70px; object-fit: cover;">
									<%} else {
									if(num == 1){%>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_1"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic.jpg"
										style="width: 70px; height: 70px; object-fit: cover;">
									<% } else if(num == 2){ %>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_2"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic2.jpg"
										style="width: 70px; height: 70px; object-fit: cover;">
									<%} else if(num == 3){%>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_3"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic3.jpg"
										style="width: 70px; height: 70px; object-fit: cover;">
									<%} else{%>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_4"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic4.jpg"
										style="width: 70px; height: 70px; object-fit: cover;">
									<%} 
									}%>
									<div class="ps-sm-3 text-center text-sm-start">
										<div class="p mb-0 fs-ms text-muted"><%=b.getuIds()%></div>
										<div class="p mb-0 fs-ms text-muted"><%=b.getuName()%></div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="mb-3 pb-1">
										<label class="form-label px-0" for="account-email">내용</label>
										<div class="form-control rounded-0" style="min-height: 15rem;">
											<%if(Bofile != null && Bofile.length() > 0 
												&& (Bofile.contains(".jpg") || Bofile.contains(".jpeg") || Bofile.contains(".png"))){%>
											<img src="<%=path%>/resources/upload/board/<%=Re_bofile%>"
												style="max-width: 30rem; margin-bottom: 1rem;" />
											<%} %>

											<div>
												<%=b.getBoCont()%>
											</div>
										</div>
									</div>
								</div>
								<%if(Bofile != null && Bofile.length() > 0){ %>
								<div style="text-align: right;">
									<div class="mb-3 pb-1">
										<label class="form-label px-0" style="font-size: 0.8rem;"
											for="account-ln">첨부파일</label> <a
											href="javascript:fileDownload('<%=Bofile%>','<%=Re_bofile%>');">
											<div class="rounded-0"
												style="font-size: 0.8rem; color: #737491;">
												<img
													src="<%= request.getContextPath() %>/resources/images/file.png"
													width="17" height="17" />
												<%=Bofile%>
											</div>
										</a>
									</div>
								</div>
								<%} %>
								<!-- 게시판 상세내용 끝  -->


								<!-- [폭탄]댓글 form 시작  -->
								<div style="float: left;">
									<form action="<%=request.getContextPath()%>/board/reply"
										method="post">
										<div class="col-sm-9"
											style="padding-right: 0px; width: 600px; float: left;">
											<div class="mb-3 pb-1">
												<label class="form-label px-0" for="account-ln">댓글</label> 
												<input
													type="hidden" name="boardNo" value="<%=b.getBoNo()%>" /> 
													<input type="hidden" name="writerId"
													value="<%=loginUser != null ? loginUser.getuIds() : "" %>" />
													<input type="hidden" name="writerName"
													value="<%=loginUser != null ? loginUser.getuName() : "" %>" />
												<input class="form-control rounded-0" type="text"
													id="replyContent" name="content">
											</div>
										</div>
										<div style="padding-right: 0px; float: right;">
											<div>
												<button class="red-btn"
													style="height: 40px; margin-top: 30px;" type="submit"
													id="btn-insert">댓글 작성</button>
											</div>
										</div>
									</form>
								</div>
								<!-- [폭탄]댓글 form 끝 -->

								<!-- [폭탄]댓글 불러오기 시작 -->
								<div class="col-12">
									<%for(Reply reply: b.getReplies()) { %>
									<hr class="mt-2 mb-4">
									<div>
										<div style="font-size: 12px; display: inline;"><%=reply.getuName()%>
											(
											<%=reply.getCoId()%>
											) /
											<%=reply.getCoCreateDate() %></div>
										<%if(loginUser != null && loginUser.getuIds().equals(reply.getCoId())){ %>
										<form action="<%=request.getContextPath()%>/board/replydel"
											class="font-GyenggiL" style="display: inline;">
											<input type="hidden" name="replyNo"
												value="<%=reply.getCoNo()%>"> <input type="hidden"
												name="boardNo" value="<%=b.getBoNo()%>">
											<button class="d-btn-outline d-btn" style="font-size: 12px"
												type="submit" class="btn-delete">삭제</button>
										</form>
										<%} %>
									</div>
									<%= reply.getCoContent() %>
									<%} %>
								</div>
								<!-- [폭탄]댓글 불러오기 끝 -->

								<div class="col-12" style="margin-top: 15px;">
									<div class="d-flex flex-wrap justify-content-between">
										<div class="form-check d-block" style="padding-left: 300px;">
											<a class="blue-btn"
												href="<%=request.getContextPath()%>/board/list"
												style="height: 40px; padding-top: 8px" type="button">목록으로</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/views/common/footer.jsp"%>

</body>
<script type="text/javascript">
    // get 방식으로 페이지 요청하는 코드
    
	function fileDownload(originName, reName){
		var url = "<%=request.getContextPath()%>/board/fileDown";
		var oName = encodeURIComponent(originName);
		var rName = encodeURIComponent(reName);
		var resquestURL = url + "?originName=" + oName + "&reName=" + rName;
		location.assign(resquestURL);
		alert("파일을 요청하였습니다.");
	}
    
	function deleteReply(replyNo, boardNo){
		var url = '<%=request.getContextPath()%>/board/replydel?replyNo=';
		var requestURL = url + replyNo + '&boardNo=' + boardNo;
		location.replace(requestURL);
	}
	
	// ES6 (e)=> = function(e)
	$(document).ready(() => {
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("<%= request.getContextPath() %>/board/delete?boardNo=<%= b.getBoNo()%>");
			}
		});
		
		$("#replyContent").on("focus", (e) => {
			if(<%= loginUser == null %>) {
				alert("로그인 후 이용해주세요!");
				$("#userId").focus();				
			}
		});
	});
</script>
</html>