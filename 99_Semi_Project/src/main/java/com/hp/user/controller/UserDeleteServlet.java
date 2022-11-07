package com.hp.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.util.MyHttpServlet;
import com.hp.user.model.service.UserService;
import com.hp.user.model.vo.User;

@WebServlet("/member/delete")
public class UserDeleteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService service = new UserService();
	
	@Override
	public String getServletName() {
		return "UserDeleteServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginUser = getSessionUser(req);
			
			if(loginUser == null) {
				sendCommonPage("잘못된 접근입니다.", "/", req, resp);
				return;
			}
			
			int result = service.delete(loginUser.getuNo());
			
			if(result > 0) {
				sendCommonPage("회원 탈퇴에 성공하였습니다.", "/logout", req, resp);
				return;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		sendCommonPage("회원 탈퇴에 실패하였습니다. 문의 부탁 드립니다.", "/logout", req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
