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
            background-image: url(<%=request.getContextPath()%>/source/img/4_store/placeBanner.png) !important;
            /* background-size: cover; */
        }
        </style>
        
        <!-- Main Theme Styles + Bootstrap-->
        <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/theme.min.css" />
        <!-- Header Footer CSS-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/source/css/headerfooter.css" />
        
        <!-- map script -->
    	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7w9sa9qm8o"></script>
    	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    </head>
	
	<!-- Body-->
	<body>
	    <main class="page-wrapper">
		
		<%@ include file="/views/common/header.jsp" %>
	    
	        <!-- Page content-->
	        <section class="d-md-block d-none py-0 position-relative bg-no-repeat bg-position-center" style="background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)); background-size: cover">
	            <div class="banner">
	                <h4 class="h4" style="color: #f44125;">PLACE</h4>
	                <h3 class="h3" style="color: black">플레이스</h3>
	                <p class="fs-lg text-dark">주변 꽃집/식물원, 식물과 관련된 핫플레이스, 플랜트호텔을 찾아보세요.
	            </div>
	        </section>
	        <section class="container pt-5 pt-sm-6 pt-md-7 pb-lg-7" style="margin-top: -50px">
	            <!-- Carousel-->
	            <div class="tns-carousel-wrapper">
	                <div class="tns-carousel-inner" data-carousel-options='{"nav": false, "responsive": {"0":{"items":1, "gutter": 16, "controls": false},"500":{"items":2, "gutter": 16},"768":{"items":3, "gutter": 16},"991":{"controls": true}}}'>
	                    <!-- Carousel item-->
                        <article class="pb-2">
                            <a class="card h-100 border-0 shadow mx-1 rounded-0" href="3_placeSearch1.jsp">
                                <span class="badge badge-lg badge-floating badge-floating-end rounded-0" style="background-color:#F44025">꽃집</span>
                                <div class="card-img-top card-img-gradient rounded-0">
                                    <img src="<%=request.getContextPath()%>/source/img/3_swim/flowerhouse.jfif" alt="Vegan Raw Seasoning Appetizers" /><span class="card-floating-text text-light fw-medium"></span>
                                </div>
                                <div class="card-body">
                                    <h3 class="h5 pt-1 mb-3">꽃들의 세상, 꽃집</h3>
                                    <p class="fs-sm text-muted mb-2">오늘 사랑하는 사람에게 꽃 한송이 선물 어때요?</p>
                                </div>
                            </a>
                        </article>
                        <!-- Carousel item-->
                        <article class="pb-2">
                            <a class="card h-100 border-0 shadow mx-1 rounded-0" href="3_placeSearch2.jsp">
                                <span class="badge badge-lg badge-floating badge-floating-end rounded-0" style="background-color:#FBD374">핫플</span>
                                <div class="card-img-top card-img-gradient rounded-0">
                                    <img src="<%=request.getContextPath()%>/source/img/3_swim/planthouse.jfif" alt="Shrimp Soup With Chili" />
                                    <span class="card-floating-text text-light fw-medium"></span>
                                </div>
                                <div class="card-body">
                                    <h3 class="h5 pt-1 mb-3">핫플레이스</h3>
                                    <p class="fs-sm text-muted mb-2">이곳에서 휴식과 산책을 즐기세요. <br />마음이 한결 편안해질 거예요.</p>
                                </div>
                            </a>
                        </article>
                        <!-- Carousel item-->
                        <article class="pb-2">
                            <a class="card h-100 border-0 shadow mx-1 rounded-0" href="3_placeSearch3.jsp">
                                <span class="badge badge-lg badge-floating badge-floating-end rounded-0" style="background-color:#182649">가든어스</span>
                                <div class="card-img-top card-img-gradient rounded-0">
                                    <img src="<%=request.getContextPath()%>/source/img/3_swim/gardonus.jpg" alt="Healthy Dessert With Nuts &amp;amp; Berries" />
                                    <span class="card-floating-text text-light fw-medium"></span>
                                </div>
                                <div class="card-body">
                                    <h3 class="h5 pt-1 mb-3">식물 테마파크, 가든어스</h3>
                                    <p class="fs-sm text-muted mb-2">가든어스는 여행을 가거나 집을 비울 때 <br />식물들을 맡길 수 있어요.</p>
                                </div>
                            </a>
                        </article>
	                </div>
	            </div>
	        </section>
	        <!-- Booking form-->
            <form class="container position-relative zindex-5" style="margin-top: -140px;">
                <div class="d-lg-flex align-items-center border rounded-0 px-4 pt-4 pb-3 __shadow" style="background-color:#f6f6f6">
                    <div style="width: 100%;">
                        <div class="d-sm-flex align-items-center flex-grow-1">
                            <i class="ai-compass h2" style="width: 120px; margin-top: 6px"></i>
                            <div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                                <label class="form-label" for="from-destination"></label>
                                <select class="form-select rounded-0" id="from-destination">
                                    <option selected disabled hidden>지역</option>
                                    <option value="Gangnam">강남</option>
                                    <option value="Gangseo">강서</option>
                                    <option value="Gangbuk">강북</option>
                                    <option value="Gangdong">강동</option>
                                    <option value="Gwangjin">광진</option>
                                    <option value="Seongbuk">성북</option>
                            	</select>
                        	</div>
                        	<i class="ai-home h2" style="width: 120px; margin-top: 6px"></i>
                        	<div class="mb-3 pb-1 w-100 mb-sm-4 me-sm-3">
                            	<label class="form-label" for="to-destination"></label>
                            	<select class="form-select rounded-0" id="to-destination">
	                                <option value="flowerHome">꽃집</option>
	                                <option value="TourSpot" selected>핫플레이스</option>
	                                <option value="PlantHotel">가든어스</option>
	                            </select>
                        	</div>
                        	<div class="d-sm-flex align-items-center" style="margin-top: -4px;">
                            	<div class="text-center text-sm-start mt-2 mt-sm-4 mb-4">
                                	<button class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim" type="submit" style="width: 100px; height: 42px">검색</button>
                            	</div>
                        	</div>
                    	</div>	
	                    <!-- Contacts-->
	                    <section style="margin-top: -300px; padding-top: 100px; margin-top: -160px;">
	                        <div class="container pt-6">
	                            <div class="row">
	                                <div class="border-0 d-flex align-items-lg-stretch mb-4 col-lg-12" style="padding-left: 15px;">
	                                    <!-- Map -->
	                                    <div id="map" style="width:100%; height:580px;"></div>
	                                </div> 
	                            </div>
	                        </div>
	                    </section>
                	</div>
                </div>
            </form>
	    </main>
	    <br><br>
	    <%@ include file="/views/common/footer.jsp" %>
	    
	</body>
	<script type="text/javascript">
		var map = new naver.maps.Map('map', {
		    zoom: 13
		});
	
		var marker = new naver.maps.Marker({
	        map: map,
	        icon: {
	            content: '<img src="../../source/img/3_swim/Icon.png" style="z-index : 1028; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 40px; height: 40px; left: 0px; top: 0px;">',
	            size: new naver.maps.Size(40, 40),
	            anchor: new naver.maps.Point(20, 40)
	        }
	    });
	
		var infowindow = new naver.maps.InfoWindow();
	
		function onSuccessGeolocation(position) {
		    var location = new naver.maps.LatLng(position.coords.latitude,
		                                         position.coords.longitude);
	
		    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
		    marker.setPosition(location);
		    searchCoordinateToAddress(location);
		}
	
		function onErrorGeolocation() {
		    var center = map.getCenter();
		    searchCoordinateToAddress(center);
		}
	
		$(window).on("load", function() {
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
		    } else {
		        var center = map.getCenter();
		        searchCoordinateToAddress(center);
		    }
		});
	
        $(function () {
            initMap();
        });

        function initMap() {
            
            // 핫플
            var areaArr2 = new Array(); // 지역을 담는 배열 ( 지역명/위도경도 )
            areaArr2.push(
                { location: '서울식물원', lat: '37.5722444', lng: '126.8328429', page: '"http://botanicpark.seoul.go.kr"'},
                { location: '푸른수목원', lat: '37.4815524', lng: '126.8237781', page: '"http://parks.seoul.go.kr/pureun"'},
                { location: '홍릉시험림(홍릉숲)', lat: '37.5932683', lng: '127.0436959', page: '"https://www.forest.go.kr/newkfsweb/html/HtmlPage.do?pg=/rest/rest_0701.html&mn=KFS_14_01_10_02_08"'},
                { location: '서울어린이대공원', lat: '37.5498987', lng: '127.0809212', page: '"https://www.sisul.or.kr/open_content/childrenpark/"'},
                { location: '남산야외식물원', lat: '37.5429640', lng: '126.9946381'},
                { location: '서울숲', lat: '37.5430834', lng: '127.0417933', page: '"https://parks.seoul.go.kr/"'},
                { location: '선유도공원', lat: '37.5423833', lng: '126.9018193', page: '"http://parks.seoul.go.kr/seonyudo"'},
                { location: '창경궁자생식물학습장', lat: '37.5776239', lng: '126.9938415'},
                { location: '관악산야외식물원', lat: '37.4620698', lng: '126.9481674'},
                { location: '한일식물원', lat: '37.4682596', lng: '127.0389985'},
                { location: '금란식물원', lat: '37.6081814', lng: '127.1014129'},
                { location: '백암식물원', lat: '37.4682596', lng: '127.0389985'},
                { location: '플레이스콤마', lat: '37.5378011', lng: '126.7962322', page: '"https://blog.naver.com/tkdssd"'},
                { location: '지혜네정원', lat: '37.5670649', lng: '126.9954936', page: '"https://www.instagram.com/j._.kitten"'},
            );

            let markers = new Array(); // 마커 정보를 담는 배열
            let infoWindows = new Array(); // 정보창을 담는 배열

            // 핫플
            for (var i = 0; i < areaArr2.length; i++) {
                var marker = new naver.maps.Marker({
                    map: map,
                    title: areaArr2[i].location, // 지역구 이름
                    position: new naver.maps.LatLng(areaArr2[i].lat, areaArr2[i].lng), // 지역구의 위도 경도 넣기
                    icon: {
                        content: '<img src="../../source/img/3_swim/MapIcon2.png" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 40px; height: 40px; left: 0px; top: 0px;">',
                        size: new naver.maps.Size(40, 40),
                        anchor: new naver.maps.Point(20, 40)
                    }
                });
                /* 정보창 */
                var infoWindow = new naver.maps.InfoWindow({
                    content: '<div style="width:200px;text-align:center;padding:10px;color:black;border-radius:30px">' 
                        + '<a style="font-size:25px">'
                        + areaArr2[i].location
                        + '</a>'
                        + '<a href='
                        + areaArr2[i].page 
                        + 'target="_blank" style="color:blue"><br>바로가기▶</a>'
                        + '</div>'
                });
                markers.push(marker); // 생성한 마커를 배열에 담는다.
                infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
            }

            function getClickHandler(seq) {
                return function (e) {
                    // 마커를 클릭하는 부분
                    var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                        infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

                    if (infoWindow.getMap()) {
                        infoWindow.close();
                    } else {
                        infoWindow.open(map, marker); // 표출
                    }
                };
            }

            for (var i = 0; i < markers.length; i++) {
                console.log(markers[i], getClickHandler(i));
                naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
            }
        }
    </script>
</html>