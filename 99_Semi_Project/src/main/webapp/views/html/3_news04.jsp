<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
        <meta charset="utf-8" />
        <title>HANDPLANTS</title>
   		
   		<!-- Vendor Styles-->
	    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
	    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/tiny-slider/dist/tiny-slider.css" />
	    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/lightgallery.js/dist/css/lightgallery.min.css" />
	
		<!-- 타이틀 이미지-->
	    <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/source/img/6_mypage/logo_1.png">
   		
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
            background-image: url(<%=request.getContextPath()%>/source/img/4_store/banner4.png) !important;
            background-size: cover;
        }
        </style>
        
        <!-- Main Theme Styles + Bootstrap-->
        <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/theme.min.css" />
        <!-- Header Footer CSS-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/source/css/headerfooter.css" />
    </head>
	
	<!-- Body-->
	<body>
	    <main class="page-wrapper">
		
		<%@ include file="/views/common/header.jsp" %>
	   
	        <!-- Page content-->
	        <div>
	            <div class="container">
	                <div class="row">
	                    <!-- Content-->
	                    <div style="margin-top: 130px">
	                        <div class="pb-4" style="max-width: 38rem">
	                            <h1>코로나19, 식물과 함께 슬기롭게 극복하자</h1>
	                        </div>
	                        <!-- Post author + Sharing-->
	                        <div class="row position-relative g-0 align-items-center border-top border-bottom mb-4">
	                            <div class="col-md-6 py-3 pe-md-3">
	                                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
	                                    <div class="d-flex align-items-center me-grid-gutter">
	                                        <div class="ps-2">
	                                            <h6 class="nav-heading mb-1"><a href="#">정나라</a></h6>
	                                            <div class="text-nowrap">
	                                                <div class="meta-link fs-xs"><i class="ai-calendar me-1 align-vertical"></i>&nbsp;Aug 18, 2021</div>
	                                                <span class="meta-divider"></span>
	                                                <a class="meta-link fs-xs" href="#comments" data-scroll><i class="ai-message-square me-1 align-vertical"></i>&nbsp;</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- Post content-->
	                        <div class="tns-carousel-wrapper gallery">
	                            <div>
	                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_news041.jpg" style="width: 600px" />
	                            </div>
	                        </div>
	                        <div class="py-4">
	                          	<p class="pt-3">
	                             2020년 2월 이후, 대한민국을 비롯한 전 세계는 코로나19라는 팬데믹의 안개 속에 갇혀 제자리를 맴돌고 있는 듯하다. 
	                             코로나로 인한 사회적 거리두기가 장기화하면서 서로 만나지 않고 삶을 유지할 수 있는 온라인 기반의 비대면 서비스에 익숙해져 가고 있지만, 그럼에도 불구하고 심리적인 단절감이나 외로움, 우울감 등의 영향을 받고 있고, 사람들은 정서적 어려움을 호소하고 있다. 
	                            </p>
	                            <p>
	                            이런 상황에서 가정에서 보내는 시간이 길어지며 식물 기르기(홈가드닝)가 새로운 여가활동으로 부상하고 있다. 
	                            실제 관련 산업 매출은 급격하게 증가하고 있다. 국내 온라인 몰에서 홈가드닝과 관련된 매출은 코로나 이전인 2019년에 비하여 지속적으로 증가하고 있으며 이러한 경향은 국내 뿐 아니라 국외에서도 유사하게 나타나고 있다. 
	                            영국과 미국 모두 정원용품과 실내 가드닝 관련 제품의 수요가 증가하고 있다. 구글 검색 트렌드 분석 결과에서도 가드닝 검색량이 50% 이상 증가하는 등 가드닝에 대한 관심이 매우 높은 것을 확인할 수 있다. 
	                            </p>
	                            <p>
	                          	식물 기르기는 답답한 실내 생활 중 소소한 행복을 느낄 수 있는 취미활동으로 인식되고 있는데 이는 식물로부터 쾌적함, 아름다움, 편안함 등을 얻을 수 있을 뿐 아니라 식물의 성장 과정에서 경험하는 성취감을 통해 만족감을 경험하기 때문으로 파악된다. 
	                          	리서치기업 엠브레인에서 식물 기르기의 효과를 조사한 결과, 실내 분위기가 향상되고 일상 속 소소한 기쁨을 준다는 응답이 높게 나타났으며 힐링이 되고 책임감이 생긴 것 같다는 응답이 그 뒤를 이었다.
	                            </p>
	                            <p>
	                            농촌진흥청에서도 2021년 도시민 726명을 대상으로 식물 기르기에 대한 인식과 효과에 대하여 조사했다. 그 결과, 도시민은 식물 기르기를 통해 공간이 아름답고 화사해지는 기분이 들며, 마음이 편안해지고 우울한 기분이 사라진다는 효과에 공감한 것으로 나타났다. 
	                            또한 식물이 자라는 과정에서 느끼는 감동과 보람, 아름다운 식물을 볼 때, 식물에 의해 공간이 쾌적하다고 느낄 때, 식물 기르기를 통해 헬스케어가 이루어진다고 인식하는 것으로 나타났다. 조사에서는 헬스케어식물과 반려식물의 정의에 대해서도 물었다. 
	                            그 결과, 도시민은 환경 개선, 환경정화로 신체적, 심리적 건강 증진에 기여할 수 있는 식물을 헬스케어식물로, 애정을 가지고 교감할 수 있는 식물은 반려식물로 인지하고 있었다. 
	                            헬스케어식물은 공기정화, 공간 장식 등 기능적 측면이 우선되지만 반려식물은 마음 안정과 우울감 해소 등의 정서적 안정을 이끌어 내는 식물이라고 인식한 것이다. 
	                            </p>
	                            <p>
	                            농촌진흥청에서는 사람들의 신체적, 심리적 건강증진에 기여하도록 식물의 다양한 기능을 활용하는 기술을 개발하고 있다. 
	                            식물의 환경정화 기능성을 활용하여 미세먼지를 비롯한 대기 오염물질을 저감할 수 있는 기술을 개발하고 학교, 도서관 등 현장에 적용하고 있으며, 이용자의 특성과 목적에 따라 적절한 반려식물을 추천해주는 플랫폼 구축 연구도 진행 중이다. 
	                            원예치료와 치유농업 등 식물을 활용하여 치유효과를 높일 수 있는 콘텐츠를 개발하고 효과를 구명하는 등의 연구도 진행 중이다.
	                            </p>
	                            <p>
	                            요즘 코로나19 재유행이 심상치 않아 다시 팬데믹의 안개 속에 갇히게 될까 걱정이 앞선다. 
	                            연구 결과가 확산되어 식물이 가진 다양한 기능을 통해 국민의 삶의 질이 향상되고 나아가 식물 수요의 증대로 생산 농가의 소득 향상과 관련 산업의 부가가치 창출로 이어지길 기대해본다.
	                            </p>
	                        </div>
	                        <!-- Tags + Sharing-->
	                        <div class="row g-0 position-relative align-items-center border-top border-bottom my-5">
	                            <div class="col-md-6 py-2 py-dm-3 pe-md-3 text-center text-md-start">
	                                <a class="btn-tag me-2 my-2" href="#">#코로나 19</a><a class="btn-tag me-2 my-2" href="#">#홈가드닝</a><a class="btn-tag me-2 my-2" href="#">#헬스케어식물</a>
	                            </div>
	                            <div class="d-none d-md-block position-absolute border-start h-100" style="top: 0; left: 50%; width: 1px"></div>
	                        </div>
	                        <!-- Prev / Next post navigation-->
	                        <nav class="d-flex justify-content-between pb-4 mb-5" aria-label="Entry navigation">
	                            <a class="entry-nav me-3" href="<%=request.getContextPath()%>/views/html/3_news03.jsp">
	                                <h3 class="h5 pb-sm-2">Prev post</h3>
	                                <div class="d-flex align-items-start" href="<%=request.getContextPath()%>/views/html/3_news02.jsp">
	                                    <div class="entry-nav-thumb flex-shrink-0 d-none d-sm-block"><img class="rounded" src="<%=request.getContextPath()%>/source/img/3_swim/3_plant_news.jpg" alt="Post thumbnail" /></div>
	                                    <div class="ps-sm-3">
	                                        <h4 class="nav-heading fs-md fw-medium mb-0">식물에게 배우는 함께 사는 의미</h4>
	                                        <span class="fs-xs text-muted">by 홍우정</span>
	                                    </div>
	                                </div>
	                            </a>
	                            <a class="entry-nav ms-3" href="<%=request.getContextPath()%>/views/html/3_news01.jsp">
	                                <h3 class="h5 pb-sm-2 text-end">Next post</h3>
	                                <div class="d-flex align-items-start">
	                                    <div class="text-end pe-sm-3">
	                                        <h4 class="nav-heading fs-md fw-medium mb-0">물 주기, 내가 뭘 잘못한 거지?</h4>
	                                        <span class="fs-xs text-muted">by 김민철</span>
	                                    </div>
	                                    <div class="entry-nav-thumb flex-shrink-0 d-none d-sm-block"><img class="rounded" src="<%=request.getContextPath()%>/source/img/3_swim/3_news1.jpg" alt="Post thumbnail" /></div>
	                                </div>
	                            </a>
	                        </nav>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	    
	    <%@ include file="/views/common/footer.jsp" %>
	    
	</body>
</html>