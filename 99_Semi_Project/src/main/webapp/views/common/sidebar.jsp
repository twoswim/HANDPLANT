<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <%String searchType = "title";
   String searchValue = "";
   String searchParamValue = request.getParameter("searchValue");
   if(searchParamValue != null && searchParamValue.length() > 0){
      searchType = request.getParameter("searchType");
      searchValue = request.getParameter("searchValue");
   }%>
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
                                   <button class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim " style="height:44px; width:5rem; font-size: 0.9rem;">검색</button>
                               </div>
                               <h3 class="d-block bg-secondary fs-sm fw-semibold text-muted mb-0 px-4 py-3 ">카테고리</h3>
                               <a id="ajaxAnn" class="d-flex align-items-center nav-link-style px-4 py-3" href="<%=request.getContextPath()%>/board/listAnn">
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