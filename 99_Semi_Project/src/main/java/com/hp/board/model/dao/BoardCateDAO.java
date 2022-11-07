package com.hp.board.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.hp.board.model.vo.Board;
import com.hp.common.util.PageInfo;

public class BoardCateDAO {

	// 공지 게시물의 개수를 가져오는 쿼리문
	public int getBoardAnnCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) " + "FROM BOARD B " + "JOIN USERS U ON(B.uNo = U.uNo) " + "WHERE 1=1 "
				+ "	AND B.boSTATUS = 'Y' " + "	AND B.boType = '공지' ";

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

	// 공지 게시물의 리스트를 가져오는 메소드
	public List<Board> AnnfindAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String queryBefore = "SELECT RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ("
				+ "SELECT ROWNUM AS RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ( "
				+ "SELECT B.boNo, B.boTitle, B.boType, U.uName, B.boCreateDate, B.boFileName, B.boView, B.boStatus "
				+ "FROM BOARD B JOIN USERS U ON(B.uNo = U.uNo)" + "WHERE 1 = 1" + "AND B.boStatus = 'Y' " + "	AND B.boType = '공지' ";

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
//
//	
//	
	// 분양 게시물의 개수를 가져오는 쿼리문
	public int getBoardParCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) " + "FROM BOARD B " + "JOIN USERS U ON(B.uNo = U.uNo) " + "WHERE 1=1 "
				+ "	AND B.boSTATUS = 'Y' " + "	AND B.boType = '분양' ";

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

	// 분양 게시물의 리스트를 가져오는 메소드
	public List<Board> ParfindAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String queryBefore = "SELECT RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ("
				+ "SELECT ROWNUM AS RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ( "
				+ "SELECT B.boNo, B.boTitle, B.boType, U.uName, B.boCreateDate, B.boFileName, B.boView, B.boStatus "
				+ "FROM BOARD B JOIN USERS U ON(B.uNo = U.uNo)" + "WHERE 1 = 1" + "AND B.boStatus = 'Y' " + "	AND B.boType = '분양' ";

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

	// 질문 게시물의 개수를 가져오는 쿼리문
	public int getBoardQueCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) " + "FROM BOARD B " + "JOIN USERS U ON(B.uNo = U.uNo) " + "WHERE 1=1 "
				+ "	AND B.boSTATUS = 'Y' " + "	AND B.boType = '질문' ";

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

	// 질문 게시물의 리스트를 가져오는 메소드
	public List<Board> QuefindAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String queryBefore = "SELECT RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ("
				+ "SELECT ROWNUM AS RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ( "
				+ "SELECT B.boNo, B.boTitle, B.boType, U.uName, B.boCreateDate, B.boFileName, B.boView, B.boStatus "
				+ "FROM BOARD B JOIN USERS U ON(B.uNo = U.uNo)" + "WHERE 1 = 1" + "AND B.boStatus = 'Y' " + "	AND B.boType = '질문' ";

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
	
//
//	
//	
	// 분양 게시물의 개수를 가져오는 쿼리문
	public int getBoardFreCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) " + "FROM BOARD B " + "JOIN USERS U ON(B.uNo = U.uNo) " + "WHERE 1=1 "
				+ "	AND B.boSTATUS = 'Y' " + "	AND B.boType = '자유' ";

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

	// 분양 게시물의 리스트를 가져오는 메소드
	public List<Board> FrefindAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String queryBefore = "SELECT RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ("
				+ "SELECT ROWNUM AS RNUM, boNo, boTitle, boType, uName, boCreateDate, boFileName, boView, boStatus "
				+ "FROM ( "
				+ "SELECT B.boNo, B.boTitle, B.boType, U.uName, B.boCreateDate, B.boFileName, B.boView, B.boStatus "
				+ "FROM BOARD B JOIN USERS U ON(B.uNo = U.uNo)" + "WHERE 1 = 1" + "AND B.boStatus = 'Y' " + "	AND B.boType = '자유' ";

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

}