<%@page import="oracle.net.aso.b"%>
<%@page import="com.hp.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Board board = (Board)request.getAttribute("board");
%>    
    
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
   
      
      <!-- 1_MainPage.css -->
	  <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/source/css/1_Mainpage.css" />
   		
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
           <div class="container position-relative zindex-5 pb-4 mb-md-3" style="margin-top: 90px">
               <div class="row">
               
                   <%@ include file="/views/common/sidebar.jsp" %>
                   
                   <!-- Content-->
                   <div class="col-lg-8">
                       <div class="d-flex flex-column h-100 bg-light rounded-0 shadow-lg p-4">
                           <div class="py-2 p-md-3">
                               <!-- Content-->
                               <div class="bg-secondary rounded-0 p-4 mb-4">
                                   <h3 class="text-light"> Modify Bullentin Board </h3>
                                   <h4 class="text-dark"><%=loginUser.getuName()%>님의  게시판 수정 </h4>
                               </div>
                               
                               <form action="<%= request.getContextPath()%>/board/update" method="POST" enctype="multipart/form-data">
                                   <input type="hidden" name="boardNo" value="<%=board.getBoNo()%>"/>
                                   <div class="row">
                                       <div class="col-sm-6">
                                           <div class="mb-3 pb-1">
                                               <label class="form-label px-0" for="account-fn">제목</label>
                                                   <input class="form-control rounded-0" type="text" name="title" id="title" value="<%=board.getBoTitle()%>">
                                           </div>
                                       </div>
                                       
                                       <%-- 기존 파일 여부 --%>
									   <%if(board.getBoFileName() != null && board.getBoFileName().length() > 0){ %>
									   	<input type="hidden" name="original_filename" value="<%=board.getBoFileName()%>"/>
										<input type="hidden" name="renamed_filename" value="<%=board.getRe_boFileName()%>"/>
									   <%}%>
                                       <div class="col-sm-12">
                                           <div class="mb-3 pb-1">
                                               <label class="form-label px-0" for="account-ln">첨부파일</label>
                                               <input class="form-control rounded-0" name="upfile" type="file" id="account-ln">
                                               <% if(board.getBoFileName() != null && board.getBoFileName().length() > 0) { %>
													<div style="font-size: 13px; margin-top : 1rem; margin-left : 7rem;">
													<img src="<%=request.getContextPath()%>/resources/images/file.png" width="20" height="20"/>
													<%=board.getBoFileName() %> 
													</div>  
											<%} %>
                                           </div>
                                       </div>
                                   	   <div class="col-sm-12">
                                           <div class="mb-3 pb-1">
                                               <label class="form-label px-0" for="account-email">내용</label>
                                               <textarea class="form-control rounded-0" name="content" id="account-email" cols="50" rows="15" style="height:300px" ><%=board.getBoCont()%></textarea>
                                           </div>
                                       </div>
                                       <div class="col-12">
                                           <hr class="mt-2 mb-4">
                                           <div class="d-flex flex-wrap justify-content-between align-items-center" style="margin-top: 30px;">
                                               <div class="form-check d-block" style="padding-left: 0px;">
                                                   <a class="blue-btn" href="<%=request.getContextPath()%>/board/list" style="height: 40px; padding-top: 8px;" type="button">목록으로</a>
                                               </div>
                                               <div class="form-check d-block" style="padding-right: 0px;">
                                                   <input type="submit" value="수정" class="red-btn" style="height: 40px;">
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </form>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </main>
       <%@ include file="/views/common/footer.jsp" %>
   </body>
</html>