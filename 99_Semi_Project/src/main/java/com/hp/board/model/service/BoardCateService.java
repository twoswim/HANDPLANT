package com.hp.board.model.service;  

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.hp.board.model.dao.BoardCateDAO;
import com.hp.board.model.vo.Board;
import com.hp.common.util.PageInfo;

public class BoardCateService {
	private BoardCateDAO dao = new BoardCateDAO();
	
	// 공지 카테고리
	public int getBoardAnnCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getBoardAnnCount(conn, searchMap);
		close(conn);
		return result;
	}
	
	public List<Board> getBoardAnnList(PageInfo pageinfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<Board> list = dao.AnnfindAll(conn, pageinfo, searchMap);
		close(conn);
		return list;
	}
	
	// 분양 카테고리
		public int getBoardParCount(Map<String, String> searchMap) {
			Connection conn = getConnection();
			int result = dao.getBoardParCount(conn, searchMap);
			close(conn);
			return result;
		}
		
		public List<Board> getBoardParList(PageInfo pageinfo, Map<String, String> searchMap) {
			Connection conn = getConnection();
			List<Board> list = dao.ParfindAll(conn, pageinfo, searchMap);
			close(conn);
			return list;
		}
		
		// 질문 카테고리
		public int getBoardQueCount(Map<String, String> searchMap) {
			Connection conn = getConnection();
			int result = dao.getBoardQueCount(conn, searchMap);
			close(conn);
			return result;
		}
		
		public List<Board> getBoardQueList(PageInfo pageinfo, Map<String, String> searchMap) {
			Connection conn = getConnection();
			List<Board> list = dao.QuefindAll(conn, pageinfo, searchMap);
			close(conn);
			return list;
		}
		
		// 자유 카테고리
			public int getBoardFreCount(Map<String, String> searchMap) {
				Connection conn = getConnection();
				int result = dao.getBoardFreCount(conn, searchMap);
				close(conn);
				return result;
			}
			
			public List<Board> getBoardFreList(PageInfo pageinfo, Map<String, String> searchMap) {
				Connection conn = getConnection();
				List<Board> list = dao.FrefindAll(conn, pageinfo, searchMap);
				close(conn);
				return list;
			}


}


















