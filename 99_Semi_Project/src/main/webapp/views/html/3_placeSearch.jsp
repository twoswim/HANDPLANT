<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String region = "Gangnam";
	String place = "";
	String searchParamValue = request.getParameter("place");
	if(searchParamValue != null && searchParamValue.length() > 0){
		region = request.getParameter("region");
		place = request.getParameter("place");
	}
%>  
    
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
	                <p class="fs-lg text-dark">주변 꽃집/식물원, 식물과 관련된 핫플레이스, 플랜트호텔을 찾아보세요.</p>
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
                                    <img src="<%=request.getContextPath()%>/source/img/3_swim/flowerhouse.jfif" alt="Vegan Raw Seasoning Appetizers" />
                                    <span class="card-floating-text text-light fw-medium"></span>
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
                    	</div>	
	                    <!-- Contacts-->
	                    <section style="margin-top: -160px; padding-top: 100px;">
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
            // 꽃집
            var areaArr = new Array(); // 지역을 담는 배열 ( 지역명/위도경도 )
            areaArr.push(
                { placeName: '온도플라워', lat: '37.5593259', lng: '126.8255148', page: '"http://www.ondoflower.co.kr"'},
                { placeName: '더꽃장수', lat: '37.5244501', lng: '126.8753546', page: '"http://www.theflowerseller.co.kr"'},
                { placeName: '조아저씨꽃가게', lat: '37.5478610', lng: '126.8358351'},
                { placeName: '홍요정플라워', lat: '37.5119636', lng: '127.0870103', page: '"https://www.instagram.com/hongyojung"'},
                { placeName: '로지필드', lat: '37.5014428', lng: '126.9181986', page: '"https://blog.naver.com/rosy_field"'},
                { placeName: '르자당', lat: '37.5233039', lng: '127.0360081', page: '"http://instagram.com/lejardin_dosan"'},
                { placeName: '피오니페페플라워샵', lat: '37.5162518', lng: '127.0374360', page: '"https://blog.naver.com/peonypepe"'},
                { placeName: '더바오플라워', lat: '37.4951509', lng: '126.8314599', page: '"http://www.instagram.com/thebaoflower"'},
                { placeName: '노팅힐 가든', lat: '37.5365922', lng: '127.1334297', page: '"http://www.instagram.com/nott1603"'},
                { placeName: '라플로라', lat: '37.5079778', lng: '127.0555281', page: '"http://www.la-flora.co.kr"'},
                { placeName: '다경플라워', lat: '37.4955878', lng: '127.0318485', page: '"http://blog.naver.com/dakyung_flower"'},
                { placeName: '베누플라워', lat: '37.5083004', lng: '127.1066509', page: '"https://www.instagram.com/venu_floral_design"'},
                { placeName: '모아플라워', lat: '37.5378564', lng: '127.1406695', page: '"http://blog.naver.com/philrain"'},
                { placeName: '라플로르', lat: '37.5805546', lng: '126.9852398', page: '"http://www.instagram.com/laflorflower"'},
                { placeName: '플로르가든', lat: '37.5654386', lng: '126.9769832'},
                { placeName: '라튤립', lat: '37.5374756', lng: '127.1408129', page: '"http://www.latulipefleur.co.kr"'},
                { placeName: '플로블랑 이촌', lat: '37.5213200', lng: '126.9720785', page: '"http://www.floblanc.com"'},
                { placeName: '아셈플라워랜드', lat: '37.5116621', lng: '127.0594275', page: '"http://instagram.com/asemflowerland"'},
                { placeName: '이케바나 우정임플라워', lat: '37.5496248', lng: '126.9228733', page: '"http://blog.naver.com/wooflower511"'},
                { placeName: '라떼플로라', lat: '37.6099166', lng: '127.0784994', page: '"http://blog.naver.com/latteflora"'},
                { placeName: '담쟁이', lat: '37.6096293', lng: '126.9106409', page: '"http://www.damjange.com"'},
                { placeName: '대학로꽃집에델바이스', lat: '37.5839822', lng: '127.0020846', page: '"http://blog.naver.com/flower_edel"'},
                { placeName: '종로농원', lat: '37.5725210', lng: '126.9867844', page: '"http://www.8787flower.co.kr"'},
                { placeName: '크리스탈플레르', lat: '37.5346437', lng: '126.9926917', page: '"http://instagram.com/crystal_fleur_"'},
                { placeName: '릴리앤베이스', lat: '37.6482753', lng: '127.0785039', page: '"https://blog.naver.com/lilyandvase"'},
                { placeName: '본보니에플라워', lat: '37.5545942', lng: '127.0228071', page: '"http://www.instagram.com/bonbonniere_flower"'},
                { placeName: '수풀룸', lat: '37.4892867', lng: '126.9290416', page: '"http://www.instagram.com/soopool_room"'},
                { placeName: '리엔하우스', lat: '37.5395535', lng: '127.1228277', page: '"https://www.instagram.com/reeen_house"'},
                { placeName: '트렌드바이미', lat: '37.5362541', lng: '127.0003247', page: '"http://www.trendbyme.com"'},
                { placeName: '초콜릿코스모스', lat: '37.5683993', lng: '126.9303223', page: '"http://www.chocolatecosmos.co.kr"'},
                { placeName: '러브썸플라워', lat: '37.5370104', lng: '127.0783297', page: '"https://m.blog.naver.com/20lovesome"'},
                { placeName: '수수꽃다리', lat: '37.5555070', lng: '126.9255762', page: '"http://blog.naver.com/vandavanda"'},
                { placeName: '써니드플레르', lat: '37.4768632', lng: '126.9815951', page: '"http://sunnydefleur.com"'},
                { placeName: '난난플라워', lat: '37.5176343', lng: '126.9042788', page: '"http://www.instagram.com/ranranflower2"'},
                { placeName: '소호앤노호', lat: '37.5125702', lng: '127.1025625', page: '"http://blog.naver.com/sohonnoho"'},
                { placeName: '한미플라워', lat: '37.5345380', lng: '127.0942004', page: '"http://blog.naver.com/ganetyoo"'},
                { placeName: '로벨리아듀', lat: '37.5822138', lng: '127.0022798', page: '"https://www.instagram.com/lobeliadew_flower"'},
                { placeName: '마들렌플라워', lat: '37.6570573', lng: '127.0656780', page: '"http://blog.naver.com/madeleine0082"'},
                { placeName: '지스텀', lat: '37.5647566', lng: '126.9779270'},
                { placeName: '런던플라워앤가든', lat: '37.5208061', lng: '127.0220686', page: '"http://londonflower.kr"'},
                { placeName: '라미띠에플라워', lat: '37.3583214', lng: '126.9322945', page: '"https://www.instagram.com/lamitie_flower"'},
                { placeName: '라모르플라워', lat: '37.3587974', lng: '126.9332061', page: '"http://www.instagram.com/lamour_flower"'},
                { placeName: '홈위크플라워', lat: '37.3603431', lng: '126.9314603', page: '"https://blog.naver.com/flowerstudio_chacha"'}
            );
            // 관광지
            var areaArr2 = new Array(); // 지역을 담는 배열 ( 지역명/위도경도 )
            areaArr2.push(
                { placeName: '서울식물원', lat: '37.5722444', lng: '126.8328429', page: '"http://botanicpark.seoul.go.kr"'},
                { placeName: '푸른수목원', lat: '37.4815524', lng: '126.8237781', page: '"http://parks.seoul.go.kr/pureun"'},
                { placeName: '홍릉시험림(홍릉숲)', lat: '37.5932683', lng: '127.0436959', page: '"https://www.forest.go.kr/newkfsweb/html/HtmlPage.do?pg=/rest/rest_0701.html&mn=KFS_14_01_10_02_08"'},
                { placeName: '서울어린이대공원', lat: '37.5498987', lng: '127.0809212', page: '"https://www.sisul.or.kr/open_content/childrenpark/"'},
                { placeName: '남산야외식물원', lat: '37.5429640', lng: '126.9946381'},
                { placeName: '서울숲', lat: '37.5430834', lng: '127.0417933', page: '"https://parks.seoul.go.kr/"'},
                { placeName: '선유도공원', lat: '37.5423833', lng: '126.9018193', page: '"http://parks.seoul.go.kr/seonyudo"'},
                { placeName: '창경궁자생식물학습장', lat: '37.5776239', lng: '126.9938415'},
                { placeName: '관악산야외식물원', lat: '37.4620698', lng: '126.9481674'},
                { placeName: '한일식물원', lat: '37.4682596', lng: '127.0389985'},
                { placeName: '금란식물원', lat: '37.6081814', lng: '127.1014129'},
                { placeName: '백암식물원', lat: '37.4682596', lng: '127.0389985'},
                { placeName: '플레이스콤마', lat: '37.5378011', lng: '126.7962322', page: '"https://blog.naver.com/tkdssd"'},
                { placeName: '지혜네정원', lat: '37.5670649', lng: '126.9954936', page: '"https://www.instagram.com/j._.kitten"'},
                { placeName: '철쭉동산', lat: '37.3554074', lng: '126.9249988'},
                { placeName: '토브식물원', lat: '37.3214714', lng: '126.9176363', page: '"http://tobegarden.creatorlink.net"'}
            );

            // 가든어스(광명, 분당, 연희대공원, GS삼방점)
            var areaArr3 = new Array(); // 지역을 담는 배열 ( 지역명/위도경도 )
            areaArr3.push(
                { placeName: '가든어스 연희대공원점(PLANT LIBRARY)', lat: '37.5668845', lng: '126.9277554', page: '"https://www.instagram.com/garden__earth"'},
                { placeName: '가든어스 분당점(PLANT HOTEL)', lat: '37.3850444', lng: '127.1236884', page: '"https://www.instagram.com/garden__earth"'},
                { placeName: '가든어스 광명점(PLANT LAB)', lat: '37.4186807', lng: '126.8828897', page: '"https://www.instagram.com/garden__earth"'},
                { placeName: '가든어스 삼방점(PLANT STATION)', lat: '37.5037707', lng: '127.0232501', page: '"https://www.instagram.com/garden__earth"'}
            );

            let markers = new Array(); // 마커 정보를 담는 배열
            let infoWindows = new Array(); // 정보창을 담는 배열

            // 꽃집(1)
            for (var i = 0; i < areaArr2.length; i++) {
                var marker = new naver.maps.Marker({
                    map: map,
                    title: areaArr[i].placeName, // 지역구 이름
                    position: new naver.maps.LatLng(areaArr[i].lat, areaArr[i].lng), // 지역구의 위도 경도 넣기
                    icon: {
                        content: '<img src="../../source/img/3_swim/MapIcon.png" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 40px; height: 40px; left: 0px; top: 0px;">',
                        size: new naver.maps.Size(40, 40),
                        anchor: new naver.maps.Point(20, 40)
                    }
                });
                /* 정보창 */
                var infoWindow = new naver.maps.InfoWindow({
                    content: '<div style="width:200px;text-align:center;padding:10px;color:black;border-radius:30px">' 
                        + '<a style="font-size:25px">'
                        + areaArr[i].placeName
                        + '</a>'
                        + '<a href='
                        + areaArr[i].page 
                        + 'target="_blank" style="color:blue"><br>바로가기▶</a>'
                        + '</div>'
                });
                markers.push(marker); // 생성한 마커를 배열에 담는다.
                infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
            }

            // 관광지(2)
            for (var i = 0; i < areaArr2.length; i++) {
                var marker = new naver.maps.Marker({
                    map: map,
                    title: areaArr2[i].placeName, // 지역구 이름
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
                        + areaArr2[i].placeName
                        + '</a>'
                        + '<a href='
                        + areaArr2[i].page 
                        + 'target="_blank" style="color:blue"><br>바로가기▶</a>'
                        + '</div>'
                });
                markers.push(marker); // 생성한 마커를 배열에 담는다.
                infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
            }

            // 가든어스(3)
            for (var i = 0; i < areaArr3.length; i++) {
                var marker = new naver.maps.Marker({
                    map: map,
                    title: areaArr3[i].placeName, // 지역구 이름
                    position: new naver.maps.LatLng(areaArr3[i].lat, areaArr3[i].lng), // 지역구의 위도 경도 넣기
                    icon: {
                        content: '<img src="../../source/img/3_swim/MapIcon1.png" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 40px; height: 40px; left: 0px; top: 0px;">',
                        size: new naver.maps.Size(40, 40),
                        anchor: new naver.maps.Point(20, 40)
                    }
                });
                /* 정보창 */
                var infoWindow = new naver.maps.InfoWindow({
                    content: '<div style="width:200px;text-align:center;padding:10px;color:black;border-radius:30px">' 
                        + '<a style="font-size:25px">'
                        + areaArr3[i].placeName
                        + '</a>'
                        + '<a href='
                        + areaArr3[i].page 
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