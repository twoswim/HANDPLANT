package com.hp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.board.model.service.BoardService;
import com.hp.board.model.vo.Board;
import com.hp.common.util.MyHttpServlet;
import com.hp.user.model.vo.User;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
	
	@Override
	public String getServletName() {
		return "BoardDelete";
	}
	
	//http://localhost/06_HelloMVC2/board/delete?boardNo=65
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 파라메터 name = boardNo
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			Board board = service.findBoardByNo(boardNo, false);
			User loginUser = getSessionUser(req);
			
			// 권한 확인 코드, 프로젝트 시에는 없어도 됨
			if(loginUser.getuRole().equals("관리자") == false 
					&& loginUser.getuIds().equals(board.getuIds()) == false) {
				sendCommonPage("권한이 없어 삭제 할 수 없습니다. (300)", "/board/list", req, resp);
				return;
			}
			
			int result = service.delete(boardNo);
			
			if(result <= 0 ) {
				sendCommonPage("게시물 삭제에 실패하였습니다. (301)", "/board/list", req, resp);
				return;
			}
			
			// 파일 삭제
			deleteFile(board.getRe_boFileName());
			sendCommonPage("게시물 삭제에 성공하였습니다.", "/board/list", req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("게시물 삭제에 실패하였습니다. (302)", "/board/list", req, resp);
		}
	}
}
