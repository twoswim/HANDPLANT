package com.hp.mypage.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.hp.board.model.vo.Board;
import com.hp.board.model.vo.Reply;
import com.hp.common.util.PageInfo;
import com.hp.mypage.model.dao.MyPlantDao;
import com.hp.mypage.model.vo.MyPlant;

public class MyPlantService {
	private MyPlantDao dao = new MyPlantDao();
	
//	public int getMyPlantCount(Map<String, String> searchMap) {
//		Connection conn = getConnection();
//		int result = dao.getMyPlantCount(conn, searchMap);
//		close(conn);
//		return result;
//	}
	
	public List<MyPlant> getMyPlantList(PageInfo pageinfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<MyPlant> list = dao.findAll(conn, pageinfo, searchMap);
		close(conn);
		return list;
	}
	
	public List<MyPlant> getMyPlantList(PageInfo pageinfo) {
		Connection conn = getConnection();
		List<MyPlant> list = dao.findAll(conn, pageinfo);
		close(conn);
		return list;
	}
	
	//작성 값 받아오기
	public List<MyPlant> getMyPlantListByUno(int uNo) {
		Connection conn = getConnection();
		List<MyPlant> list = dao.findByUno(conn, uNo);
		close(conn);
		return list;
	}
	
	public int save(MyPlant MyPlant) {
		Connection conn = getConnection();
		int result = 0;
		
		if(MyPlant.getMpNo() != 0) {
			result = dao.updateMyPlant(conn, MyPlant);
		}else {
			result = dao.insertMyPlant(conn, MyPlant);
		}
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<MyPlant> getBoardList2(PageInfo pageinfo) {
		Connection conn = getConnection();
		List<MyPlant> list = dao.findAll(conn);
		close(conn);
		return list;
	}
	
	//상세게시글조회
	public MyPlant findMyPlantByNo(int no, boolean hasRead) {
		Connection conn = getConnection();
		MyPlant MyPlant = dao.findmyplantByNo(conn, no);
		
		// 조회수 증가 로직
//		if(hasRead == true && MyPlant != null) {
//			int result = dao.updateReadCount(conn, MyPlant);
//			if(result > 0) {
//				commit(conn);
//			}else {
//				rollback(conn);
//			}
//		}
//		
		close(conn);
		return MyPlant;
	}
	
	public int delete(int no) {
		Connection conn = getConnection();
		int result = dao.deleteByMpno(conn, no);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	
	public int getMyPlantCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getMyPlantCount(conn);
		close(conn);
		return result;
	}
	
	//리플쓰기
//	public int saveReply(Reply reply) {
//		Connection conn = getConnection();
//		int result = dao.insertReply(conn, reply);
//		
//		if(result > 0 ) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		
//		close(conn);
//		return result;
//	}

	//리플삭제
//	public int deleteReply(int replyNo) {
//		Connection conn = getConnection();
//		
//		int result = dao.deleteReply(conn, replyNo);
//		
//		if(result > 0 ) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		
//		close(conn);
//		return result;
//	}
}
