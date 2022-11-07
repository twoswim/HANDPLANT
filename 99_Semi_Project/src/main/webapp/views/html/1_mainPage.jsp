<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<!-- 타이틀/아이콘 -->
		<title>HANDPLANTS</title>
		<link rel="icon" type="image/png" sizes="32x32"
			href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
		<!-- MainPage.css -->
		<link rel="stylesheet" media="screen"
			href="<%=request.getContextPath()%>/source/css/1_Mainpage.css" />
		<!-- navfooter.css -->
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/source/css/headerfooter.css">
		<!-- Vendor Styles-->
		<link rel="stylesheet" media="screen"
			href="<%=request.getContextPath()%>/source/vendor/tiny-slider/dist/tiny-slider.css" />
		<!-- Main Theme Styles + Bootstrap-->
		<link rel="stylesheet" media="screen"
			href="<%=request.getContextPath()%>/source/css/theme.min.css">	
		
	</head>
	<style>
        body {
            font-family: 'GyeonggiTitleM' !important;
        }
	</style>
	
	<body> 
	<%-- header --%>
	<%@ include file="/views/common/header.jsp" %>
	
	 <!-- Hero with parallax effect / 메인페이지 왼쪽 사진-->
    <section class="position-relative mt-4">
        <div class="position-absolute top-50 start-0 w-100 opacity-65"></div>
        <div class="position-relative zindex-5 container_fluid">
            <div class="_row>">
            
               <%@ include file="/views/todayflower/todayflower.jsp" %>
                
                <!-- page start -->
                <div class="col-lg-7 col-md-7 overflow-hidden">
                    <div class="row parallax me-n7 me-md-0" style="max-width: 1030px;">
                        <div class="parallax-layer" style="z-index: 2;" data-depth="0.05"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_flowers_0.png" alt="flowers0"></div>
                        <div class="parallax-layer" style="z-index: 2;" data-depth="0.09"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_flowers_1.png" alt="flowers1"></div>
                        <div class="parallax-layer" style="z-index: 2;" data-depth="0.15"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_flowers_2.png" alt="flowers2"></div>
                        <div class="parallax-layer" style="z-index: 2;" data-depth="0.1"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_flowers_3.png" alt="flowers3"></div>
                        <div class="parallax-layer" style="z-index: 3;"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_BigLogo.png" alt="Biglogo"></div>
                        <div class="parallax-layer .__shadow" style="z-index: 4;" data-depth="0.08"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_BigLogo_cir.png" alt="logocircle"></div>
                        <div class="parallax-layer" style="z-index: 5;" data-depth="0.1"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_middleFlower.png" alt="middleflower"></div>
                        <div class="parallax-layer" style="z-index: 6;"><img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_secondPage.png" alt="secondpagepng"> </div>
                    </div>
                </div>
                <div class="position_absolute_1 col-md-5 pt-4">
                    <!-- 메인페이지 첫번째 -->
                    <div class="mx-5 my-3 mb-7 order-md-1 text-center text-md-start " style="max-width: 420px; ">
                        <h2 class="h4 font-GyenggiM text-light mb-2 ">HANDPLANTS</h2>
                        <h2 class="text-dark font-GyenggiM mb-2 ">식물의 어떤 것이<br>알고 싶든<br> 한 곳에서 간단하게</h2>
                        <p class="text-dark font-GyenggiL mb-3 ">식물에 대해서 궁금할 때, 식물과 관련된 정보 공유를 원할 때, 내가 키우는 식물에 대한 정보를 기록하고 싶을 때. 모두 핸드플랜트(HANDPLANTS)에서 한번에 간단하게 해결해보세요.</p>
                        <div class="d-flex font-GyenggiB align-items-center justify-content-md-start pb-7 pb-xl-7 "><a class="m-btn m-btn-gra2 m-btn-gra-anim " href="#modal-signin" data-bs-toggle="modal" data-view="#modal-signin-view">Go to LogIn</a>
                        </div>
                    </div>

                    <!-- 메인페이지 두번째 화면 -->
                    <div class="position_relative_t_9 mx-5 mt-7 order-md-1 text-center text-md-start" style="max-width: 500px;">
                        <div class="container">
                            <div class="row">
                                <div class=" order-md-1 order-2">
                                    <div class="position-relative">
                                        <img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/main_2_p_flowers.png" alt="P_flowers">
                                    </div>
                                    <h2 class="h4 font-GyenggiM text-light mb-0">Why should plants be grown?</h2>
                                    <!-- Carousel-->
                                    <div class="tns-carousel-wrapper">
                                        <!-- 1 -->
                                        <div class="tns-carousel-inner" data-carousel-options="{&quot;gutter&quot;: 20, &quot;responsive&quot;: {&quot;0&quot;: {&quot;nav&quot;: true, &quot;controls&quot;: false}, &quot;991&quot;: {&quot;nav&quot;: false, &quot;controls&quot;: true}}}">
                                            <!-- <div class="tns-carousel-inner"> -->
                                            <!-- Carousel item 1-->
                                            <blockquote class=" mt-3 mb-0">
                                                <h2 class="text-dark font-GyenggiM mb-3 ">1. 우리의 정신 건강</h2>
                                                <p class="text-dark font-GyenggiL mb-3 ">최근 1인 가구의 비중이 높아지고 있지만, 여건상의 이유로 인해 반려동물 입양을 마음먹기는 쉬운 일이 아니죠<br> 비교적 관리가 쉽고 마음을 쏟을 수 있는 반려식물을 키우는 것은 어떨까요?<br> 꽃이 피거나 식물이 크는 모습을 보며 성취감을 느끼고, 반려식물에 애정을 쏟으며 마음을 나누어 주며 긍정적인 에너지를 얻을 수 있어요.</p>
                                            </blockquote>
                                            <!-- Carousel item 2-->
                                            <blockquote class=" mt-3 mb-0">
                                                <h2 class="text-dark font-GyenggiM mb-2 ">2. 육체적 건강</h2>
                                                <p class="text-dark font-GyenggiL mb-3 ">환기를 자주 하고 싶어도, 미세먼지와 황사 등의 다른 원인들로 인해 환기가 어려울 때도 많죠?<br> 그렇기 때문에 반려식물의 힘을 빌려 지속적인 양질의 실내공기를 공급해 주는 것이 우리의 건강에 큰 도움을 줄 것입니다.</p>
                                            </blockquote>
                                            <!-- Carousel item 3-->
                                            <blockquote class=" mt-3 mb-0">
                                                <h2 class="text-dark font-GyenggiM mb-2 ">3. 식물은 식량</h2>
                                                <p class="text-dark font-GyenggiL mb-3 ">먹을 수 있는 식물이던 없는 식물이던 좀비가 터졌는데 그런거 신경 쓸 시간 있을까요?<br> 식물을 키우지 않는 사람들은 굶주림을 해결하기 위해서 밖으로 나왔다가 좀비에게 잡아먹히고 말거예요.</p>
                                            </blockquote>
                                        </div>
                                        <div class="position_relative_t_6 " style="max-width: 130px;">
                                            <img src="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/brown_Flowerpot.png" alt="P_flowers">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <!-- 세번째 페이지 -->
    <section class="font-GyenggiL _bg_pink">
        <table style="margin-left: 5rem; margin-right: 5rem;">
            <!-- news first line -->
            <tr>
                <td colspan="2" class="_w_50">
                    <div class="_h_20 card bg-size-cover bg-position-center border-0 overflow-hidden rounded-0" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(<%=request.getContextPath()%>/source/img/1_mainpage/news/news_1.png);">
                        <div class="card-body content-overlay pb-0">
                        </div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="<%=request.getContextPath()%>/views/html/3_news02.jsp">
                                    <div class="d-flex"><span class="badge _bg_new_r margin_r_05 _font_2 rounded-0">● HOT NEWS</span><span class="badge rounded-0 _bg_new_b _font_2">New</span></div>
                                    <h3 class="_font_8 text-white pt-2 mb-1">도시인도 집에서 식물 키울 수 있도록…지속가능성에 투자</h3>
                                    <div class="_font_1 text-white">by 이지연 / Nov 23, 2021 </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </td>
                <td colspan="2">
                    <div style="margin-left: 5rem; margin-right: 5rem;">
                        <p class="text-light font-GyenggiB _font_8 _m_0">NEWS</p>
                        <p class="text-dark font-GyenggiB _font_9 _m_0">핸드플랜트에서 준비한 재미있는 뉴스들</p>
                        <a href="2_PlantsSearch.html" class="text-dark font-GyenggiL _font_5 _m_0">식물에 대해서 궁금할 때, 식물과 과련된 정보 공유를 원할 때,  내가 키우는 식물에 대한 정보를 기록하고 싶을 때. 모두 핸플(HANDPLANTS)에서 한번에 간단하게 해결해보세요.</a>
                    </div>
                </td>
            </tr>
            <!-- margin -->
            <tr>
                <td colspan="3" style="height: 1rem;"> </td>
            </tr>
            <!-- news second line -->
            <tr>
                <td class="_w_25">
                    <div class="_wh_20 card bg-size-cover bg-position-center border-0 overflow-hidden rounded-0" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(<%=request.getContextPath()%>/source/img/1_mainpage/news/news_2.png);">
                        <div class="card-body content-overlay pb-0">
                        </div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="<%=request.getContextPath()%>/views/html/3_news03.jsp">
                                    <div class="d-flex"><span class="badge _bg_new_g margin_r_05 _font_2 rounded-0">● Essential</span></div>
                                    <h3 class="_font_8 text-white pt-2 mb-1">식물에게 배우는 함께 사는 의미</h3>
                                    <div class="_font_1 text-white">by 홍우정 / Nov 19, 2021 </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </td>
                <td class="_w_25">
                    <div class="_wh_20 card bg-size-cover bg-position-center border-0 overflow-hidden rounded-0" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(<%=request.getContextPath()%>/source/img/1_mainpage/news/news_3.png);">
                        <div class="card-body content-overlay pb-0">
                        </div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="<%=request.getContextPath()%>/views/html/3_news04.jsp">
                                    <div class="d-flex"><span class="badge _bg_new_g margin_r_05 _font_2 rounded-0">● Essential</span></div>
                                    <h3 class="_font_8 text-white pt-2 mb-1">코로나19, 식물과 함께 슬기롭게 극복하자</h3>
                                    <div class="_font_1 text-white">by 정나라 / Aug 18, 2021 </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </td>
                <td colspan="2">
                    <div class="_h_20 card bg-size-cover bg-position-center border-0 overflow-hidden rounded-0" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(<%=request.getContextPath()%>/source/img/1_mainpage/news/news_4.png);">
                        <div class="card-body content-overlay pb-0">
                        </div>
                        <div class="card-footer content-overlay border-0 pt-0 pb-4">
                            <div class="d-sm-flex justify-content-between align-items-end pt-5 mt-2 mt-sm-5">
                                <a class="text-decoration-none text-light pe-2" href="<%=request.getContextPath()%>/views/html/3_news01.jsp">
                                    <div class="d-flex"><span class="badge _bg_new_g margin_r_05 _font_2 rounded-0">● Essential</span></div>
                                    <h3 class="_font_8 text-white pt-2 mb-1">물 주기, 내가 뭘 잘못한 거지?</h3>
                                    <div class="_font_1 text-white">by 김민철 / Nov 18, 2021 </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </section>

	

	<!--마지막 페이지 -->
    <table style="margin-top: 2rem; margin-bottom: 2rem;">
        <tr>
            <td class="_w_25">
                <div style="margin-left: 5rem; margin-right: 5rem; margin-bottom: 8rem;">
                    <p class="text-dark font-GyenggiM _font_7 _m_0">Seraching plants</p>
                    <p class="text-dark font-GyenggiB _font_9 _m_0">내가 알고 싶은 식물을 찾으러 식물 검색 페이지로</p>
                    <a href="<%=request.getContextPath()%>/plant/list" class="text-light font-GyenggiB _font_9 _m_0">바로 가기 ▶</a>
                </div>
            </td>
            <td class="_w_25 _h_18" style="padding: 0; background-image: url(<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/y_p_tulip.png); background-size: cover"></td>
            <td rowspan="2" class="_w_25" style="padding: 0; background-image: url(<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/greenleap.png); background-size: cover"></td>
            <td class="_bg_green">
                <div style="margin-left: 5rem; margin-right: 5rem; margin-top: 10rem;">
                    <p class="text-white font-GyenggiM _font_9 _m_0">[+Four types of searches]</p>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="_bg_green _w_25">
                <div style="margin-left: 5rem; margin-right: 5rem; margin-top: 7rem;">
                    <p class="text-white font-GyenggiM _font_9 _m_0">내가 고른 식물을 한눈에</p>
                    <p class="text-white font-GyenggiL _font_6 _m_0">검색 종류를 지정해 원하는 방향을 빠르게 검색할 수 있게 하여 빠르게 원하는 취향의 식물을 아무것도 모르더라도 찾을 수 있게 도와드립니다. </p>
                </div>
            </td>
            <td class="_w_25 _h_18" style="padding: 0; background-image: url(<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/flower_paper.png); background-size: cover"></td>
        </tr>
    </table>
    
    <%-- footer --%>
	<%@ include file="/views/common/footer.jsp" %>
	
	
	
	
	
	