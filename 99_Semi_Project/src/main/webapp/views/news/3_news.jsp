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
	                            <h1>도시인도 집에서 식물 키울 수 있도록…지속가능성에 투자</h1>
	                        </div>
	                        <!-- Post author + Sharing-->
	                        <div class="row position-relative g-0 align-items-center border-top border-bottom mb-4">
	                            <div class="col-md-6 py-3 pe-md-3">
	                                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
	                                    <div class="d-flex align-items-center me-grid-gutter">
	                                        <a class="d-block" href="#"><img class="rounded-circle me-1" src="<%=request.getContextPath()%>/source/img/3_swim/baby.jpg" width="64" /></a>
	                                        <div class="ps-2">
	                                            <h6 class="nav-heading mb-1"><a href="#">이지연 기자</a></h6>
	                                            <div class="text-nowrap">
	                                                <div class="meta-link fs-xs"><i class="ai-calendar me-1 align-vertical"></i>&nbsp;Jun 18</div>
	                                                <span class="meta-divider"></span>
	                                                <a class="meta-link fs-xs" href="#comments" data-scroll><i class="ai-message-square me-1 align-vertical"></i>&nbsp;24age</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- Post content-->
	                        <p class="py-3">
	                            6월 14일 찾은 튀르키예(옛 터키) 이스탄불에 있는 자동차 부품기업 파크홀딩스의 이노베이션 센터 파크랩스. 스타트업 투자 및 연구개발(R&D)을 지원하는 파크랩스의 실내에 들어서자마자 신선한 식재료가 풍성하게 자라고 있는 ‘식물가전(식물재배기)’이 눈길을 끌었다. 파크랩스가 멘토링·자금 지원한 스타트업 ‘바하(VAHAA)’가 개발한 식물재배기다.
	                        </p>
	                        <h2 class="h3 pt-2 pb-4">파크랩스에 놓여있는 바하의 식물재배기.</h2>
	                        <div class="tns-carousel-wrapper gallery">
	                            <div>
	                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_plant_news.jpg" style="width: 600px" />
	                            </div>
	                        </div>
	                        <div class="py-4">
	                            <p class="pt-3">
	                                아후 세르터 파크홀딩스 회장은 “식물재배기는 도시화하고 있는 우리 사회에 도움을 주는 제품”이라며 “팬데믹이 끝나도 식물 재배 열풍은 지속될 것”이라고 전망했다. 폴라리스마켓리서치에 따르면, 전 세계 식물재배기 시장은 2022년부터 2030년까지 연평균 5.2% 커져 32억달러(약 4조2000억원) 규모로 성장할 것으로 예상된다. ‘이코노미조선’이 세르터 회장과 대면·서면 인터뷰를 진행해 이야기를 들어봤다.
	                            </p>
	                            <h4>파크랩스는 자동차와 관련된 이노베이션 센터다. 식물재배기 스타트업에 투자한 이유는 무엇인가.</h4>
	                            <p>
	                                “우리의 좌우명은 ‘함께하는 더 나은 미래’다. 과학과 지속가능성, 기술에 투자하는건 더 나은 미래를 만들기 위해서다. 식물가전 스타트업 바하의 식물재배기는 스마트 정원과 씨앗 및 영양소 키트, 앱이 결합돼있으며, 수경재배와 LED 조명 및 사물인터넷(IoT) 기술로 쉽게 식물을 키울 수 있게 돕는다. 물, 에너지 소비를 줄이고 살충제를 사용하지 않는 지속가능한 미래를 만드는 방법으로 성장·이익잠재력이 뛰어나고 글로벌 확장성을 가지고 있다.”
	                            </p>
	                            <h4>식물을 키우는 것이 지속가능성과 어떤 관련이 있나.</h4>
	                            <p>
	                                “8년 내 전 세계 인구의 70%가 도시에 살게 될 거다. 엄청난 인구통계학적 변화로, 식품 공급망에도 변화가 필요하다. 당장 오늘날 연구만 봐도, 세계 식량 생산량의 3분의 1이 소비되기도 전에 사라진다는 통계도 있다. 먹을거리가 생산자의 손을 떠나, 소비자의 식탁에 오르기까지의 이동 거리, 푸드마일리지(Food Mileage)도 문제다. 미국의 농작물은 2400㎞ 정도를 이동해야 소비된다고 한다. 푸드마일리지가 길수록 신선도 유지를 위해 살충제나
	                                방부제를 많이 사용해야 하고, 운송 중 이산화탄소가 많이 배출돼 환경에 부담이 된다. 식물재배기는 가정이나 자신의 지역 내에서 최소한의 노력으로 식물을 재배할 수 있어서 더 많은 사람이 건강한 식품에 접근할 수 있다. 음식물 쓰레기를 줄이는 데도 도움이 된다. 농약 사용으로 매년 300만 건의 살충제 중독과 25만 명의 사망자가 발생하는데, 이로 인한 피해도 줄어들 수 있다.”
	                            </p>
	                            <h4>코로나19로 많은 사람이 식물을 키우기 시작했다. 이러한 분위기가 계속될까.</h4>
	                            <p>
	                                “코로나19 전부터 식물에 대한 관심이 생기고 있었으나, 팬데믹으로 사람들의 일상이 바뀌면서 변화가 컸다. 많은 사람이 집에서 더 많은 시간을 보내면서 정신건강이 육체 건강만큼 중요한 걸 알게 됐고, 정원 가꾸기, 식물 기르기 등을 취미로 삼기 시작했다. 식품 하나를 살 때도 더 건강하고 영양가 있는 게 무엇인지, 공급망 구조는 어떠한지 관심을 가졌고, 직접 재배도 시작했다. 미국 국립원예협회(NGA)에 따르면 코로나19 팬데믹으로 미국에서만 1830만
	                                명의 정원사가 탄생했고, 대다수는 밀레니얼 세대(1981~96년생)였다고 한다. 코로나19가 불러일으킨 트렌드이지만, 많은 이가 이러한 문제를 인식했기 때문에 팬데믹이 끝나도 지속될 거다.”
	                            </p>
	                        </div>
	                        <!-- Tags + Sharing-->
	                        <div class="row g-0 position-relative align-items-center border-top border-bottom my-5">
	                            <div class="col-md-6 py-2 py-dm-3 pe-md-3 text-center text-md-start">
	                                <a class="btn-tag me-2 my-2" href="#">#식물재배기</a><a class="btn-tag me-2 my-2" href="#">#플랜테리어</a><a class="btn-tag me-2 my-2" href="#">#파크랩스</a>
	                            </div>
	                            <div class="d-none d-md-block position-absolute border-start h-100" style="top: 0; left: 50%; width: 1px"></div>
	                        </div>
	                        <!-- Prev / Next post navigation-->
	                        <nav class="d-flex justify-content-between pb-4 mb-5" aria-label="Entry navigation">
	                            <a class="entry-nav me-3" href="#">
	                                <h3 class="h5 pb-sm-2">Prev post</h3>
	                                <div class="d-flex align-items-start">
	                                    <div class="entry-nav-thumb flex-shrink-0 d-none d-sm-block"><img class="rounded" src="<%=request.getContextPath()%>/source/img/3_swim/3_news2.jpg" alt="Post thumbnail" /></div>
	                                    <div class="ps-sm-3">
	                                        <h4 class="nav-heading fs-md fw-medium mb-0">물 주기, 내가 뭘 잘못한 거지?</h4>
	                                        <span class="fs-xs text-muted">by 김파카</span>
	                                    </div>
	                                </div>
	                            </a>
	                            <a class="entry-nav ms-3" href="#">
	                                <h3 class="h5 pb-sm-2 text-end">Next post</h3>
	                                <div class="d-flex align-items-start">
	                                    <div class="text-end pe-sm-3">
	                                        <h4 class="nav-heading fs-md fw-medium mb-0">우리 집은 햇빛이 잘 들어오지 않습니다만</h4>
	                                        <span class="fs-xs text-muted">김파카</span>
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