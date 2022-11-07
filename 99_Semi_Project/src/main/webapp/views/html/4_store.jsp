
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "com.hp.product.vo.Product"%>
    <%@ page import= "java.util.List"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>HANDPLANTS | Store</title>
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png" />
    <!--  <link rel="manifest" href="site.webmanifest">-->
    <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">

    <!-- MainPage.css -->
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/theme.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/source/css/headerfooter.css">
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/tiny-slider/dist/tiny-slider.css" />
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/lightgallery.js/dist/css/lightgallery.min.css" />

    <!-- Page loading styles-->
    <style>

        /*  여기부터 내꺼 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
        
        .nav-tabs .nav-link:hover {
            color: #f44125;
        }
        
        .nav-tabs {
            margin-bottom: 0.5rem;
            margin-top: 1rem;
            border: 0;
        }
        
        .nav-tabs .nav-link {
            border-radius: 0rem;
            color: #5a5b75;
        }
        
        .nav-tabs .nav-link.active,
        .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #f44125;
            border-color: rgba(118, 109, 244, .35);
        }
        
        .banner {
            padding-top: 50px !important;
            padding-left: 336.5px !important;
            margin-top: 10px !important;
            height: 300px !important;
            background-image: url(<%=request.getContextPath()%>/source/img/4_store/banner4.png) !important;
            background-size: cover;
        }
        
        .card {
            border-radius: 0px !important;
        }
        
        .card_best {
            padding-top: 30px;
            margin-bottom: 0px !important;
        }
        
        .card-hover.border-0::before {
            border-radius: 0px !important;
        }
        
        .card-body {
            text-align: start !important;
            margin-bottom: 0px !important;
            padding-bottom: 0px !important;
        }
        
        .card-product {
            text-align: start !important;
        }
        
        .card-img,
        .card-img-top {
            border-top-left-radius: 0px !important;
            border-top-right-radius: 0px !important;
            height: 283px !important;
        }
        
        .card-img-top2 {
            border-top-left-radius: 0px !important;
            border-top-right-radius: 0px !important;
            height: 200px !important;
        }
        
        .card-hover {
            height: 330px !important;
        }
        
        .p {
            margin-bottom: 0px !important;
        }
        
        
        
        
    </style>
    
    
    
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>
		<main class="page-wrapper font-GyenggiM">
<%@ include file="/views/common/header.jsp" %>


	
        <!-- Page content-->
        <div class="banner">


            <h4 class="h4" style="color: #f44125;">STORE</h4>
            <h3 class="h2" style="color: black">스토어</h2>
                <p class="fs-lg text-dark">핸드플랜트 스토어에서 내 정원에 필요한 모든 것을 만나보세요. <br>평일 오후 2시 전 주문시 당일배송</p>
        </div>

        <!-- Trending products (grid)-->
        <section class="container pt-5 mt-5 mt-md-5 pt-md-6 pt-lg-0">
            <h2 style="margin-bottom: 0px;">스토어 추천상품</h2>
            <div class="row pb-1 ">
            <form id="my_form" action="/product/list.do" method="post"></form>
                <%
					List<Product> list = (List<Product>)request.getAttribute("list");

				%>
                <% if(list != null){ for(Product p : list){%>
                 <%
					session.setAttribute("list", list);

				%>
                	 <!-- Item-->
                     <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter card_best">
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
                     </div>
                
                
                
                <% }}%>
                
            </div>
            <div style="margin-top: 50px; margin-bottom: 50px;"><img src="<%=request.getContextPath()%>/source/img/4_store/banner.png"></div>
        </section>

        <section class="container overflow-hidden py-5 py-md-6 py-lg-0">
            <div class="masonry-filterable pt-3 pt-md-0">
                <h2 class="text-start mb-3">카테고리별 상품</h2>
                <ul class="masonry-filters nav nav-tabs justify-content-start pb-4">
                    <li class="nav-item"><a class="nav-link active" href="#" data-group="all">전체</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-group="꽃">꽃</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-group="식물">식물</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-group="토양">토양</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-group="영양제">영양제</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-group="화분">화분</a></li>
                </ul>
                <div class="masonry-grid" data-columns="5">
                <% if(list != null){ for(Product p : list){%>
                	 <!-- Item-->
                     <div class="masonry-grid-item" data-groups="[&quot;<%=p.getPrType()%>&quot;]">
                        <a class="card card-hover border-0 shadow" href="<%=p.getPrUrl()%>"><img class="card-img-top2" src="<%=p.getPrImage()%>" alt="Portfolio thumb">
                            <div class="card-body text-center">
                                <h3 class="fs-md fw-medium mb-2"><%=p.getPrName()%></h3>
                                <p class="fs-sm text-muted mb-2"><%=p.getPrPrice() %></p>
                            </div>
                        </a>
                       <!--  <span>
                                <i class="sr-star ai-star-filled active" ></i>
                                <a class="btn-wishlist" href="#"><i class="ai-heart"></i><span class="btn-tooltip">찜하기</span></a>
                                </span> -->
                        
                    </div>
                <% }}%>
                

                </div>
                </div>
        </section>

    </main>
 <%@ include file="/views/common/footer.jsp" %>
