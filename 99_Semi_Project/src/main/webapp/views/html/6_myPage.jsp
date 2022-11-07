<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hp.common.util.PageInfo"%>
<%@ page import="com.hp.board.model.vo.Board"%>
<%@ page import="com.hp.board.model.vo.Reply"%>
<%@ page import="com.hp.product.vo.Product"%>
<%@ page import="com.hp.mypage.model.vo.MyPlant"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
<!-- 타이틀/아이콘-->
<title>HANDPLANTS | MyPage</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">

<!-- Vendor Styles-->
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/vendor/tiny-slider/dist/tiny-slider.css" />
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/vendor/lightgallery.js/dist/css/lightgallery.min.css" />

<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/source/css/6_theme.min.css" />
<!-- Header Footer CSS-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/source/css/6_MyCss.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/source/css/headerfooter.css" />

<!-- JQuery 사용 선언  -->
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
</head>

<style>
body {
	font-family: 'GyeonggiTitleM' !important;
}
</style>

<!-- 게시글 -->
<% List<Board> blist = (List<Board>)request.getAttribute("blist");%>
<!-- 댓글 -->
<% List<Reply> rlist = (List<Reply>)request.getAttribute("rlist");%>

<!-- 반려식물 -->
<% List<MyPlant> mplist = (List<MyPlant>)request.getAttribute("myplant"); %>
<%-- <% Myplant m = (Myplant)request.getAttribute("Myplant"); %> --%>
<!-- 식물 -->

<!-- 상품 -->
<% List<Product> prlist = (List<Product>)request.getAttribute("prlist"); %>

<body class="is-sidebar">
	<%
		Random ran = new Random();
		int num = ran.nextInt(5);
	%>
	<main class="page-wrapper">
		<%@ include file="/views/common/header.jsp"%>
		<div class="container">
			<div class="row">
				<!-- Content-->
				<div class="col-lg-9 content py-4 mb-2 mb-sm-0 pb-sm-5">
					<br> <br>
					<!-- 내정보 -->
					<div class="py-2 p-md-3 boxsize" id="my04">
						<form action="<%=request.getContextPath()%>/member/update"
							method="post">
							<h4 class="name_color">My Info</h4>
							<h2 class="h3 pb-4 my_name">내 정보</h2>
							<h5 style="font-size: 14px;">내 정보를 변경할 수 있습니다</h5>
							<!-- Content-->
							<div class="rounded-3 p-4 mb-4 my04_color">
								<div class="d-block d-sm-flex align-items-center">
									<% if(loginUser.getuImgUrl() != null){ %>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										src="<%=loginUser.getuImgUrl()%>" style="width:110px; height:110px; object-fit: cover;">
									<%} else {
									if(num == 1){%>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_1"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic.jpg"
										style="width:110px; height:110px;">
									<% } else if(num == 2){ %>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_2"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic2.jpg"
										style="width:110px; height:110px;">
									<%} else if(num == 3){%>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_3"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic3.jpg"
										style="width:110px; height:110px;">
									<%} else{%>
									<img
										class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0"
										alt="Plofil_4"
										src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic4.jpg"
										style="width:110px; height:110px;">
									<%} 
									}%>
									<div class="ps-sm-3 text-center text-sm-start">
										<div class="mb-3 pb-1">
											<label class="form-label px-0 name_size" for="account-fn">프로필사진 URL</label> 
											<% if(loginUser.getuImgUrl() != null){ %>
											<input class="form-control name_size_s" type="text" style="width: 25rem" name="uImgUrl" value="<%=loginUser.getuImgUrl()%>">
											<%} else {%>
											<input class="form-control name_size_s" type="text" style="width: 25rem" name="uImgUrl" placeholder="url을 추가해주세요">
											<%}%>	
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="mb-3 pb-1">
										<label class="form-label px-0 name_size" for="account-fn">이름</label>
										<input class="form-control name_size_s" type="text"
											name="uName" value="<%=loginUser.getuName()%>">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="mb-3 pb-1">
										<label class="form-label px-0 name_size" for="account-email">아이디</label>
										<input class="form-control name_size_s" type="text"
											readonly="readonly" name="uIds"
											value="<%=loginUser.getuIds()%>">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="mb-3 pb-1">
										<label class="form-label px-0 name_size"
											for="account-username">비밀번호</label> <input
											class="form-control name_size_s" type="text" name="uPw"
											value="<%=loginUser.getuPw()%>">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="mb-3 pb-1">
										<label class="form-label px-0 name_size" for="account-country">주소</label>
										<input class="form-control name_size_s" type="text"
											name="uAddr" value="<%=loginUser.getuAddr()%>">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="mb-3 pb-1">
										<label class="form-label px-0 name_size" for="account-city">전화번호</label>
										<input class="form-control name_size_s" type="text"
											name="uPhone" value="<%=loginUser.getuPhone()%>">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="mb-3 pb-1">
										<label class="form-label px-0 name_size" for="account-address">생년월일</label>
										<input class="form-control name_size_s" type="text"
											name="uBirth" value="<%=loginUser.getuBirth()%>">
									</div>
								</div>
								<div class="col-12">
									<hr class="mt-2 mb-4">
									<div
										class="d-flex flex-wrap justify-content-between align-items-center">
										<button class="btn btn-primary mt-3 mt-sm-0 name_size"
											type="submit" style="rigth: 0px">
											<i class="ai-save fs-lg me-2"></i>수정하기
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>




					<!-- 내 활동-->
					<div class="pb-4 mb-5" id="board">
						<form action="<%=request.getContextPath()%>/board/view"
							method="post">
							<h4 class="name_color">My Activities</h4>
							<h2 class="h3 pb-4 my_name" id="my03">내 활동</h2>
							<ul
								class="masonry-filters nav nav-tabs justify-content-center pb-4">
								<li class="nav-item"><a class="nav-link active"
									href="6_myPage01.jsp#my03" data-group="all">나의 작성 글</a></li>
							</ul>
							<!-- 게시글 -->
							<div class="col-lg-8 ">
								<div class="py-2 p-md-3 " style="width: 880px">
									<!-- Payment methods (table)-->
									<table class="table table-hover mb-0 text-center ">
										<thead>
											<tr>
												<th style="text-align: center; width: 50%;" colspan="2 ">제목</th>

												<th style="width: 20%;">작성자</th>
												<th style="width: 20%;">작성일</th>
												<th>조회</th>
											</tr>
										</thead>
										<tbody>

											<%if(blist == null || blist.isEmpty()){ %>
											<%--게시글이 없는 상황 --%>
											<tr>
												<td colspan="6 ">조회된 게시글이 없습니다.</td>
											</tr>
											<%} else { %>
											<%--게시글 리스트 시작--%>
											<%for(Board b : blist){ %>
											<tr>
												<td style="padding-right: 0px; padding-left: 0px;"><span
													class="align-middle badge bg-info rounded-0 "><%=b.getBoType()%></span></td>
												<td style="text-align: left !important;"><a
													href="<%=path+ "/board/view?boardNo="+b.getBoNo()%>"> <%=b.getBoTitle()%>
												</a></td>
												<td><%=b.getuName()%></td>
												<td><%=b.getBoCreateDate()%></td>
												<td><%=b.getBoView()%></td>
											</tr>
											<%} %>
											<%--게시글 리스트 끝--%>
											<%} %>

										</tbody>
									</table>
								</div>
							</div>
						</form>
					</div>

					<div class="pb-4 mb-5" id="reply">
						<form action="<%=request.getContextPath()%>/board/view"
							method="post">
							<ul
								class="masonry-filters nav nav-tabs justify-content-center pb-4">
								<li class="nav-item" id="replybtn"><a
									class="nav-link  active" href="6_myPage02.jsp#my03"
									data-group="web">나의 댓글</a></li>
							</ul>
							<!-- 댓글 -->
							<div class="col-lg-8 ">
								<div class="py-2 p-md-3 " style="width: 880px">
									<!-- Payment methods (table)-->
									<table class="table table-hover mb-0 text-center ">
										<thead>
											<tr>
											<th style="width: 20%;">게시글 번호</th>
												<th style="text-align: center; width: 50%;" colspan="2 ">댓글 내용
													</th>
												<th>작성자</th>
												<th style="width: 20%;">작성일</th>
												

											</tr>
										</thead>
										<tbody>

											<%if(rlist == null || rlist.isEmpty()){ %>
											<%--댓글이 없는 상황 --%>
											<tr>
												<td colspan="6 ">조회된 댓글이 없습니다.</td>
											</tr>
											<%} else { %>
											<%--댓글 리스트 시작--%>
											<%for( int i = 0; i < rlist.size(); i++){ %>
											<tr>
												<td><%=rlist.get(i).getBoNo()%></td>
												<td style="text-align: center !important;"" colspan="2"><a
													href="<%=path+ "/board/view?boardNo="+rlist.get(i).getBoNo()%>"> <%=rlist.get(i).getCoContent()%>
												</a></td>
												<td><%=rlist.get(i).getuName()%></td>
												<td><%=rlist.get(i).getCoCreateDate()%></td>
												
											</tr>
											<%} %>
											<%--게시글 리스트 끝--%>
											<%} %>

										</tbody>
									</table>
								</div>
							</div>
						</form>
					</div>
					<br> <br> <br> <br> <br> <br>

					<!-- 추가 팝업 -->
					<form action="<%=request.getContextPath()%>/myplant/write"
						method="post" enctype="multipart/form-data">
						<div class="modal fade" id="modal-signin" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered" role="document"
								style="justify-content: center">
								<div class="modal-content border-0">
									<div class="modal-body bg-light px-4">
										<h3>반려식물 등록</h3>
									</div>
									<div class="modal-body bg-light px-4" style="border-radius: 0">
										<div class="row">
											<div class="mb-3 col-sm-3" style="width: 490px">
												<a>사진등록</a>
												<div class="mb-3 col-sm-4" style="width: 450px">
													<input class="form-control" type="file" name="myplantpic">
												</div>
												<a>품종</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="myplantname"
														placeholder="" required style="border-radius: 0" />
												</div>
												<a>애칭</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="myplantmya"
														placeholder="" required style="border-radius: 0" />
												</div>
												<a>물주기</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="myplantwater"
														placeholder="예시) 일주일 1번" "  style="border-radius: 0" />
												</div>
												<a>분양날짜</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="myplantdate"
														placeholder="" required style="border-radius: 0" />
												</div>
											</div>
										</div>
										<br>
										<button class="btn btn-primary mt-3 mt-sm-0" type="submit"
											style="width: 450px; height: 38px">등록하기</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!-- 추가 팝업 끝 -->

					<!-- 수정 팝업 -->
					<form action="<%=request.getContextPath()%>/myplant/update"
						method="post" enctype="multipart/form-data">
						<div class="modal fade" id="modal-signin-update" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered" role="document"
								style="justify-content: center">
								<div class="modal-content border-0">
									<div class="modal-body bg-light px-4">
										<h3>반려식물 수정</h3>
									</div>
									<div class="modal-body bg-light px-4" style="border-radius: 0">
										<div class="row">
											<div class="mb-3 col-sm-3" style="width: 490px">
												<a>사진등록</a>
												<div class="mb-3 col-sm-4" style="width: 450px">
													<input class="form-control" type="file" name="FileName">
												</div>
												<a>품종</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="SctNm"
														placeholder="" required style="border-radius: 0" />
												</div>
												<a>애칭</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="Name"
														placeholder="" required style="border-radius: 0" />
												</div>
												<a>물주기</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="Watering"
														placeholder="" required style="border-radius: 0" />
												</div>
												<a>분양날짜</a>
												<div class="mb-3 col-sm-5" style="width: 450px">
													<input class="form-control" type="text" name="CreateDate"
														placeholder="" required style="border-radius: 0" />
												</div>
											</div>
										</div>
										<br>
										<div>
											<button class="btn btn-primary mt-3 mt-sm-0 " type="submit"
												style="width: 48%; height: 38px; float: left; margin-rigth: 3px">수정하기</button>
											<button class="btn btn-primary mt-3 mt-sm-0 " type="submit"
												style="width: 50%; height: 38px; float: rigth; margin-left: 2px">삭제하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<!--수정 팝업 끝 -->

					<!-- 반려식물-->
					<div class="pb-4 pb-md-5">
						<h4 class="name_color">My Plants</h4>
						<div
							class="d-sm-flex align-items-center justify-content-between pb-4 text-center text-sm-start">
							<h2 class="h3 pt-1 pb-4 my_name" id="my01"
								style="margin-right: 670px">반려식물</h2>
							<button class="btn btn-translucent-danger btn-sm mb-3"
								type="button" href="#modal-signin" data-bs-toggle="modal"
								data-view="#modal-signin-view">
								<i class="#"></i>추가하기
							</button>
						</div>

						<div class="tns-carousel-wrapper">
							<div class="tns-carousel-inner"
								data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: false, &quot;autoHeight&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 16},&quot;850&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 16}, &quot;1100&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 23}}}">

								<% if(mplist != null){ for(MyPlant m : mplist){%>
								<%String Myplanfile = m.getMpFileName(); %>
								<!-- Article-->
								<div class="pb-2" id="<%=m.getMpNo()%>">
									<article class="card card-hover01 mx-1 my01_box">
										<a class="btn-remove"
											href="<%=request.getContextPath()%>/myplant/delete?mpNo=<%=m.getMpNo()%>"><i
											class="ai-trash-2"></i><span class="btn-tooltip">Remove</span></a>
										<a class="" href=""> 
										<%if(Myplanfile != null && Myplanfile.length() > 0 && (Myplanfile.contains(".jpg") || Myplanfile.contains(".jpeg") || Myplanfile.contains(".png"))){%>
											<img src="<%=path%>/resources/upload/myplant/<%=m.getRe_mpFileName()%>" class="card_img" style="width:279px; height:180px; object-fit: cover;" /> 
											<%} else { %> 
											<img src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/noplant.jpg" class="card_img" style="width:279px; height:180px; object-fit: cover;"/> 
										<%}%>
										</a>
										<div class="card-body">
											<a class="meta-link fs-sm mb-2" href="#"><%=m.getMpName()%></a>
											<p class="name_size" href="#modal-signin-update"
												data-bs-toggle="modal" data-view="#modal-signin-view">

												[품종]
												<%=m.getMpSctNm()%>
												<br> [애칭]
												<%=m.getMpName()%>
												<br> [물주기]
												<%=m.getMpWatering()%>
												<br> [분양날짜]
												<%=m.getMpCreateDate()%>
											</p>
										</div>
									</article>
								</div>
								<%}} %>
							</div>
						</div>

					</div>
					<br> <br> <br> <br> <br> <br>



					<!-- 찜한식물 -->
					<div id="my02">
						<!-- 찜상품-->
						<!-- Title + Delete button-->
						<h4 class="name_color">My Product</h4>
						<div
							class="d-sm-flex align-items-center justify-content-between pb-4 text-center text-sm-start">
							<h3 class="my_name">찜한 상품</h3>
							<button class="btn btn-translucent-danger btn-sm mb-3"
								type="button">
								<i class="#"></i>삭제하기
							</button>
						</div>
						<section class="container pt-5 mt-5 mt-md-5 pt-md-6 pt-lg-0">
							<div class="row pb-1 ">
								<form id="my_form"
									action="<%=request.getContextPath()%>/product/list.do"
									method="post"></form>
								<div class="tns-carousel-wrapper">
									<div class="tns-carousel-inner"
										data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: false, &quot;autoHeight&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 16},&quot;850&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 16}, &quot;1100&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 23}}}">


										<% if(prlist != null){ for(Product p : prlist){%>
										<%session.setAttribute("list", prlist);%>

										<!-- Item-->
										<%-- <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter card_best">
					                       <div class="card card-product card-hover">
					                           <a class="card-img-top" href="<%=p.getPrUrl()%>"><img src="<%=p.getPrImage()%>" alt="Product thumbnail"></a>
					                           <div class="card-body">
					                               <h3 class="fs-md fw-medium mb-2"><a class="meta-link" href="shop-single.html"><%=p.getPrName()%></a></h3><span class="font-GyenggiM"><%=p.getPrPrice()%></span>
					                           </div>
					                           <div class="card-footer">
					                               <div class="star-rating mt-n1"><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star-filled active"></i><i class="sr-star ai-star"></i>
					                               </div>
					                               <div class="d-flex align-items-center"><a id ="<%=p.getPrNo()%>" class="btn-wishlist" href="<%=request.getContextPath()%>/product/like?prNo=<%=p.getPrNo()%>"><i class="ai-heart"></i><span class="btn-tooltip">찜하기</span></a></div>
					                               
					                           </div>
					                       </div>
					                   	</div> --%>
										<div class="masonry-grid-item card_best"
											data-groups="[&quot;<%=p.getPrType()%>&quot;]">
											<a class="card card-hover card-product border-0 shadow"
												href="<%=p.getPrUrl()%>"><img class="card-img-top2"
												src="<%=p.getPrImage()%>" alt="Portfolio thumb">
												<div class="card-body text-center">
													<h3 class="fs-md fw-medium mb-2"><%=p.getPrName()%></h3>
													<p class="fs-sm text-muted mb-2"><%=p.getPrPrice() %></p>
												</div> </a>
											<!--  <span>
                                <i class="sr-star ai-star-filled active" ></i>
                                <a class="btn-wishlist" href="#"><i class="ai-heart"></i><span class="btn-tooltip">찜하기</span></a>
                                </span> -->

										</div>

										<% }}%>
									</div>
								</div>
							</div>
						</section>
					</div>
					<br> <br> <br> <br> <br> <br>

				</div>
				<!-- Sidebar-->
				<div class="sidebar col-lg-3 pt-lg-5 fixed_R">
					<div class="offcanvas offcanvas-end offcanvas-collapse fixed_m"
						id="b_sidebar">
						<div
							class="offcanvas-body px-4 pt-3 pt-lg-0 pe-lg-0 ps-lg-2 ps-xl-4"
							data-simplebar>
							<!-- Search-->
							<div class="widget mb-5">
								<%-- <img
									src="url(<%=user.getuImgUrl()%>)"
									src="url(postfiles.pstatic.net/MjAyMjA3MTBfMjMz/MDAxNjU3NDEwMDc4NTU5.p1XpVcxjWQLljm54rO5NZopj_v_0iLAFg0CLDBXIGLAg.bCQ2Mqf0M7JRkgApvZJA6ax-FEAXiwn9ye89KBSMnYwg.JPEG.windysky70/IMG_1045.JPG?type=w773)"
									width="150" height="170"> --%>
								<% if(loginUser.getuImgUrl() != null){ %>
								<img src="<%=loginUser.getuImgUrl()%>" style="width:150px; height:150px; object-fit: cover;">
								<%} else {
											if(num == 1){%>
								<img alt="Plofil_1"
									src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic.jpg"
									style="width:150px; height:150px;">
								<% } else if(num == 2){ %>
								<img alt="Plofil_2"
									src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic2.jpg"
									style="width:150px; height:150px;">
								<%} else if(num == 3){%>
								<img alt="Plofil_3"
									src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic3.jpg"
									style="width:150px; height:150px;">
								<%} else{%>
								<img alt="Plofil_4"
									src="<%=request.getContextPath()%>/source/img/1_mainpage/nophoto/nopic4.jpg"
									style="width:150px; height:150px;">
								<%} 
										}%>
								<div
									class="d-sm-flex align-items-center pt-3 pb-2 mb-5 border-bottom fs-sm">
									<div>
										<h3 class="h5"><%=loginUser.getuName()%></h3>
										<ul class="list-unstyled fs-md mb-4 pb-2">
											<li class="mb-2" style="font-size: 13px;"><%=loginUser.getuIds()%></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- Categories-->
							<div class="widget widget-categories mb-5">
								<h3 class="widget-title">Categories</h3>
								<ul>
									<li><a class="widget-link" href="#my04">내 정보</a></li>
									<li><a class="widget-link" href="#my03">내 활동<small
											class="text-muted ps-1 ms-2">7</small></a></li>
									<li><a class="widget-link" href="#my01">반려식물<small
											class="text-muted ps-1 ms-2">23</small></a></li>
									<li><a class="widget-link" href="#my02">찜한식물<small
											class="text-muted ps-1 ms-2">14</small></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script>
	$("#replybtn").click(
    function refresh() {
      $.ajax({
        url: "",
        dataType: "text",
        success: function(html) {
          $('#board').replaceWith($('#reply'));
          setTimeout(refresh,2000);
        }
      });
    });
    </script>
	<%-- 		<script type="text/javascript">
    // get 방식으로 페이지 요청하는 코드
    
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
	});
</script> --%>

	<%@ include file="/views/common/footer.jsp"%>