package com.hp.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.util.MyHttpServlet;
import com.hp.user.model.service.UserService;
import com.hp.user.model.vo.User;


/**
 * 1. get 요청이 올 경우 -> 회원가입 페이지로 이동
 * 2. post 요청이 올 경우 -> 회원가입 기능 동작
 */
@WebServlet(name="enroll", urlPatterns = "/member/enroll")
public class UserEnrollServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Member member = getSessionMember(req);
		resp.sendRedirect(req.getContextPath() + "/views/member/enroll.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		try {
			user.setuIds(req.getParameter("uIds").trim());  // strip/trim으로 white space 제거
			user.setuPw(req.getParameter("uPw"));
			user.setuName(req.getParameter("uName").trim());


			System.out.println("회원가입 : " + user);
			
			int result = service.save(user);
			
			if(result > 0) {
				req.setAttribute("msg", "회원가입에 성공하였습니다!");
				req.setAttribute("location", "/views/html/1_mainPage.jsp");
			}else {
				req.setAttribute("msg", "회원가입 실패!! (code:101=DB이슈)");
				req.setAttribute("location", "/");
			}
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "회원가입 실패!! (code:100=입력값 문제)");
			req.setAttribute("location", "/member/enroll");
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
//			sendCommonPage("회원가입 실패", "/member/enroll", req, resp);
		}
	}

	@Override
	public String getServletName() {
		return "enroll";
	}
	
}
