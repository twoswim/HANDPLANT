<%@page import="com.hp.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.hp.plant.model.vo.PlantInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<PlantInfo> list = (List<PlantInfo>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");

	String searchType = "pKorName";
	String searchValue = "";
	String searchParamValue = request.getParameter("searchValue");
	if(searchParamValue != null && searchParamValue.length() > 0){
		searchValue = request.getParameter("searchValue");
	}
%>   

    <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="utf-8">
            <title>HANDPLANTS</title>
            <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
            <!-- 타이틀 이미지-->
            <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/6_mypage/logo_1.png">

            <!-- Css-->
            <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/2_plantSearch.css">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/source/css/headerfooter.css">

            <!-- Vendor Styles-->
            <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
            <%-- <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/nouislider/dist/nouislider.min.css" /> --%>
            <!-- Main Theme Styles + Bootstrap-->
            <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/theme.min.css">

            <style>
                .mb-4 {
                	width: 100%;
 					margin: 0 auto;
                }
                
                .upper {
                	width: 100%;
 					margin: 0 auto;
                }
                
                .input-group {
                	width: 100%;
                }
                .banner {
                    padding-top: 50px !important;
                    padding-left: 336.5px !important;
                    margin-top: 10px !important;
                    height: 300px !important;
                    background-image: url(<%=request.getContextPath()%>/source/img/4_store/banner7.png) !important;
                    background-size: cover;
                }
                
                .tag{
                	background-color : #ffffff;
                	border: 1px solid #8C8C8C; 
                	border-radius: 50px;
                	text-align: center;
                	color: #686868;
                	font-size: 20px;
  	              	padding-top: 8px;
   					 padding-right: 20px;
   					 padding-bottom: 8px;
   					 padding-left: 20px;
   					 margin-right : 6px;
                }
                

            </style>
        </head>
        
		<%@ include file="/views/common/header.jsp" %>
            
            <main class="page-wrapper font-GyenggiM">
                <!-- Shopping cart off-canvas-->
                <!-- Navbar (Solid background + shadow)-->
                <!-- Remove "navbar-sticky" class to make navigation bar scrollable with the page.-->
                <!-- Page content-->
                
                <div class="banner">
                <h4 class="h4" style="color: #f44125 !important; ">PLANTSEARCH</h4>
                <h3 class="h2" style="color: black">꽃/식물 검색</h3>
                <p class="fs-lg text-dark">이름, 태그검색으로 나에게 딱 맞는 식물을 검색해보세요! </p>
            	</div>

                <div class="container py-4 mb-2 mb-sm-0 pb-sm-5">
                	<div class="mb-4">
	                    <h2 style="margin-bottom: 30px;">어떤 종류의 식물을 찾고있나요?<br></h2>
	                    <!-- Search filter-->
	                     <!-- Tag tab-->
	                    <form action="<%=request.getContextPath()%>/plant/list/tag" method="get">
	                   	 <button class="tag" onclick="<%=request.getContextPath()%>/plant/list/tag" name ="searchValue2" value="꽃" >꽃</button>
	                   	 <button class="tag" onclick="<%=request.getContextPath()%>/plant/list/tag" name ="searchValue2" value="나무" >나무</button>
	                   	 <button class="tag" onclick="<%=request.getContextPath()%>/plant/list/tag" name ="searchValue2" value="공기정화" >공기정화</button>
	                   	 <button class="tag" onclick="<%=request.getContextPath()%>/plant/list/tag" name ="searchValue2" value="향이 좋은" >향이 좋은</button>
	                   	 <button class="tag" onclick="<%=request.getContextPath()%>/plant/list/tag" name ="searchValue2" value="어두운 곳에서도 자라는" >어두운 곳에서도 자라는</button>
	                   	 <button class="tag" onclick="<%=request.getContextPath()%>/plant/list/tag" name ="searchValue2" value="물을 자주 주지 않아도 되는" >물을 자주 주지 않아도 되는</button>
	                   	 <button class="tag" onclick="<%=request.getContextPath()%>/plant/list/tag" name ="searchValue2" value="화려한" >화려한</button>
	                    </form>
	                    <form action="<%=request.getContextPath()%>/plant/list" method="get">
	                    <div class="btn-group-toggle pt-3 pb-3 mb-3" data-bs-toggle="buttons">
	                        
	                        
	                    </div>
	                   
	           
	                    
	                   <%--  <script>
	                    $('#tmpChkbox[]').on('click', function() {
	                    	
	                    	<%ArrayList<String> list2 = new ArrayList<>(); %>
	                    	var chkArray = new Array();
	                    	if ( $(this).prop('checked') ) {
	                    		var tmpVal = $(this).val();
	                    		chkArray.push(tmpVal);
	                    	
	                    	}else{
	                    		for(int i = 0; i < chkArray.legnth(); i++){
	                    			if(chkArray[i].equals($(this).val())
	                    		}
	                    	}
	                    	
	                    
	                    );
	                    
	                    }
	                    </script> --%>
	         
	                    
	                    <!-- Search tab-->
	                    <div class="input">
	                        <div class="input-group"><i class="ai-search position-absolute top-50 start-0 translate-middle-y ms-3"></i>
	                        
	                            <input class="form-control rounded" id="searchValue" name ="searchValue" type="text" value="<%=searchValue%>" width=600px; placeholder="검색"/>
	                            
	                        </div>
	                    </div>
	                    </form>
                    </div>
                    <!-- All filter-->
                    <div class="change-filter">
                        <h4 class="filter mb-0">모든 식물</h4>
                        <div class="filter-icon">
                            <a class="btn-filter" href="#">
                                <!-- <i class="ai-filter-alt">
                            </i> -->
                            </a>
                        </div>
                    </div>
                    <!-- Shop grid-->
                    <div class="row">
                        <!-- Item-->
                        
                        
                        <% if(list != null){ for(PlantInfo p : list){%>
                        
                        
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-grid-gutter">
                            <div class="card card-product card-hover">
                                <a class="card-img-top" href="<%=request.getContextPath()%>/html/2_plantSearchDetail?info=<%=p.getfNo()%>"><img src=<%=p.getImgUrl1()%> alt="Product thumbnail"></a>
                                <div class="card-body">
                                    <h3 class="fs-md fw-medium mb-2">
                                        <a class="meta-link" href="<%=request.getContextPath()%>/html/2_plantSearchDetail?info=<%=p.getfNo()%>"><%= p.getfKorNm()%></a>
                                    </h3>
                                </div>
                              
                            </div>
                        </div>
                        
                        <%}}%>
                        
                    	
                    	<%-- 페이지부 시작 --%>
                        <div id="pageBar">
                        <ul class="pagination justify-content-center ">
                        <%-- 이전으로 가기 --%>   
                            <li class="page-item page-link" onclick="movePage('<%=path%>/plant/list?page=<%=pageInfo.getPrvePage()%>');">
                            <i class="ai-chevron-left"></i></li>
                           <!-- 10개 목록 출력하기 -->
                           <% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
                               <%if(i == pageInfo.getCurrentPage()){ %>
                              <li class="page-item d-none d-sm-block text-light page-link"> <%=i%></li>
                              <%} else {%>
                              <li class="page-item active d-none d-sm-block page-link" onclick="movePage('<%=path%>/plant/list?page=<%=i%>');"> <%=i%></li>
                              <%} %>
                           <%} %>
                        <%-- 다음으로 가기 --%>   
                        <li class="page-item page-link " onclick="movePage('<%=path%>/plant/list?page=<%=pageInfo.getNextPage()%>');">
                        <i class="ai-chevron-right"></i></button>
                        
                          </ul>
                          </div>
                      <%-- 페이지부 종료 --%>
 
                </div>
                </div>
            </main>
            
<script type="text/javascript">
function movePage(pageUrl){
	var searchValue = document.getElementById("searchValue"); // 진달래
	var searchTypes = document.getElementsByName("searchType"); // pKorName
	var searchType = 'pKorName';
	if(searchValue.value.length > 0){
		for(var i = 0; i <searchTypes.length; i++){
			if(searchTypes[i].checked == true){
				searchType = searchTypes[i].value;
			}
		}
		pageUrl = pageUrl + '&searchType=' + searchType + '&searchValue=' + searchValue.value; 
	}
	location.href = encodeURI(pageUrl);	
}
</script>
            
            <%@ include file="/views/common/footer.jsp" %>
