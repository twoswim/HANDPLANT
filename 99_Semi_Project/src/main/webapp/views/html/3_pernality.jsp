<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>HANDPLANTS</title>
        <meta name="viewport" contentW="width=device-width, initial-scale=1" />
        <!-- swiper-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css" />
        <!-- Magnigic Popup-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/source/vendor/magnific-popup/magnific-popup.css" />
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/source/css/3_directory.css" />
        <!-- Vendor Styles-->
        <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
        <!-- Main Theme Styles + Bootstrap-->
        <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/theme.min.css" />
        <!-- Header Footer CSS-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/source/css/headerfooter.css" />
        
        <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
   		
        <style>
        body {
            font-family: 'GyeonggiTitleM' !important;
            background-color: #f6ebe6;
        }
        </style>
    </head>

    <body style="background: url(<%=request.getContextPath()%>/source/img/3_swim/3_test_bg.png) no-repeat; background-size: cover;">
       
        <%@ include file="/views/common/header.jsp" %>
        
        <!-- Hero Section-->
        <section class="d-flex align-items-baseline">
            <div class="container-swim py-6 py-lg-7 text-white text-left">
                <h5 class="text-white">HANDPLANT_TEST</h5>
                <h3 class="text-white">
                    나에게 어울리는 식물이 <br />
                    궁굼하다면?
                </h3>
                <p class="text-white">핸드 플랜트에서 준비한 성향 테스트로 당신에게 어울리는 식물을 찾아보세요.</p>
            </div>
            <div class="container-swim py-6 py-lg-5 text-black text-left">
                <h5>소요시간</h5>
                <p>테스트의 총 소요시간은 약 5분입니다. 오래 걸리지 않아요.</p>
                <br />
                <h5>문제 수</h5>
                <p>문제 수는 5가지가 준비되어 있습니다.</p>
                <br />
                <h5>주의사항</h5>
                <p>
                    본 테스트는 자기 자신의 성향을 기준으로 하고 있습니다. <br />
                    식물을 기를 때 주변 환경 요인 또한 중요하오니 함께 고려하여 <br />
                    테스트를 참여해 주세요.
                </p>
                <br />
                <a data-smooth-scroll="data-smooth-scroll" href="#alert"><button class="_m-btn m-btn-gra2 m-btn-gra-anim" type="button">테스트 시작</button></a>
            </div>
        </section>
        <section>
            <div>
                <div>
                    <div style="text-align: center; margin-top: 98px;">
                        <hr class="my-5" id="alert" />
                        <p>1. 새로운 사람들과 이야기하는 것을 좋아하나요?</p>
                        <label><input type="radio" name="first" value="yes" />네</label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label><input type="radio" name="first" value="no" />아니요</label>
                        <hr class="my-5" />
                        <p>2. 도전을 좋아하고 목표한 일을 끝까지 하시나요?</p>
                        <label><input type="radio" name="second" value="yes" />네</label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label><input type="radio" name="second" value="no" />아니요</label>
                        <hr class="my-5" />
                        <p>3. 한 달에 한 번 꽃을 구입하시나요?</p>
                        <label><input type="radio" name="third" value="yes" />네</label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label><input type="radio" name="third" value="no" />아니요</label>
                        <hr class="my-5" />
                        <p>4. 계획을 세우고 규칙에 맞추는 것을 좋아하시나요?</p>
                        <label><input type="radio" name="fourth" value="yes" />네</label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label><input type="radio" name="fourth" value="no" />아니요</label>
                        <hr class="my-5" />
                        <p>5. 비 오는 날을 좋아하시나요?</p>
                        <label><input type="radio" name="fifth" value="yes" />네</label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label> </label>
                        <label><input type="radio" name="fifth" value="no" />아니요</label>
                        <hr class="my-5" />
                        <div class="mt-5">
                            <!-- Button trigger modal-->
                            <button class="_m-btn m-btn-gra2 m-btn-gra-anim" type="button" data-toggle="modal" data-target="#exampleModal">결과 보러 가기</button>
                            <!-- Modal-->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content" style="border-radius: 0">
                                        <div class="modal-body">
                                            <h5><br />테스트 결과<br /><br /></h5>
                                            <p class="text-muted">
                                                <img src="<%=request.getContextPath()%>/source/img/3_swim/3_sunflower.jpg" width="300" />
                                            </p>
                                        </div>
                                        <div>
                                            <p class="text-muted">한사람만 바라보는 당신에게 해바라기를 추천드립니다.</p>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br /><br />
        </section>
        <!-- Footer start -->
        <footer class="__position-r __footer-down" style="z-index: 1030">
            <!-- Footer1 -->
            <div class="__pading-tb-2 __pading-lr-2 __bg-footer">
                <div class="__d-flex __bye">
                    <div class="__d-flex __align-items-center">
                        <a class="__navbar-margin-lr __py-1" href="1_Mainpage.jsp"><img src="<%=request.getContextPath()%>/source/img/headerfooter/footer_logo.png " style="width: 230px" alt="plantstest " /></a>
                    </div>
                    <div class="__d-flex __align-items-center">
                        <ul class="__d-flex __align-items-center font-GyenggiM" style="list-style: none; margin-bottom: 0">
                            <li style="margin-bottom: 0"><a class="__nav-link-w __font-size" href="# ">ABOUT</a></li>
                            <li style="margin-bottom: 0"><a class="__nav-link-w __font-size" href="# ">HOW</a></li>
                            <li style="margin-bottom: 0"><a class="__nav-link-w __font-size" href="# ">WHEN</a></li>
                            <li style="margin-bottom: 0"><a class="__nav-link-w __font-size" href="# ">WHAT</a></li>
                            <li style="margin-bottom: 0"><a class="__nav-link-w __font-size" href="# ">WHO</a></li>
                            <li style="margin-bottom: 0"><a class="__nav-link-w" href="# ">WHY</a></li>
                        </ul>
                    </div>
                </div>
                <div class="__margin-rl-2 __margin-tb-1 __c-gblue font-GyenggiM">
                    This is the bottom of the hand plants. You've read all the above.<br />
                    I wonder if you've looked up some plants. Even if you don't look for it,<br />
                    I hope you get intersted.
                </div>
            </div>
            <!-- Footer2 -->
            <div class="__pading-tb-2" style="text-align: center">
                <p class="__c-gblue __font-size_3 font-GyenggiM" style="margin-bottom: 0">&copy; 2022 HANDPLANTS. All rights reserved.</p>
            </div>
        </footer>
        <!-- Footer end -->
        <!-- jQuery-->
        <script src="<%=request.getContextPath()%>/source/vendor/jquery/jquery.min.js"></script>
        <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
        <script src="<%=request.getContextPath()%>/source/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Swiper Carousel -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
        <script src="<%=request.getContextPath()%>/source/vendor/prismjs/prism.js"></script>
        <script src="<%=request.getContextPath()%>/source/vendor/prismjs/plugins/normalize-whitespace/prism-normalize-whitespace.js"></script>
        <!-- Main Theme JS file    -->
        <script src="<%=request.getContextPath()%>/source/js/nf_js/theme.js"></script>
        <!-- Vendor scrits: js libraries and plugins-->
        <script src="<%=request.getContextPath()%>/source/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.js"></script>
        <script src="<%=request.getContextPath()%>/source/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
        <!-- Main theme script-->
        <script src="<%=request.getContextPath()%>/source/js/theme.min.js"></script>
    </body>
</html>
