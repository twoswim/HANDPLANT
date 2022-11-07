<%@page import="com.hp.user.model.vo.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 헤더부 구현할 기능 리스트 -->
	<!-- 1. 로그인 공통부 기능 구현 -->
	<!-- 2. 메뉴(네비게이션) 기능 작성 -->

	<%
	String path = request.getContextPath();
	String saveId = "";
	User loginUser = (User)session.getAttribute("loginUser");
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
				break;
			}
		}
	}
	%>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>

	<!-- 로그인-->
	<% if(loginUser == null){ %>
	<%-- 일반 로그인 Form 시작! --%>
	<div class="modal fade" id="modal-signin" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered" role="document"
			style="justify-content: center">
			<img src="<%=request.getContextPath()%>/source/img/3_swim/loginLogo.png" style="height:449px; background-color: white" />
			<div class="modal-content border-0">
				<div class="view show" id="modal-signin-view">
					<div class="modal-body bg-light px-4">
						<p class="fs-ms text-muted">핸드플랜트와 함께해 주셔서 감사드립니다.</p>
						
						<%@ include file="/views/member/login.jsp" %>
						
					</div>
				</div>
				<%@ include file="/views/member/enroll2.jsp" %>
				<div class="modal-body bg-light px-4" style="border-radius: 0">
               <hr class="my-0" />
               <p class="fs-sm fw-medium text-heading pt-2"></p>
               <!-- <a class="btn-social bs-facebook bs-lg mx-1 mb-2" href="#"><i class="ai-facebook"></i></a> 
               <a class="btn-social bs-twitter bs-lg mx-1 mb-2" href="#"><i class="ai-twitter"></i></a> 
               <a class="btn-social bs-instagram bs-lg mx-1 mb-2" href="#"><i class="ai-instagram"></i></a> 
               <a class="btn-social bs-google bs-lg mx-1 mb-2" href="#"><i class="ai-google"></i></a> -->
               <a style="margin-left : 16px;" href="https://kauth.kakao.com/oauth/authorize?client_id=2a6d2b2f7509ff71d05b04f768dc3d90&redirect_uri=http://localhost/99_Semi_Project/kakao&response_type=code">
                        <img src="<%=request.getContextPath()%>/source/img/4_store/loginButton3.png">
                  </a>
            </div>
			</div>
		</div>
	</div>
	<!-- header start -->
	<header class="__header font-GyenggiM">
		<!-- page down -->
		<div class="__navbar" style="height: 90px"></div>
		<!-- navbar1 -->
		<nav>
			<div
				class="__na_bg __shadow __navbar __fixed-top2 __navbar-expand-lg"
				style="z-index: 1030">
				<div class="__d-flex __align-items-center">
					<a class="__navbar-margin-lr __py-1" href="<%=request.getContextPath()%>" style="z-index : 1050;"><img
						src="<%=request.getContextPath()%>/source/img/headerfooter/handplants_logo.png"
						style="width: 150px" alt="Hand Plants" /></a>
				</div>
				<div class="__d-flex __align-items-center">
					<header class="header navbar navbar-expand-lg navbar-dark navbar-floating" data-scroll-header data-fixed-element>
						<button class="navbar-toggler ms-n2 me-2" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#primaryMenu"></button>
						<div class="d-flex align-items-center order-lg-3 ms-lg-auto">
							<%@ include file="/views/weather/weather2.jsp" %>
							<a class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim __navbar-margin-lr"
								href="#modal-signin" data-bs-toggle="modal"
								data-view="#modal-signin-view">로그인
							</a>
						</div>
					</header>
				</div>
			</div>
		</nav>
		<!-- navbar2 -->
		<nav>
			<div
				class="__na_bg __shadow __navbar __fixed-top2 __navbar-expand-lg"
				style="margin-top: 3.1rem; z-index: 1029">
				<div class="__d-flex __align-items-center">
					<a class="__navbar-margin-lr __py-1" href="<%=request.getContextPath()%>/views/html/3_pernality.jsp"><img
						src="<%=request.getContextPath()%>/source/img/headerfooter/plantstest_txt.png"
						style="width: 130px" alt="plantstest" /></a>
				</div>
				<div class="__d-flex __align-items-center">
					<ul class="__d-flex __align-items-center"
						style="list-style: none; margin-bottom: 0">
						<li style="margin-bottom: 0"><a class="__nav-link"
							href="<%=request.getContextPath()%>">Home</a></li>
						<li style="margin-bottom: 0"><a class="__nav-link"
							href="<%=request.getContextPath()%>/plant/list">식물검색</a></li>
						<li style="margin-bottom: 0"><a class="__nav-link"
							href="<%=request.getContextPath()%>/views/html/3_placeSearch.jsp">플레이스</a></li>
						<li style="margin-bottom: 0"><a class="__nav-link"
							href="<%=request.getContextPath()%>/board/list">게시판</a></li>
						<li style="margin-bottom: 0"><a class="__nav-link"
							href="<%=request.getContextPath()%>/product/list">스토어</a></li>
							<li style="margin-bottom: 0"><a class="__nav-link" id="alert"
							href="#">마이페이지</a></li>
							
					</ul>
				</div>
			</div>
		</nav>
	</header>
	
	<script type="text/javascript">
							$("#alert").click(function(){
						 			alert('로그인 후 이용해주세요.');
						 		});
							</script>
	<%-- 일반 로그인 Form 끝! --%>
	<%} else { %>
	<%-- 로그인 성공부 시작!--%>
	<header class="__header font-GyenggiM">
		<!-- page down -->
		<div class="__navbar" style="height: 90px"></div>
		<!-- navbar1 -->
		<nav>
			<div
				class="__na_bg __shadow __navbar __fixed-top2 __navbar-expand-lg" style="z-index: 1030">
				<div class="__d-flex __align-items-center">
					<a class="__navbar-margin-lr __py-1" href="1_Mainpage.jsp"><img
						src="<%=request.getContextPath()%>/source/img/headerfooter/handplants_logo.png"
						style="width: 150px" alt="Hand Plants" /></a>
				</div>
				<div class="__d-flex __align-items-center">
					<header
						class="header navbar navbar-expand-lg navbar-dark navbar-floating"
						data-scroll-header data-fixed-element>
						<div class="d-flex align-items-center order-lg-3 ms-lg-auto">
							<%@ include file="/views/weather/weather2.jsp"%>
							<a style="margin-left:16px;"><%=loginUser.getuName() %> 님, 환영합니다.</a> <a
								class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim __navbar-margin-lr"
								href="<%=path%>/logout">로그아웃</a>
						</div>
					</header>
				</div>
			</div>
		</nav>
		<!-- navbar2 -->
		<nav>
			<div
				class="__na_bg __shadow __navbar __fixed-top2 __navbar-expand-lg"
				style="margin-top: 3.1rem; z-index: 1029">
				<div class="__d-flex __align-items-center">
					<a class="__navbar-margin-lr __py-1" href="<%=request.getContextPath()%>/views/html/3_pernality.jsp"><img
						src="<%=request.getContextPath()%>/source/img/headerfooter/plantstest_txt.png"
						style="width: 130px" alt="plantstest" /></a>
				</div>
				<div class="__d-flex __align-items-center">
					<ul class="__d-flex __align-items-center"
					style="list-style: none; margin-bottom: 0">
					<li style="margin-bottom: 0"><a class="__nav-link"
						href="<%=request.getContextPath()%>">Home</a></li>
					<li style="margin-bottom: 0"><a class="__nav-link"
						href="<%=request.getContextPath()%>/plant/list">식물검색</a></li>
					<li style="margin-bottom: 0"><a class="__nav-link"
						href="<%=request.getContextPath()%>/views/html/3_placeSearch.jsp">플레이스</a></li>
					<li style="margin-bottom: 0"><a class="__nav-link"
						href="<%=request.getContextPath()%>/board/list">게시판</a></li>
					<li style="margin-bottom: 0"><a class="__nav-link"
						href="<%=request.getContextPath()%>/product/list">스토어</a></li>
					<li style="margin-bottom: 0"><a class="__nav-link"
						href="<%=request.getContextPath()%>/myPage/list">마이페이지</a></li>
				</ul>
				</div>
			</div>
		</nav>
	<%} %>
	</header>
	<!-- header end -->