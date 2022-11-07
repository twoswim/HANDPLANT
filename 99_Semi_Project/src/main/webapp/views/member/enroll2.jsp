<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	                <div class="view" id="modal-signup-view">
	                    <div class="modal-body bg-light px-4">
	                        <p class="fs-ms text-muted">행복한 하루 되세요.</p>
	                        <form name="memberEnrollFrm" action="<%=request.getContextPath()%>/member/enroll" method="POST">
	                            <div class="row">
	                                <div class="mb-3 col-sm-4">
	                                    <input class="form-control" type="text" name ="uName" placeholder="이름" required style="border-radius: 0" />
	                                </div>
	                                <div class="mb-3 col-sm-5">
	                                    <input class="form-control" type="text" name ="uIds" id="uIds" placeholder="아이디" required style="border-radius: 0" />
	                                </div>
	                                <div class="mb-3 col-sm-3">
	                                    <a class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim" style="height: 40px; padding-top: 10px; font-size: 14px" type="button" id="checkDuplicate2">중복확인</a>
	                                </div>
	                            </div>
	                            <div class="mb-3 password-toggle">
	                                <input class="form-control" type="password" name ="uPw"  placeholder="비밀번호" required style="border-radius: 0" />
	                                <label class="password-toggle-btn" aria-label="Show/hide password">
	                                    <input class="password-toggle-check" type="checkbox" /><span class="password-toggle-indicator"></span>
	                                </label>
	                            </div>
	                            <div class="mb-3 password-toggle">
	                                <input class="form-control" type="password" name ="uPwCheck"  placeholder="비밀번호 확인" required style="border-radius: 0" />
	                                <label class="password-toggle-btn" aria-label="Show/hide password">
	                                    <input class="password-toggle-check" type="checkbox" /><span class="password-toggle-indicator"></span>
	                                </label>
	                            </div>
	                            <button class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim __navbar-margin-lr" type="submit" style="width: 420px; height: 38px">회원가입</button>
	                            <p class="fs-sm pt-3 mb-0">이미 회원이신가요? <a href="#modal-signin" class="fw-medium" data-view="#modal-signin-view">로그인</a></p>
	                        </form>
	                    </div>
	                </div>
	                
	                <script type="text/javascript">
					 	// 동적 페이지(비동기식)을 중복하는 방법 - AJAX ★★★★★
					 	// - 새로운 페이지를 요청하지 않고, 기존 페이지에서 서버에게 데이터만 전달받아 중복여부를 알려주는 방식
					 	$('#checkDuplicate2').click(()=>{
					 		let id = $('#uIds').val().trim();
					 		
					 		if(id.length < 4){
					 			alert('아이디는 최소 4글자 입니다.');
					 			return;
					 		}
					 		
					 		// 비동기식 처리 - AJAX
					 		const xhr = new XMLHttpRequest();
					 		xhr.open('get','${pageContext.request.contextPath}/member/checkId2?uIds=' + id);
					 		
					 		// Callback 함수 셋팅 = 이벤트 함수, 리스너, 핸들러
					 		xhr.onreadystatechange = ()=>{
					 			if(xhr.readyState == 4 && xhr.status == 200){
					 				if(xhr.responseText == 'used'){
					 					alert('중복된 아이디 입니다.');
					 					// html을 변경하는 코드를 작성하면 -> 동적페이징이 된다!!
					 				}else{
					 					alert('입력하는 아이디는 사용 가능합니다.');					
					 					// html을 변경하는 코드를 작성하면 -> 동적페이징이 된다!!
					 				}
					 			}
					 		};
					 		xhr.send();
					 	});	
					 </script>
	                


