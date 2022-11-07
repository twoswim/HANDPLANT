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
	        <div class="container py-5 py-sm-6 py-md-7">
	            <div class="row justify-content-center pt-4">
	                <div class="col-lg-7 col-md-9 col-sm-11">
	                    <h1 class="h2 pb-3">비밀번호를 잊으셨나요?</h1>
	                    <p class="fs-sm">이메일 인증을 통해 비밀번호를 변경하세요.</p>
	                    <ul class="list-unstyled fs-sm pb-1 mb-4">
	                        <li><span class="text-primary fw-semibold me-1">1.</span>이메일 주소를 입력해주세요.</li>
	                        <li><span class="text-primary fw-semibold me-1">2.</span>발송된 임시 코드를 입력해주세요.</li>
	                    </ul>
	                    <div class="bg-secondary px-3 py-4 p-sm-4">
	                        <form class="needs-validation p-2" novalidate>
	                            <div class="mb-3 pb-1">
	                                <input class="form-control" type="email" required id="recovery-email" style="border-radius: 0" />
	                                <div class="invalid-feedback">올바른 이메일을 입력해주세요.</div>
	                            </div>
	                            <button class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim __navbar-margin-lr" type="submit" style="height: 30px">비밀번호 변경</button>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </main>
	    
	    <%@ include file="/views/common/footer.jsp" %>
	    
	</body>
</html>