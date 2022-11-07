<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.hp.common.util.PageInfo"%>
<%@page import="com.hp.plant.model.vo.PlantInfo"%>
    
    
    
    <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>HANDPLANTS</title>
            <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
            <!-- 타이틀 이미지-->
            <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/6_mypage/logo_1.png">

            <!-- Css-->
<%-- 			<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/2_plantSearch.css"> --%>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/source/css/headerfooter.css">

            <!-- Vendor Styles-->
            <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
            <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/nouislider/dist/nouislider.min.css" />
            <!-- Main Theme Styles + Bootstrap-->
            <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/theme.min.css">

            <style>
            .right {
            	float : right;
            }
            h4 {
    			font-family: 'GyeonggiTitleB';
    			color: #25233d !important;
			}
			
            .page-loading {
		        position: fixed;
		        top: 0;
		        right: 0;
		        bottom: 0;
		        left: 0;
		        width: 100%;
		        height: 100%;
		        -webkit-transition: all .4s .2s ease-in-out;
		        transition: all .4s .2s ease-in-out;
		        background-color: #fff;
		        opacity: 0;
		        visibility: hidden;
		        z-index: 9999;
		      }
		      .page-loading.active {
		        opacity: 1;
		        visibility: visible;
		      }
		      .page-loading-inner {
		        position: absolute;
		        top: 50%;
		        left: 0;
		        width: 100%;
		        text-align: center;
		        -webkit-transform: translateY(-50%);
		        transform: translateY(-50%);
		        -webkit-transition: opacity .2s ease-in-out;
		        transition: opacity .2s ease-in-out;
		        opacity: 0;
		      }
		      .page-loading.active > .page-loading-inner {
		        opacity: 1;
		      }
		      .page-loading-inner > span {
		        display: block;
		        font-family: 'Inter', sans-serif;
		        font-size: 1rem;
		        font-weight: normal;
		        color: #737491;
		      }
		      .page-spinner {
		        display: inline-block;
		        width: 2.75rem;
		        height: 2.75rem;
		        margin-bottom: .75rem;
		        vertical-align: text-bottom;
		        border: .15em solid #766df4;
		        border-right-color: transparent;
		        border-radius: 50%;
		        -webkit-animation: spinner .75s linear infinite;
		        animation: spinner .75s linear infinite;
		      }
		      
		      .bigger {
		      	width : 500px !important;
		      	height : 500px !important;
		      }
		      @-webkit-keyframes spinner {
		        100% {
		          -webkit-transform: rotate(360deg);
		          transform: rotate(360deg);
		        }
		      }
		      @keyframes spinner {
		        100% {
		          -webkit-transform: rotate(360deg);
		          transform: rotate(360deg);
		        }
		      }
                .banner {
                    padding-top: 50px !important;
                    padding-left: 336.5px !important;
                    margin-top: 10px !important;
                    height: 300px !important;
                    background-image: url(<%=request.getContextPath()%>/source/img/4_store/banner7.png) !important;
                    background-size: cover;
                }
                .table-item-img{
                	width : 50px;
                	height : 50px;
                }
           
            </style>
            <%
            PlantInfo plant = (PlantInfo)request.getAttribute("plantInfo");
            %>
			
        </head>
			<%@ include file="/views/common/header.jsp" %>
			            
		    <main class="page-wrapper font-GyenggiM">
		    <div class="banner">
                <h4 class="h4" style="color: #f44125 !important; ">PLANTSEARCH</h4>
                <h3 class="h2" style="color: black">꽃/식물 검색</h3>
                <p class="fs-lg text-dark">이름, 태그검색으로 나에게 딱 맞는 식물을 검색해보세요! </p>
            </div>
		      <!-- Navbar (Floating dark)-->
		      <!-- Page content-->
		      
		    
		    <div class="container py-4 mb-2 mb-sm-0 pb-sm-5 mt-3" style="display: flex;">
		    <!-- 사진 -->
		    	<section style="width: 43.181818%; margin-right: 60px; display: block; position: relative; vertical-align: baseline; max-height : 300px;">
		    		<div>
		    			<img src="<%=plant.getImgUrl1() %>" style="width : 100%">
		    		</div>
		    	</section >
		    	<!-- 기본정보 -->
		    	<section style="width: 56.818182%; display: block; box-sizing: border-box; vertical-align: baseline;">
		    	<h4><%=plant.getfEngNm()%></h4>
		                <h1 class="h2"><%=plant.getfKorNm()%></h1>
				                <p class="fs-sm mb-4 pb-2"><%=plant.getfContent()%></p>
		
					<div class="simpleinfo-table" style="vertical-align: baseline; box-sizing: border-box; display: block; ">
						<ul class="table-items" style="border-top: 1.5px solid #eaeaea; vertical-align: baseline; box-sizing: border-box; display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;  list-style: none !important; " >
							<div class="table-items-flex" style=" border-bottom: 1.5px solid #eaeaea; display: flex;">
								<li class="table-item pt-2" style="width: 50%; vertical-align: baseline; display: block; position: relative;"><img class="table-item-img"
									src="https://huga.s3.ap-northeast-2.amazonaws.com/fuleaf/v3.0/mobile/plants/ico-water-sprinkler%403x.png">
									<p class="table-item-desc"><%=plant.getfWatering()%><br>흙 표면부터 3cm까지 마르면, 듬뿍 주세요</p></li>
								<li class="table-item pt-2" style="width: 50%; vertical-align: baseline; display: block; position: relative;"><img class="table-item-img"
									src="https://huga.s3.ap-northeast-2.amazonaws.com/fuleaf/v3.0/mobile/plants/ico-sun%403x.png">
									<p class="table-item-desc"><%=plant.getfSunshine()%><br>하루 2~3시간 정도의 은은한 햇빛이 필요해요</p></li>
							</div>
							<div class="table-items-flex " style="border-bottom: 1.5px solid #eaeaea; display: flex;">
								<li class="table-item pt-2" style="width: 50%; vertical-align: baseline;"><img class="table-item-img"
									src="https://huga.s3.ap-northeast-2.amazonaws.com/fuleaf/v3.0/mobile/plants/icon-water-drop%403x.png">
									<p class="table-item-desc"><%=plant.getfHumidity()%><br>주변 공기가 건조해지지 않도록 관리해주세요</p></li>
								<li class="table-item pt-2" style="width: 50%; vertical-align: baseline;"><img class="table-item-img"
									src="https://cdn-icons-png.flaticon.com/512/1843/1843544.png">
									<p class="table-item-desc"><%=plant.getfTemperture()%><br>℃의 온도에서 잘 자라요</p></li>
							</div>
						</ul>
					</div>
		
				</section>
				
		    </div>
		    
		    <div class="container py-4 mb-2 mb-sm-0 pb-sm-5" style="display: flex;">
					<section style="width: 100%; display: block; box-sizing: border-box;">
					<h1 class="h2" style="text-align : center;">식물 상세정보</h1>
					
					<h3 class="h5">학명</h3>
			                <p class="fs-sm mb-4 pb-2"><%=plant.getfSctNm()%></p>
			                <h3 class="h5">꽃말</h3>
			                <p class="fs-sm mb-4 pb-2"><%=plant.getfLang()%></p>
			                <h3 class="h5">활용</h3>
			                <p class="fs-sm mb-4 pb-2"><%=plant.getfUse()%></p>
			                <h3 class="h5">자생지</h3>
			                <p class="fs-sm mb-4 pb-2"><%=plant.getfType()%></p>
			                <h3 class="h5">기르기</h3>
			                <p class="fs-sm mb-4 pb-2"><%=plant.getfGrow()%></p>
					</section>
				</div>
		    </main>
		    <!-- Vendor scrits: js libraries and plugins-->
		    <script src="<%=request.getContextPath()%>vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		    <script src="<%=request.getContextPath()%>vendor/simplebar/dist/simplebar.min.js"></script>
		    <script src="<%=request.getContextPath()%>vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
		    <script src="<%=request.getContextPath()%>vendor/tiny-slider/dist/min/tiny-slider.js"></script>
		    <script src="<%=request.getContextPath()%>vendor/lightgallery.js/dist/js/lightgallery.min.js"></script>
		    <script src="<%=request.getContextPath()%>vendor/lg-fullscreen.js/dist/lg-fullscreen.min.js"></script>
		    <script src="<%=request.getContextPath()%>vendor/lg-zoom.js/dist/lg-zoom.min.js"></script>
		    <!-- Main theme script-->
		    <script src="<%=request.getContextPath()%>js/theme.min.js"></script>
		</html>

            <%@ include file="/views/common/footer.jsp" %>
