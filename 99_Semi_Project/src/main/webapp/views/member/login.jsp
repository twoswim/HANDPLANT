<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	
    <form class="needs-validation" id="login"
							action="<%=request.getContextPath()%>/login" method="post">
							<div class="mb-3">
								<div class="input-group">
									<i
										class="ai-lock position-absolute top-50 start-0 translate-middle-y ms-3"></i>
									<input class="form-control" style="border-radius: 0"
										type="text" name="userId" id="userId" value="<%=""%>"
										placeholder="아이디" required />
								</div>
							</div>
							<div class="mb-3">
								<div class="input-group">
									<i
										class="ai-lock position-absolute top-50 start-0 translate-middle-y ms-3"></i>
									<div class="password-toggle w-100">
										<input class="form-control" style="border-radius: 0"
											type="password" name="userPwd" id="userPwd"
											placeholder="비밀번호" required /> <label
											class="password-toggle-btn" aria-label="Show/hide password">
											<input class="password-toggle-check" type="checkbox" /><span
											class="password-toggle-indicator"></span>
										</label>
									</div>
								</div>
							</div>
							<div
								class="d-flex justify-content-between align-items-center mb-3 mb-3">
								<div class="form-check">
									<input class="form-check-input" type="checkbox"
										id="keep-signed" /> <label class="form-check-label fs-sm"
										for="keep-signed">로그인 상태 유지</label>
								</div>
								<a class="nav-link-style fs-ms" href="3_passwordRecovery.jsp">비밀번호를
									잊으셨나요?</a>
							</div>
							
							<input class="__m-btn2 __m-btn-gra2 __m-btn-gra-anim __navbar-margin-lr" style="width: 420px; height: 40px" type="submit" value="로그인" />
							
							<p class="fs-sm mb-0" style="padding-top: 33px">
								아직 회원이 아니신가요? <a href="#" class="fw-medium" data-view="#modal-signup-view">회원가입</a>
							</p>
						</form>
						
						
						