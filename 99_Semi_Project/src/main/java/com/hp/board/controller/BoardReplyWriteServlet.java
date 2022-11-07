package com.hp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.board.model.service.BoardService;
import com.hp.board.model.vo.Reply;
import com.hp.common.util.MyHttpServlet;
import com.hp.user.model.vo.User;

@WebServlet("/board/reply")
public class BoardReplyWriteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	//com.hp.board.model.service.BoardService
	private BoardService service = new BoardService();
	
	@Override
	public String getServletName() {
		return "BoardReplyWrite";
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginUser = getSessionUser(req);
			
			System.out.println("댓글 writer : " + req.getParameter("writerId"));
			System.out.println("댓글 보드 : " + req.getParameter("boardNo"));
			System.out.println("댓글 내용 : " + req.getParameter("content"));
			if(loginUser.getuIds().equals(req.getParameter("writerId")) == false) {
				sendCommonPage("리플 등록 권한이 없습니다~! (401)", "/board/list" , req, resp);
				return;
			}
			// 파라메터 name = boardNo
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			String writer = req.getParameter("writerId");
			String content = req.getParameter("content");
			String name = req.getParameter("writerName");
			System.out.println("댓작성자이름 : " + name);
			
			Reply reply = new Reply();
			reply.setBoNo(boardNo);
			reply.setuName(name);
			reply.setCoId(writer);
			reply.setuNo(loginUser.getuNo());
			reply.setCoContent(content);
			
			//com.hp.board.model.service.BoardService
			int result = service.saveReply(reply);
			
			if(result > 0) {
				sendCommonPage("리플 등록에 성공하였습니다.", "/board/view?boardNo="+boardNo, req, resp);
			}else {
				sendCommonPage("리플 등록에 실패하였습니다. (402)", "/board/view?boardNo="+boardNo, req, resp);
			}
		} catch (Exception e) {
		}
	}
}