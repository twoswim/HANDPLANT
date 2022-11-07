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
	
		<link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
   		
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
	                <div class="row center">
	                    <!-- Content-->
	                    <div style="margin-top: 130px">
	                        <div class="pb-4" style="max-width: 38rem">
	                            <h1>물 주기, 내가 뭘 잘못한 거지?</h1>
	                        </div>
	                        <!-- Post author + Sharing-->
	                        <div class="row position-relative g-0 align-items-center border-top border-bottom mb-4">
	                            <div class="col-md-6 py-3 pe-md-3">
	                                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
	                                    <div class="d-flex align-items-center me-grid-gutter">
	                                        <div class="ps-2">
	                                            <h6 class="nav-heading mb-1"><a href="#">김민철 기자</a></h6>
	                                            <div class="text-nowrap">
	                                                <div class="meta-link fs-xs"><i class="ai-calendar me-1 align-vertical"></i>&nbsp;Nov 18, 2021</div>
	                                                <span class="meta-divider"></span>
	                                                <a class="meta-link fs-xs" href="#comments" data-scroll><i class="ai-message-square me-1 align-vertical"></i>&nbsp;</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- Post content-->
	                        <br>
	                        <h4>
	                            반려식물에 물을 줄 때는 자주 주기 보다 한 번에 충분히 줘야<br> 
	                            광합성 고려해 이른 아침에 뿌리 가까이로 상온수 주는 방식 추천
	                        </h4>
	                        <br>
	                        <div class="tns-carousel-wrapper gallery center">
	                            <div>
	                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_news011.jpg" style="width: 500px" />
	                            </div>
	                        </div>
	                        <div class="py-4">
	                            <p class="pt-3">
	                            반려식물을 기르는 사람들이 늘고 있다. 동물보다 어렵지 않다고는 하지만 그래도 생명을 기르는 일. 의외로 가장 기본인 물을 주는 것부터 실수하기 십상이다.<br> 
	                            화분을 들일 때 주의사항이나 물 주는 법을 듣긴 하지만 까먹거나 지키지 못하는 경우가 생기곤 하는데 그럴 경우 기억할 몇 가지를 제시해 본다. 여기서 말하는 방법은 일반적인 관엽식물 기준이다.
	                            </p>
	                            <p>
	                            식물을 사랑한다고 물을 자주 주는 것은 식물을 괴롭히는 일이다. 오히려 한 번 물을 줄 때 충분히 주는 것이 적게 자주 주는 것보다 훨씬 좋다. 이는 여름에도 마찬가지다.
	                            </p>
	                            <p>
	                            식물도 물을 수급하는 리듬과 강도에 적응하기 때문에 물이 뿌리까지 스며들도록 충분한 양을 일정한 간격으로 주는 것이 좋은 방식이다. 반면 물을 자주 줘서 흙이 늘 젖어 있게 되면 뿌리가 썩기 쉽다. 물론 바닥에 고일 정도의 너무 많은 물도 피해야 하는데 뿌리가 물로 둘러싸여 적절한 산소를 공급받지 못하면 그야말로 질식하게 되고 수분과 영양분을 흡수할 수 없게 된다.
	                            </p>
	                        <div class="tns-carousel-wrapper gallery">
	                            <div>
	                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_news012.jpg" style="width: 500px" />
	                            </div>
	                        </div>
	                        <br>
	                            <p>
	                            〈우리 집은 식물원〉의 정재경 작가는 대부분의 식물이 '과습(過濕, 과한 습기)'으로 죽는다고 지적한다. 그러면서 물을 주기 전에 나무젓가락을 꽂아 봐서 아무것도 묻어나지 않으면 물을 주고, 축축한 흙이 묻어나면 물을 주지 않아도 되는 간편한 확인 방법을 제시한다. 또는 물을 주고 일주일 정도 지나 손가락으로 화분의 흙을 눌러 습한 정도에 따라 물을 주는 것도 방법이라고.
	                            </p>
	                            <p>
	                            물을 주는 시간도 가급적 일정한 것이 좋다. 특히 해뜨기 전이나 이른 아침을 추천한다. 해가 뜨기 시작하면 식물은 본격적으로 광합성을 시작하는데 이때 물은 필수적인 요소이기 때문에 미리 공급해 주는 것이 바람직하다. 그리고 한낮에는 물의 증발량도 많아지므로 이때 물을 줄 경우 뿌리까지 가지 못하거나 금방 마를 수 있다.
	                            </p>
	                            <p>
	                            저녁에 물을 주는 것은 썩 좋은 방법은 아니다. 사람이 잠을 자듯 식물도 해가 지면 광합성은 물론 활동을 줄이고 쉬는 모드로 들어가게 되어 물을 주는 효과가 크지 않다. 물론 식물이 말라가는 것이 보일 경우에는 시간을 따지지 말고 물을 줘야 한다.
	                            </p>
	                        <div class="tns-carousel-wrapper gallery">
	                            <div>
	                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_news013.jpg" style="width: 500px" />
	                            </div>
	                        </div>
	                        <br><br> 
	                            <p>
	                            물은 가급적 뿌리에 가깝게 주는 것이 좋은데 잎과 꽃을 과하게 물로 적시면 곰팡이가 낄 위험이 있다. 요즘과 같이 햇볕이 강한 여름에는 맺힌 물방울이 돋보기 효과를 일으켜 잎이나 꽃에 화상이나 상처를 입힐 수 있다. 농촌진흥청에서 과수농가에 권고하는 사항에도 햇볕이 강할 때 잎이나 과실에 맺힌 물방울로 인한 피해를 주의해야 한다는 내용이 포함되어 있다.
	                            </p>
	                            <p>
	                            끝으로 항상 상온 수준의 물을 주는 것이 중요하다. 뜨거운 물은 당연하겠거니와 차가운 물도 식물에게는 좋지 않다. 보통 집에서 기르는 식물들은 따뜻한 곳에서 자라는 종들이 대부분이기 때문에 차가운 물을 주면 죽을 수도 있다.
	                            </p>
	                        </div>
	                        <!-- Tags + Sharing-->
	                        <div class="row g-0 position-relative align-items-center border-top border-bottom my-5">
	                            <div class="col-md-6 py-2 py-dm-3 pe-md-3 text-center text-md-start">
	                                <a class="btn-tag me-2 my-2" href="#">#반려식물</a><a class="btn-tag me-2 my-2" href="#">#관엽식물</a><a class="btn-tag me-2 my-2" href="#">#물 주는 방법</a>
	                            </div>
	                            <div class="d-none d-md-block position-absolute border-start h-100" style="top: 0; left: 50%; width: 1px"></div>
	                        </div>
	                        <!-- Prev / Next post navigation-->
	                        <nav class="d-flex justify-content-between pb-4 mb-5" aria-label="Entry navigation">
	                            <a class="entry-nav me-3" href="<%=request.getContextPath()%>/views/html/3_news04.jsp">
	                                <h3 class="h5 pb-sm-2 text-end">Prev post</h3>
	                                <div class="d-flex align-items-start">
	                                    <div class="text-end pe-sm-3">
	                                        <h4 class="nav-heading fs-md fw-medium mb-0">코로나19, 식물과 함께 슬기롭게 극복하자</h4>
	                                        <span class="fs-xs text-muted">by 정나라</span>
	                                    </div>
	                                    <div class="entry-nav-thumb flex-shrink-0 d-none d-sm-block"><img class="rounded" src="<%=request.getContextPath()%>/source/img/3_swim/3_plant_news.jpg" alt="Post thumbnail" /></div>
	                                </div>
	                            </a>
	                            <a class="entry-nav ms-3" href="#">
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