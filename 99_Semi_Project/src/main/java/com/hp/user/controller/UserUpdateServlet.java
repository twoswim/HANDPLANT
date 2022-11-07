package com.hp.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.user.model.service.UserService;
import com.hp.common.util.MyHttpServlet;
import com.hp.user.model.service.UserService;
import com.hp.user.model.vo.User;

@WebServlet("/member/update")
public class UserUpdateServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService service = new UserService();
	
	@Override
	public String getServletName() {
		return "MemberUpdateServlet";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginMember = getSessionUser(req);
			
			if(loginMember == null) {
				sendCommonPage("잘못된 접근입니다.", "/", req, resp);
				return;
			}
			
			User newUser = new User();
			newUser.setuNo(loginMember.getuNo());
			newUser.setuName(req.getParameter("uName"));
			newUser.setuIds(req.getParameter("uIds"));
			newUser.setuPw(req.getParameter("uPw"));
			newUser.setuAddr(req.getParameter("uAddr"));
			newUser.setuPhone(req.getParameter("uPhone"));
			newUser.setuBirth(req.getParameter("uBirth"));
			newUser.setuImgUrl(req.getParameter("uImgUrl"));
			
	
				
//			if(loginMember.getuIds().equals(newUser.getuIds()) == false) {
//				sendCommonPage("잘못된 아이디 입니다.", "/member/view", req, resp);
//				return;
//			}
			
			int result = service.save(newUser);
			
			System.out.println("newUser :" + newUser.toString() );
			if(result > 0) { // 업데이트 성공
				newUser = service.finduserById(newUser.getuIds());
				setSessionUser(req, newUser);
				sendCommonPage("회원정보 수정하였습니다.", "/myPage/list", req, resp);
			} else {
				sendCommonPage("오류로 회원정보를 수정할수 없습니다.", "/member/view", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("인자가 잘못되었습니다.", "/member/view", req, resp);
		}
	}

}
