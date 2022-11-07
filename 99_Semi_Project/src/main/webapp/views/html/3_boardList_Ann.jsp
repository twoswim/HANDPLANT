<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
    <%@page import="com.hp.common.util.PageInfo"%>
	<%@page import="com.hp.board.model.vo.Board"%>
    
<!DOCTYPE html>
<html lang="ko">
   <head>
        <meta charset="utf-8" />
        <title>HANDPLANTS</title>
        <link rel="icon" type="image/png" sizes="32x32" href="<%=request.getContextPath()%>/source/img/1_mainpage/mainpage_img/icon_logo.png">
         
         <!-- Vendor Styles-->
       <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/simplebar/dist/simplebar.min.css" />
       <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/tiny-slider/dist/tiny-slider.css" />
       <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/vendor/lightgallery.js/dist/css/lightgallery.min.css" />
   

         
         <!-- JQuery 사용 선언  -->
   		<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
   		<script src="https://code.jquery.com/jquery-latest.js"></script>
         
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
            background-image: url(<%=request.getContextPath()%>/source/img/4_store/banner8.png) !important;
            background-size: cover;
        }
        </style>
		<%
			List<Board> list = (List<Board>)request.getAttribute("list");
			PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
			
			String searchType = "title";
			String searchValue = "";
			String searchParamValue = request.getParameter("searchValue");
			if(searchParamValue != null && searchParamValue.length() > 0){
				searchType = request.getParameter("searchType");
				searchValue = request.getParameter("searchValue");
			}
		%>
        
        <!-- MainPage.css -->
		<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/1_Mainpage.css" />
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
           <div class="banner">
               <h4 class="h4" style="color: #f44125;">BOARD</h4>
               <h2 class="h2" style="color: black">게시판</h2>
               <p class="fs-lg text-dark">게시판에서 공지사항, 정보, 팁, 나눔글 등을 확인해보세요!
           </div>
           
           <div class="container position-relative zindex-5 pb-4 mb-md-3" style="margin-top: 90px;">
               <div class="row ">
                   
                  <!-- Sidebar-->
			       <form class="col-lg-4 mb-4 mb-lg-0 " action="<%=request.getContextPath()%>/board/list" method="get">
                       <div class="bg-light rounded-0 shadow-lg ">
                           <div class="px-4 py-4 mb-1 ">
                               <h4>게시판</h4>
                               <hr>
                               <h6 class="mb-0 pt-1">다른 사람들과 <br />식물 정보를 공유해보세요</h6>
                           </div>
                           <div class="d-lg-none px-4 pb-4 text-center ">
                               <a class="btn btn-primary px-5 mb-2 " href="#account-menu " data-bs-toggle="collapse "><i class="ai-menu me-2 "></i>Account menu</a>
                           </div>
                           <div class="d-lg-block collapse pb-2 " id="account-menu ">

                               <!-- 검색 구간 start  -->
                               <div class="d-block bg-secondary fs-sm fw-semibold text-muted mb-0 px-4 py-3">
                               게시글 검색
                                   <span style="margin-left:1rem;" class="font-GyenggiL">
                                       	<label ><input type="radio" name="searchType" value="title" <%=searchType.equals("title") ? "checked":"" %> /><span style="margin: 0.3rem;">제목</span></label>
										<label><input type="radio" name="searchType" value="content" <%=searchType.equals("content") ? "checked":"" %>/><span style="margin: 0.3rem;">내용</span></label>
										<label><input type="radio" name="searchType" value="writer" <%=searchType.equals("writer") ? "checked":"" %>/><span style="margin: 0.3rem;">작성자</span></label>
									</span>
                               </div>
                               <!-- 검색 구간 end -->

                               <!-- 카테고리 start -->
                               <div class="container d-flex flex-nowrap align-items-center " style="padding-left: 0; padding-right: 0; ">
                                   <input class="form-control form-control-xl navbar-search-field text rounded-0" id="searchValue" name="searchValue" 
                                   type="text" placeholder="검색어"  value="<%=searchValue%>">
                                   <button class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim " style="height:44px; width:5rem ">검색</button>
                               </div>
                               <h3 class="d-block bg-secondary fs-sm fw-semibold text-muted mb-0 px-4 py-3 ">카테고리</h3>
                               <a id="ajaxAnn" class="d-flex align-items-center px-4 py-3" style="color:#766df4" href="<%=request.getContextPath()%>/board/list">
                                   <i class="ai-star fs-lg opacity-60 me-2 "></i>공지사항<span class="text-muted fs-sm fw-normal ms-auto"></span>
                               </a>
                               <a id="ajaxMin" class="d-flex align-items-center nav-link-style px-4 py-3 border-top " href="<%=request.getContextPath()%>/board/listPar">
                                   <i class="ai-gift fs-lg opacity-60 me-2 "></i>분양<span class="text-muted fs-sm fw-normal ms-auto "></span>
                               </a>
                               <a id="ajaxQue" class="d-flex align-items-center nav-link-style px-4 py-3 border-top " href="<%=request.getContextPath()%>/board/listQue">
                                   <i class="ai-message-square fs-lg opacity-60 me-2 "></i>질문<span class="text-muted fs-sm fw-normal ms-auto "></span>
                               </a>
                               <a id="ajaxFre" class="d-flex align-items-center nav-link-style px-4 py-3 border-top " href="<%=request.getContextPath()%>/board/listFre">
                                   <i class="ai-users fs-lg opacity-60 me-2 "></i>자유<span class="text-muted fs-sm fw-normal ms-auto "></span>
                               </a>
                               <!-- 카테고리 start -->
                           </div>
                       </div>
                   </form>
                   
                   <!-- Content-->
                   <div class="col-lg-8 ">
                       <div class="d-flex flex-column h-100 bg-light rounded-0 shadow-lg p-4 ">
                           <div class="py-2 p-md-3 ">
                               <!-- Payment methods (table)-->
                                   <table class="table table-hover mb-0 text-center ">
                                       <thead>                                           
                                           <tr>
                                               <th style="text-align: center; width: 100%; " colspan="5">
                                               <div style="display: flex; justify-content: space-between;">
                                                   <div>전체 글 보기</div>
                                                   <%if(loginUser == null) {%>
                                                   <%}else {%>
                                                   <div><a class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim " href="<%=request.getContextPath()%>/views/html/3_boardWrite.jsp"" style="align-content: space-between;">글 작성</a></div>
                                            	   <%}%>
                                               </div>
                                               </th>
                                           </tr>
                                           <tr>
                                               <th style="text-align: center; width: 50%; "colspan="2">제목</th>
                                               <th style="width : 20%;">작성자</th>
                                               <th style="width : 20%;">작성일</th>
                                               <th >조회</th>
                                           </tr>
                                       </thead>
                                       <tbody>
                                          
                                    <%if(list == null || list.isEmpty()){ %>
                                    <%--게시글이 없는 상황 --%>
                                       <tr>
                                          <td colspan="6">
                                             조회된 게시글이 없습니다.
                                          </td>
                                       </tr>
                                    <%} else { %>
                                    <%--게시글 리스트 시작--%>
                                       <%for(Board b : list){%>
                                          <tr>
                                          <%if(b.getBoType().equals("공지") == true){%>
                                          	 <td style="padding-right: 0px; padding-left: 0px; width: 10%;"><span class="align-middle badge _bg-info rounded-0 "><%=b.getBoType()%></span></td>
                                          <%}else {%> 
                                          	 <td style="padding-right: 0px; padding-left: 0px; width: 10%;"><span class="align-middle badge bg-info rounded-0 "><%=b.getBoType()%></span></td>
                                          <%}%>  
                                             <td style="text-align:left !important;">
                                                <a href="<%=path+"/board/view?boardNo="+b.getBoNo()%>" style="color : black;" ><%=b.getBoTitle()%></a>
                                             </td>
                                             <td style="width: 20%;"><%=b.getuName()%></td>
                                             <td><%=b.getBoCreateDate()%></td>
                                             <td><%=b.getBoView()%></td>
                                          </tr>
                                       <%}%>
                                    <%}%>
                                    <%--게시글 리스트 끝--%>
                                 
                                       </tbody>
                                   </table>
                               </div>
                              <!--  <hr class="mt-0 mb-4 " /> -->
							
							<%-- 페이지부 시작 --%>
							   <div id="pageBar">
							   <ul class="pagination justify-content-center ">
							   <%-- 이전으로 가기 --%>	
							       <li class="page-item page-link" onclick="movePage('<%=path%>/board/listAnn?page=<%=pageInfo.getPrvePage()%>');">
							       <i class="ai-chevron-left"></i></li>
								   <!-- 10개 목록 출력하기 -->
								   <% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
								       <%if(i == pageInfo.getCurrentPage()){ %>
									   <li class="page-item d-none d-sm-block text-light page-link"> <%=i%></li>
									   <%} else {%>
									   <li class="page-item active d-none d-sm-block page-link" onclick="movePage('<%=path%>/board/listAnn?page=<%=i%>');"> <%=i%></li>
									   <%} %>
								   <%} %>
								<%-- 다음으로 가기 --%>	
								<li class="page-item page-link " onclick="movePage('<%=path%>/board/listAnn?page=<%=pageInfo.getNextPage()%>');">
								<i class="ai-chevron-right"></i></button>
								
						        </ul>
						        </div>
						    <%-- 페이지부 종료 --%>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </main>
       
       
       <%@ include file="/views/common/footer.jsp" %>
       
   </body>
   
   <!-- 중복 ID -->
   <script type="text/javascript">
   // 동기식=정적 페이지식(get요청)을 통해 중복 ID를 확인하는 방법 - 새로운 창을 통해 확인
   //  - 페이지를 새로고침 하지 않고, 새로운 창(페이지)를 통해 회원가입 여부를 확인하는 방법
   $('#checkDuplicate1').click(()=>{
      let id = $('#newId').val().trim();
      
      if(id.contain("@") == false){
         alert('이메일 형식으로 입력해주세요.');
         return;
      }
      
      // 동기식 확인하는 방법
      let url = '<%=request.getContextPath()%>/user/checkId';
      let title = 'duplicate';
      let status = 'left=500px,top=100px,width=500px,height=300px';

      open('',title,status); // 새로운 창으로 url을 로드하는 방법
      
//    checkIdForm html에서 해당 네임으로 된 form이 존재함
      checkIdForm.target = title;
      checkIdForm.action = url;
      checkIdForm.method = 'post';
      checkIdForm.userId.value = id;
      checkIdForm.submit();
   });
   </script>
   <script type="text/javascript">
					function movePage(pageUrl){
					var searchValue = document.getElementById("searchValue"); // 갤럭시
					var searchTypes = document.getElementsByName("searchType"); // title
					var searchType = 'title';
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
</html>