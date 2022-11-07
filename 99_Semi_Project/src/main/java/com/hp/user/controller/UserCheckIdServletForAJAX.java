package com.hp.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.user.model.service.UserService;

@WebServlet("/member/checkId2")
public class UserCheckIdServletForAJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uIds = req.getParameter("uIds");
		System.out.println("중복 확인 Id : " + uIds);
		
		boolean isDuplicated = service.isDuplicated(uIds);
		
		if(isDuplicated == true) { // 사용중이다.
			resp.getWriter().append("used");
		} else { // 사용안되는 중
			resp.getWriter().append("unused");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
