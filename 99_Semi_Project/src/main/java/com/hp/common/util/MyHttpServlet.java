package com.hp.common.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.user.model.vo.User;

// Servlet의 공통 기능을 모으는 코드
public abstract class MyHttpServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	// 공통 문자열 영역
	public static final String SESSION_USER_ID = "loginUser";
	
	abstract public String getServletName();
	
	public User getSessionUser(HttpServletRequest req) {
		try {
			HttpSession session = req.getSession();
			User loginMember = (User)session.getAttribute(SESSION_USER_ID);
			return loginMember;
		} catch (Exception e) {
		}
		return null;
	}
	
	public void setSessionUser(HttpServletRequest req, User user) {
		try {
			HttpSession session = req.getSession();
			session.setAttribute(SESSION_USER_ID, user);
		} catch (Exception e) {
		}
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Call!! " + getServletName() +", method : " + req.getMethod());
		super.service(req, resp);
	}
	
	// 공통 common page send 기능
	public void sendCommonPage(String msg, String path, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", path);
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
	
	// 공통 common page send 기능
	public void sendCommonPage(String msg, String path, String script, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", path);
		req.setAttribute("script", script);
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
	
	// upload 파일 삭제
	public void deleteFile(String fileName) {
		if(fileName == null || fileName.length() <= 0) {
			return;
		}
		try {
			String resourcePath = getServletContext().getRealPath("/resources/upload/board");
			File deleteFile = new File(resourcePath,fileName);
			deleteFile.delete();
		} catch (Exception e) {}
	}
}
