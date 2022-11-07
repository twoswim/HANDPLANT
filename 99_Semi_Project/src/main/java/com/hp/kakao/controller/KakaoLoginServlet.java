package com.hp.kakao.controller;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.user.model.dao.UserDao;
import com.hp.user.model.service.UserService;
import com.hp.user.model.vo.User;


@WebServlet("/kakao")
public class KakaoLoginServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
		KakaoAPI kakao = new KakaoAPI();
		String code = (String)req.getParameter("code");
		System.out.println("code : " + code);
		
		String access_Token = kakao.getAccessToken(code);
		System.out.println("access_token : " + access_Token);
		
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		User loginUser = new User();
		loginUser.setuName(String.valueOf(userInfo.get("nickname")));
		loginUser.setuBirth(String.valueOf(userInfo.get("birthday")));
		loginUser.setuIds(String.valueOf(userInfo.get("email")));
		loginUser.setuPw("DEFAULT");
		loginUser.setuPhone("010-1234-1234");
		loginUser.setuImgUrl(String.valueOf(userInfo.get("profile_image")));
		loginUser.setuRole("일반 유저");
		System.out.println(loginUser.toString());
		
		UserService us = new UserService();
		
		try {
			us.save2(loginUser);
		}catch (Exception e) {}
		
		loginUser = us.finduserById(String.valueOf(userInfo.get("email")));
		
		HttpSession session = req.getSession();
		if (userInfo.get("nickname") != null) {
	        session.setAttribute("loginUser", loginUser);
//	        session.setAttribute("access_Token", access_Token);
	    }
		
		req.getRequestDispatcher("/views/html/1_mainPage.jsp").forward(req, resp);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
