package com.hp.board.model.dao;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hp.board.model.vo.Board;
import com.hp.board.model.vo.Reply;
import com.hp.common.util.PageInfo;

public class BoardDAO {

	// 게시물의 개수를 가져오는 쿼리문
	public int getBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM BOARD WHERE boStatus='Y'";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	public List<Board> findByUno(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String query = "SELECT B.boNo, B.uNo, B.uName, B.boTitle, B.boCont, B.boType, B.boFileName, B.boView, B.boStatus, B.boCreateDate "
					 + "FROM USERS U, BOARD B "
					 + "WHERE U.uNo = ? and (U.uNo = B.uNo)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoNo(rs.getInt("boNo"));
				board.setuNo(rs.getInt("uNo"));
				board.setuName(rs.getString("uName"));
				board.setBoTitle(rs.getString("boTitle"));
				board.setBoCont(rs.getString("boCont"));
				board.setBoType(rs.getString("boType"));
				board.setBoFileName(rs.getString("boFileName"));
				board.setBoView(rs.getInt("boView"));
				board.setBoStatus(rs.getString("boStatus"));
				board.setBoCreateDate(rs.getDate("boCreateDate"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<Board> findAll(Connection conn, PageInfo pageInfo) {
		System.out.println("findAll 호출됨");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String query = "SELECT RNUM, boNo, uNo, uIds, uName, boTitle, boCont, boType, boFileName, boView, boStatus, boCreateDate "
				+ "FROM ("
				+ "SELECT ROWNUM AS RNUM, boNo, uNo, uIds, uName, boTitle, boCont, boType, boFileName, boView, boStatus, boCreateDate "
				+ "FROM ( "
				+ "SELECT B.boNo, U.uNo, U.uIds, U.uName, B.boTitle, B.boCont, B.boType, B.boFileName, B.boView, B.boStatus, B.boCreateDate "
				+ "FROM BOARD B JOIN USERS U ON(B.uNo = U.uNo) " + "WHERE B.boStatus = 'Y' ORDER BY B.boNo DESC)) "
				+ "WHERE boNo BETWEEN ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setBoNo(rs.getInt("boNo"));
				board.setuNo(rs.getInt("uNo"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setuIds(rs.getString("uIds"));
				board.setuName(rs.getString("uName"));
				board.setBoTitle(rs.getString("boTitle"));
				board.setBoCont(rs.getString("boCont"));
				board.setBoType(rs.getString("boType"));
				board.setBoView(rs.getInt("boView"));
				board.setBoStatus(rs.getString("boStatus"));
				board.setBoCreateDate(rs.getDate("boCreateDate"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	
	// 게시물의 개수를 가져오는 쿼리문
	// searchMap : key=탐색할 컨텐츠, value=키워드
	// - 탐색 가능 컨텐츠 : title, content, writer
	public int getBoardCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) " + "FROM BOARD B " + "JOIN USERS U ON(B.uNo = U.uNo) " 
						+ "WHERE 1=1 "+ "	AND B.boSTATUS = 'Y' ";
		
		if (searchMap.containsKey("title")) {
			query += "AND B.boTitle LIKE ? ";
		}
		if (searchMap.containsKey("content")) {
			query += "AND B.boCont LIKE ? ";
		}
		if (searchMap.containsKey("writer")) {
			query += "AND U.uName LIKE ? ";
		}
		
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("title")) {
				pstmt.setString(count++, "%" + searchMap.get("title") + "%");
			}
			if (searchMap.containsKey("content")) {
				pstmt.setString(count++, "%" + searchMap.get("content") + "%");
			}
			if (searchMap.containsKey("writer")) {
				pstmt.setString(count++, "%" + searchMap.get("writer") + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 게시물의 리스트를 가져오는 메소드
	public List<Board> findAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String queryBefore = "SELECT RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ("
				+ "SELECT ROWNUM AS RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ( "
				+ "SELECT B.boNo, B.boTitle, B.boType, U.uName, B.boCreateDate, B.boFileName, B.boView, B.boStatus "
				+ "FROM BOARD B JOIN USERS U ON(B.uNo = U.uNo)" + "WHERE 1 = 1"
				+ "AND B.boStatus = 'Y' ";

		String queryAfter = "ORDER BY B.boNO DESC" + "    ) " + ") " + "WHERE RNUM BETWEEN ? and ?";

		if (searchMap.containsKey("title")) {
			queryBefore += "AND B.boTitle LIKE ? ";
		}
		if (searchMap.containsKey("content")) {
			queryBefore += "AND B.boCont LIKE ? ";
		}
		if (searchMap.containsKey("writer")) {
			queryBefore += "AND U.uName LIKE ? ";
		}

		String query = queryBefore + queryAfter;

		try {
			pstmt = conn.prepareStatement(query);

			int count = 1;
			if (searchMap.containsKey("title")) {
				pstmt.setString(count++, "%" + searchMap.get("title") + "%");
			}
			if (searchMap.containsKey("content")) {
				pstmt.setString(count++, "%" + searchMap.get("content") + "%");
			}
			if (searchMap.containsKey("writer")) {
				pstmt.setString(count++, "%" + searchMap.get("writer") + "%");
			}

			pstmt.setInt(count++, pageInfo.getStartList());
			pstmt.setInt(count++, pageInfo.getEndList());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setRowNum(rs.getInt("RNUM"));
				board.setBoNo(rs.getInt("boNO"));
				board.setBoTitle(rs.getString("boTitle"));
				board.setBoType(rs.getString("boType"));
				board.setuName(rs.getString("uName"));
				board.setBoCreateDate(rs.getDate("boCreateDate"));
				board.setBoFileName(rs.getString("boFileName"));
				board.setBoView(rs.getInt("boView"));
				board.setBoStatus(rs.getString("boStatus"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	// 게시물의 공지리스트를 가져오는 메소드
		public List<Board> findNoAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Board> list = new ArrayList<Board>();
			String queryBefore = "SELECT RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
					+ "FROM ("
					+ "SELECT ROWNUM AS RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
					+ "FROM ( "
					+ "SELECT B.boNo, B.boTitle, B.boType, U.uName, B.boCreateDate, B.boFileName, B.boView, B.boStatus "
					+ "FROM BOARD B JOIN USERS U ON(B.uNo = U.uNo)" + "WHERE 1 = 1 AND B.botype = '공지' "
					+ "AND B.boStatus = 'Y' ";

			String queryAfter = "ORDER BY B.boNO DESC" + "    ) " + ") " + "WHERE RNUM BETWEEN ? and ?";

			if (searchMap.containsKey("title")) {
				queryBefore += "AND B.boTitle LIKE ? ";
			}
			if (searchMap.containsKey("content")) {
				queryBefore += "AND B.boCont LIKE ? ";
			}
			if (searchMap.containsKey("writer")) {
				queryBefore += "AND U.uName LIKE ? ";
			}

			String query = queryBefore + queryAfter;

			try {
				pstmt = conn.prepareStatement(query);

				int count = 1;
				if (searchMap.containsKey("title")) {
					pstmt.setString(count++, "%" + searchMap.get("title") + "%");
				}
				if (searchMap.containsKey("content")) {
					pstmt.setString(count++, "%" + searchMap.get("content") + "%");
				}
				if (searchMap.containsKey("writer")) {
					pstmt.setString(count++, "%" + searchMap.get("writer") + "%");
				}

				pstmt.setInt(count++, pageInfo.getStartList());
				pstmt.setInt(count++, pageInfo.getEndList());

				rs = pstmt.executeQuery();
				while (rs.next()) {
					Board board = new Board();
					board.setRowNum(rs.getInt("RNUM"));
					board.setBoNo(rs.getInt("boNO"));
					board.setBoTitle(rs.getString("boTitle"));
					board.setBoType(rs.getString("boType"));
					board.setuName(rs.getString("uName"));
					board.setBoCreateDate(rs.getDate("boCreateDate"));
					board.setBoFileName(rs.getString("boFileName"));
					board.setBoView(rs.getInt("boView"));
					board.setBoStatus(rs.getString("boStatus"));
					list.add(board);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return list;
		}

	// 글쓰기 기능
	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD VALUES(SEQ_boNo.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, SYSDATE ,DEFAULT, ?)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board.getuNo());
			pstmt.setString(2, board.getuName());
			pstmt.setString(3, board.getBoTitle());
			pstmt.setString(4, board.getBoCont());
			pstmt.setString(5, board.getBoType());
			pstmt.setString(6, board.getBoFileName());
			pstmt.setString(7, board.getRe_boFileName());
			pstmt.setString(8, board.getBoImgUrl());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 상세 게시글을 조회
	public Board findBoardByNo(Connection conn, int boNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		String query = "SELECT B.boNo, B.boImgUrl, B.boType, B.boTitle, B.boView, U.uName, U.uIds, B.boFileName, B.re_boFileName, B.boCreateDate, B.boModifyDate, B.boCont "
				+ "FROM BOARD B " + "JOIN USERS U ON(B.uNo = U.uNo) " + "WHERE B.boStatus = 'Y' AND B.boNo = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoNo(rs.getInt("boNo"));
				board.setBoType(rs.getString("boType"));
				board.setBoImgUrl(rs.getString("boImgUrl"));
				board.setBoTitle(rs.getString("boTitle"));
				board.setBoView(rs.getInt("boView"));
				board.setuName(rs.getString("uName"));
				board.setuIds(rs.getString("uIds"));
				board.setBoFileName(rs.getString("boFileName"));
				board.setRe_boFileName(rs.getString("re_boFileName"));
				board.setBoCreateDate(rs.getDate("boCreateDate"));
				board.setBoModifyDate(rs.getDate("boModifyDate"));
				board.setBoCont(rs.getString("boCont"));
				board.setReplies(getRepliesByNo(conn, boNo));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return board;
	}

	// 게시글 조회수 올려주는 쿼리
	public int updateReadCount(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET boView = ? WHERE boNo = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board.getBoView() + 1);
			pstmt.setInt(2, board.getBoNo());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 삭제(실제로는 안보여주기 기능) 를 위한 쿼리
	public int updateStatus(Connection conn, int boNo, String boStatus) {
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET boStatus = ? WHERE boNo = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, boStatus);
			pstmt.setInt(2, boNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 수정
	public int updateBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET boTitle=?, boCont=?, boFileName=?, re_boFileName=?, boModifyDate=SYSDATE WHERE boNo=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getBoTitle());
			pstmt.setString(2, board.getBoCont());
			pstmt.setString(3, board.getBoFileName());
			pstmt.setString(4, board.getRe_boFileName());
			pstmt.setInt(5, board.getBoNo());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리플의 개수를 가져오는 쿼리문
	public int getRepliesCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM REPLY";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 리플을 가져오는 메소드
	public List<Reply> getRepliesByNo(Connection conn, int boNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reply> list = new ArrayList<Reply>();
		String query = "SELECT R.coNo, R.boNo, R.coContent, U.uIds, U.uName, R.coStatus ,R.coCreateDate, R.coModifyDate "
				+ "FROM REPLY R " + "JOIN USERS U ON(R.coId = U.uIds) " + "WHERE R.coStatus='Y' AND boNo= ? "
				+ "ORDER BY R.coNo DESC";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reply reply = new Reply();
				reply.setCoNo(rs.getInt("coNo"));
				reply.setBoNo(rs.getInt("boNo"));
				reply.setCoContent(rs.getString("coContent"));
				reply.setCoId(rs.getString("uIds"));
				reply.setuName(rs.getString("uName"));
				reply.setCoStatus(rs.getString("coStatus"));
				reply.setCoCreateDate(rs.getDate("coCreateDate"));
				reply.setCoModifyDate(rs.getDate("coModifyDate"));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;

	}

	// 리플 쓰기 기능
	public int insertReply(Connection conn, Reply reply) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPLY VALUES(SEQ_coNo.NEXTVAL, ?, ?, ?,?,?, DEFAULT, DEFAULT, DEFAULT)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reply.getBoNo());
			pstmt.setInt(2, reply.getuNo());
			pstmt.setString(3, reply.getCoId());
			pstmt.setString(4, reply.getuName());
			pstmt.setString(5, reply.getCoContent());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리플 삭제 기능
	public int deleteReply(Connection conn, int coNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE REPLY WHERE coNo = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, coNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public static void main(String[] args) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();

		// 게시물 개수
		int count = dao.getBoardCount(conn);
		System.out.println("게시물 개수 : " + count);
		System.out.println("--------------------------------------------");

		// 일반 게시판 리스트
		PageInfo info = new PageInfo(1, 10, count, 10);
		List<Board> list = dao.findAll(conn, info);
		for (Board b : list) {
			System.out.println(b.toString());
		}
		System.out.println("--------------------------------------------");

		// 게시물 개수 - 탐색
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("title", "안녕");
//      searchMap.put("content", "알로하");
//      searchMap.put("writer", "twoswim98");
		count = dao.getBoardCount(conn, searchMap);
		System.out.println("게시물 개수 : " + count);
		System.out.println("--------------------------------------------");

		// 일반 게시판 리스트 - 탐색
		info = new PageInfo(1, 10, count, 10);
		list = dao.findAll(conn, info, searchMap);
		for (Board b : list) {
			System.out.println(b.toString());
		}
		System.out.println("--------------------------------------------");

		// 일반 게시판 글쓰기
		Board board = new Board();
		board.setuNo(1);
		board.setBoTitle("자바에서 작성한 글 입니다.");
		board.setBoCont("자바에서 올린 글 내용입니다.");
		board.setBoType("자유");
		board.setBoFileName("수정 전 파일");
		board.setRe_boFileName("수정 후 파일");
		int result = dao.insertBoard(conn, board);
		System.out.println("글올리기 결과 : " + result);
		System.out.println(board.toString());
		System.out.println("--------------------------------------------");

		// 게시물 개수
		count = dao.getBoardCount(conn);
		System.out.println("게시물 개수 : " + count);
		System.out.println("--------------------------------------------");

		// 일반 게시판 리스트
		info = new PageInfo(1, 2, count, 10);
		list = dao.findAll(conn, info);
		for (Board b : list) {
			System.out.println(b.toString());
		}
		System.out.println("--------------------------------------------");

		// 댓글 개수
		count = dao.getRepliesCount(conn);
		System.out.println("댓글 개수 : " + count);
		System.out.println("--------------------------------------------");

	}

	public List<Reply> findReplyByUid(Connection conn, String uid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reply> list = new ArrayList<Reply>();
		String query = "SELECT coNo, boNo, coContent, uName, uNo, coId, coStatus ,coCreateDate, coModifyDate "
				+ "FROM REPLY WHERE coStatus='Y' AND coId= ? ";
			

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Reply reply = new Reply();
				reply.setCoNo(rs.getInt("coNo"));
				reply.setBoNo(rs.getInt("boNo"));
				reply.setuNo(rs.getInt("uNo"));
				reply.setuName(rs.getString("uName"));
				reply.setCoContent(rs.getString("coContent"));
				reply.setCoId(rs.getString("coId"));
				reply.setCoStatus(rs.getString("coStatus"));
				reply.setCoCreateDate(rs.getDate("coCreateDate"));
				reply.setCoModifyDate(rs.getDate("coModifyDate"));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
}