package com.hp.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.user.model.service.UserService;

@WebServlet("/member/checkId")
public class UserCheckldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uIds = req.getParameter("uIds");
		System.out.println("중복확인 Id : " + uIds);
		
		boolean isDuplicated = service.isDuplicated(uIds);
		
		req.setAttribute("duplicated", isDuplicated);
		req.getRequestDispatcher("/views/member/checkId.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet (req, resp);
	}
	
}

