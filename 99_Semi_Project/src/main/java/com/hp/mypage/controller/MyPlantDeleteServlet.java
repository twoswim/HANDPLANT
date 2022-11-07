package com.hp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.util.MyHttpServlet;
import com.hp.mypage.model.service.MyPlantService;
import com.hp.mypage.model.vo.MyPlant;
import com.hp.user.model.vo.User;


//반려식물 삭제
	@WebServlet("/myplant/delete")
	public class MyPlantDeleteServlet extends MyHttpServlet {
		private static final long serialVersionUID = 1L;
		
		private MyPlantService service = new MyPlantService();
		
		@Override
		public String getServletName() {
			return "MyPlantDelete";
		}
		
		//http://localhost/06_HelloMVC2/board/delete?boardNo=65
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				// 파라메터 name = myplantNo
				int myplantNo = Integer.parseInt(req.getParameter("mpNo"));
				User loginUser = getSessionUser(req);
				
				// 권한 확인 코드, 프로젝트 시에는 없어도 됨
				/*
				 * if(loginUser.getuRole().equals("관리자") == false &&
				 * loginUser.getuIds().equals(myplant.getuNo()) == false) { //오류생기려나
				 * sendCommonPage("권한이 없어 삭제 할 수 없습니다. (300)", "/myplant/list", req, resp);
				 * return; }
				 */
				int result = service.delete(myplantNo);
				
				if(result <= 0 ) {
					sendCommonPage("반려식물 삭제에 실패하였습니다. (301)", "/myPage/list", req, resp);
					return;
				}
				
//				// 파일 삭제
//				deleteFile(myplant.getRe_mpFileName());
				sendCommonPage("반려식물 삭제에 성공하였습니다.", "/myPage/list", req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				sendCommonPage("반려식물 삭제에 실패하였습니다. (302)", "/myPage/list", req, resp);
			}
		}
	}