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
	                <div class="row">
	                    <!-- Content-->
	                    <div style="margin-top: 130px">
	                        <div class="pb-4" style="max-width: 38rem">
	                            <h1>식물에게 배우는 함께 사는 의미</h1>
	                        </div>
	                        <!-- Post author + Sharing-->
	                        <div class="row position-relative g-0 align-items-center border-top border-bottom mb-4">
	                            <div class="col-md-6 py-3 pe-md-3">
	                                <div class="d-flex align-items-center justify-content-center justify-content-md-start">
	                                    <div class="d-flex align-items-center me-grid-gutter">
	                                        <div class="ps-2">
	                                            <h6 class="nav-heading mb-1"><a href="#">홍우정 기자</a></h6>
	                                            <div class="text-nowrap">
	                                                <div class="meta-link fs-xs"><i class="ai-calendar me-1 align-vertical"></i>&nbsp;Nov 19, 2021</div>
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
	                           식물과 함께살다보면, 말하지 않는 동물의 마음을 읽을 수 있게 되듯이 말하지 않는 식물의 마음을  조금씩 이해하게 됩니다.<br>
	                           식물과 함께 지내면서 얻은 것이 있다면 이런 것들인것 같아요.<br>
	                           함께사는 건 뭔지, 같이 잘 지내려면 어떻게 해야할지, 자연은 우리에게 뭘 말하고 싶은지, 식물을 통해서 배울 수 있습니다.
	                        </p>
	                        <div class="py-4">
		                       	<div class="tns-carousel-wrapper gallery">
		                            <div>
		                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_plant_news31.jpg" style="width: 600px" />
		                            </div>
		                        </div>
		                        <br><br>
	                            <h4>1. 식물을 잘 키우고 싶은데 어떻게 해야 돼요?</h4>
	                            <p>
	                                “식물을 잘 키우고 싶은데 어떻게 해야 돼요?”라고 누군가 묻는다면, 저는 인간관계와 비슷한 거라고 말하고 싶습니다.<br>
	                                고정관념없이 이해하고 있는 그대로의 모습을 바라보고자 노력하면 어떤 식물과도 잘 지낼 수 있어요.<br>
	                                <br>
	                                원래 모든 관계는 어려운 법인데, 식물과의 관계는 쉽게 생각하는 것 같지 않나요?<br>
	                                쉽다고 생각하기 때문에 더 빨리 실망하고 포기하는 것 같고요.<br>
	                                <br>
	                                그런데, 사실 식물을 잘 키우는 사람들도 새로운 식물들을 많이 들이는 만큼 많이 떠나보냅니다.<br>
	                                식물이 다 비슷비슷해 보이지만 사람처럼 성격이 모두 달라요. 많은 사람들을 만나고 다양한 경험을 해도 '세상에 이런 사람이 있다니' 하면서 놀라는 것처럼요.<br>
	                                식물도 비슷합니다. 웬만큼 알았다고 생각했는데 완전히 아니더라고요. 그러니 조금만 관심을 가지면 분명 친해질 수 있습니다.<br>
	                            </p>
		                       	<div class="tns-carousel-wrapper gallery">
		                            <div>
		                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_plant_news32.jpg" style="width: 600px" />
		                            </div>
		                        </div>
		                        <br><br>	                            
	                            <h4>2. 자연의 디자인 원칙은 협업</h4>
	                            <p>
		                            요즘같은 시기에는 자연이 어떻게 살고 있는지를 관찰하면서 배울 필요가 있는 것 같아요.<br>
		                            자연의 디자인 원칙은 협업입니다. 나무는 혼자서도 잘 자라는 것처럼 보이지만 사실 다양한 네트워크의 도움을 받아서 자라요.<br>
		                            흙과 물에서부터, 조그만 벌레, 새, 심지어는 인간까지도 포함하여 여러 도움을 받아서 자랍니다.<br>
		                            야생의 숲에는 나무 혼자만 있지 않죠. 서로 맞물리고, 서로 뒷받침하면서 같이 삽니다.<br>
		                            <br>
		                            체르노빌에서 인간이 사라지고 30여 년이 흐른 지금, 야생의 숲으로 바뀌었다는 다큐멘터리를 봤습니다.<br>
		                            풀과 나무가 자라면서 작은 곤충들이 생겨나고, 작은 동물과큰 동물들이 하나씩 모이다가 포식자인 늑대까지 나타났습니다.<br>
		                            아무도 살지 못할 것이라고 예상했던 곳에서 야생의 숲이만들어진 것이죠.<br>
		                            <br>
		                            여기서 중요한 포인트는 바로 '함께 살지 않으면 숲은 만들어지지 않는다'는 겁니다. 뭔가 느껴지는게 있지 않나요.<br>
		                            제가 식물을 관찰하며 깨달은 것은 다들 비슷비슷해보이지만 조금씩 다른 전략으로 자란다는 사실입니다. 그리고 협업을 정말 잘하죠.<br>
		                            <br>
		                            사람들이 도시로 모입니다. 도시는 어떻게 보면 인간이 숲을 보고 만든 인공적인 협업의 숲과 닮았습니다.<br>
		                            인간이 배워야 할 인생의 기술이 아닌가 싶어요.<br>
	                            </p>
		                       	<div class="tns-carousel-wrapper gallery">
		                            <div>
		                            </div>
		                        </div>
		                        <br><br>	                            
	                            <h4>3. 혼자 있으면 편한데 왜 식물들은 에너지를 써가며 힘들게 가족을 만들까?</h4>
	                            <p>
	                                레고 블록처럼 반복되는 모듈 뿌리, 잎, 줄 기, 가지로 구성되어 있기 때문에 어느 한 부분을 잃어도 죽지 않고 살아갈 수 있죠. 그래서 반복되는 모듈을 더 많이 만드는 겁니다.<br>
	                                조그만 레고 블록이 점점 많이 모이면 튼튼한 집도 만들 수 있듯이 말이죠. 몇 달 전 새로 들인 크리소카디움을 집에 오자마자 떨어뜨려서 잎이 끊어졌어요. <br>
	                                여기서도 식물의 생명력을 다시금 보게 되었습니다. 가지치기를 하면 더 많은 가지가 나오는 것처럼, 어떨 땐 일부분을 잃는 것이 몸을 더 크게 만드는 데 효과적이기도 합니다. (그래도 미안..)<br>
	                                <br>
	                                그래서 어떤 식물은 몸의 90~95%를 잃어도 생명에 지장이 없어요.<br>
	                                혼자가 아니라 여럿이 군집을 이루어 집단지성을 발휘 하는 것 같은 아주 전략적인 방법을 선택한 것이죠.<br>
	                                알버트 아인슈타인은 “자연을 깊이 들여다보면 모든 것을 더 잘 이해할 수 있을 것이다.” 라고 말했습니다.<br>
	                                그가 말했듯 자연을 유심히 관찰하면 우리 스스로 삶을 어떻게 살아야 할지 좋은 힌트를 얻을 수 있을지 몰라요.<br>
									<br>
									이번 기회에 식물과 잘 지내보는 것 어떠신가요?<br>
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
	                            <a class="entry-nav me-3" href="<%=request.getContextPath()%>/views/html/3_news02.jsp">
	                                <h3 class="h5 pb-sm-2">Prev post</h3>
	                                <div class="d-flex align-items-start" href="<%=request.getContextPath()%>/views/html/3_news02.jsp">
	                                    <div class="entry-nav-thumb flex-shrink-0 d-none d-sm-block"><img class="rounded" src="<%=request.getContextPath()%>/source/img/3_swim/3_plant_news.jpg" alt="Post thumbnail" /></div>
	                                    <div class="ps-sm-3">
	                                        <h4 class="nav-heading fs-md fw-medium mb-0">도시인도 집에서 식물 키울 수 있도록…지속가능성에 투자</h4>
	                                        <span class="fs-xs text-muted">by 이지연</span>
	                                    </div>
	                                </div>
	                            </a>
	                            <a class="entry-nav ms-3" href="<%=request.getContextPath()%>/views/html/3_news04.jsp">
	                                <h3 class="h5 pb-sm-2 text-end">Next post</h3>
	                                <div class="d-flex align-items-start">
	                                    <div class="text-end pe-sm-3">
	                                        <h4 class="nav-heading fs-md fw-medium mb-0">코로나19, 식물과 함께 슬기롭게 극복하자</h4>
	                                        <span class="fs-xs text-muted">by 정나라</span>
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