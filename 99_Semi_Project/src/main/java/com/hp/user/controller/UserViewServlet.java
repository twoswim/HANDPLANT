package com.hp.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.user.model.service.UserService;
import com.hp.user.model.vo.User;


@WebServlet("/member/view")
public class UserViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserService service = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			User member = (User) session.getAttribute("loginUser");
			String userId = member.getuIds();
			
			User userInfo = service.finduserById(userId);
			System.out.println("서블릿 호출 유저 : " + userInfo.toString());
			if(userInfo != null) {
				req.setAttribute("user", userInfo);
				req.getRequestDispatcher("/views/html/6_myPage.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
