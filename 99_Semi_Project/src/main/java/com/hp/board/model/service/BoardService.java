package com.hp.board.model.service;  

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.hp.board.model.dao.BoardDAO;
import com.hp.board.model.vo.Board;
import com.hp.board.model.vo.Reply;
import com.hp.common.util.PageInfo;

public class BoardService {
	private BoardDAO dao = new BoardDAO();
	
	public int getBoardCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getBoardCount(conn, searchMap);
		close(conn);
		return result;
	}
	
	public List<Board> getBoardList(PageInfo pageinfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<Board> list = dao.findAll(conn, pageinfo, searchMap);
		close(conn);
		return list;
	}
	
	public List<Board> getBoardNoList(PageInfo pageinfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<Board> list = dao.findNoAll(conn, pageinfo, searchMap);
		close(conn);
		return list;
	}
	
	public List<Board> getBoardListByUno(int uNo) {
		Connection conn = getConnection();
		List<Board> list = dao.findByUno(conn, uNo);
		close(conn);
		return list;
	}
//	public List<Board> getBoardList(PageInfo pageinfo) {
//		Connection conn = getConnection();
//		List<Board> list = dao.findAll(conn, pageinfo);
//		close(conn);
//		return list;
//	}
	
	public int save(Board board) {
		Connection conn = getConnection();
		int result = 0;
		
		if(board.getBoNo() != 0) {
			result = dao.updateBoard(conn, board);
		}else {
			result = dao.insertBoard(conn, board);
		}
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Board findBoardByNo(int no, boolean hasRead) {
		Connection conn = getConnection();
		Board board = dao.findBoardByNo(conn, no);
		
		// 조회수 증가 로직
		if(hasRead == true && board != null) {
			int result = dao.updateReadCount(conn, board);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		return board;
	}
	
	public int delete(int no) {
		Connection conn = getConnection();
		int result = dao.updateStatus(conn, no, "N");
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int saveReply(Reply reply) {
		Connection conn = getConnection();
		int result = dao.insertReply(conn, reply);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		
		int result = dao.deleteReply(conn, replyNo);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public List<Reply> getReplyListByUid(String uid) {
		Connection conn = getConnection();
		List<Reply> list = dao.findReplyByUid(conn, uid);
		close(conn);
		return list;
	}
	
}


















