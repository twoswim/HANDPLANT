package com.hp.user.model.dao;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hp.user.model.vo.User;

public class UserDao {

	// 회원 검색
	public User findUserById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM USERS WHERE uIds=? AND uStatus='Y'";
		
		try {
			pstmt = conn.prepareStatement(query); 
			pstmt.setString(1, id); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) { 
				User m = new User();
				m.setuNo(rs.getInt("uNo"));
				m.setuIds(rs.getString("uIds"));
				m.setuPw(rs.getString("uPw"));
				m.setuRole(rs.getString("uRole"));
				m.setuName(rs.getString("uName"));
				m.setuNickname(rs.getString("uNickname"));
				m.setuAddr(rs.getString("uAddr"));
				m.setuPhone(rs.getString("uPhone"));
				m.setuBirth(rs.getString("uBirth"));
				m.setuImgUrl(rs.getString("uImgUrl"));
				m.setuStatus(rs.getString("uStatus"));
				m.setuSignIn(rs.getDate("uSignIn"));
				m.setuUpDate(rs.getDate("uUpDate"));
				return m;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}
	
	// 회원 가입
	public int insertUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO USERS VALUES(SEQ_UNO.NEXTVAL, ?, ?, DEFAULT, ?, NULL, NULL, NULL, NULL, NULL, DEFAULT, DEFAULT, DEFAULT)"; //값없으면 이걸로 채우기
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getuIds());
			pstmt.setString(2, user.getuPw());
			pstmt.setString(3, user.getuName());
			
			result = pstmt.executeUpdate();
			
			System.out.println("유저 삽입 성공 :" + user.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertKakaoUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO USERS VALUES(SEQ_UNO.NEXTVAL, ?, ?, DEFAULT, ?, NULL, ?, NULL, ?, ?, DEFAULT, DEFAULT, DEFAULT)"; //값없으면 이걸로 채우기
		int result = 0;
		

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getuIds());
			pstmt.setString(2, user.getuPw());
			pstmt.setString(3, user.getuName());
			pstmt.setString(4, user.getuPhone());
			pstmt.setString(5, user.getuBirth());
			pstmt.setString(6, user.getuImgUrl());
			
			
			result = pstmt.executeUpdate();
			
			System.out.println("유저 삽입 성공 :" + user.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 회원 정보 수정
	public int updateUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		String query = "UPDATE USERS SET uName=?,  uPhone=?, uAddr=?, uBirth=?, uImgUrl=? ,uUpDate=SYSDATE WHERE uNo=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getuName());
			pstmt.setString(2, user.getuPhone());
			pstmt.setString(3, user.getuAddr());
			pstmt.setString(4, user.getuBirth());
			pstmt.setString(5, user.getuImgUrl());
			pstmt.setInt(6, user.getuNo());
			
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 회원 탈퇴
	public int updateStatus(Connection conn, int no, String status) {
		PreparedStatement pstmt = null;
		String query = "UPDATE USERS SET uStatus=? WHERE uNo=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status); // Y,N (STATUS IN ('Y', 'N'))
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 패스워드 변경
	public int updatePassword(Connection conn, int no, String password) {
		PreparedStatement pstmt = null;
		String query = "UPDATE USERS SET uPw=? WHERE uNo=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, password); 
			pstmt.setInt(2, no);
			
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
		UserDao dao = new UserDao();
		
		 //조회하기
		User user = dao.findUserById(conn, "twoswim98@naver.com");
		System.out.println(user.toString());
		System.out.println("---------------------------------------");
		
		// 회원가입
		User user2 = new User();
		user2.setuIds("test123");
		user2.setuPw("1234");
		user2.setuName("최태영");
		int result = dao.insertUser(conn, user2);
		User user3 = null;
		if(result == 1) {
			System.out.println("성공");
			user3 = dao.findUserById(conn, "test123");
			System.out.println(user3.toString());
		}else {
			System.out.println("실패");
		}
		System.out.println("---------------------------------------");
		
		// 업데이트
		user3.setuName("민지현");
		user3.setuNickname("민젼");
		user3.setuPhone("010-1234-5678");
		user3.setuAddr("구의");
		user3.setuBirth("20000122");
		result = dao.updateUser(conn, user3);
		if(result == 1) {
			System.out.println("업데이트 성공");
			user3 = dao.findUserById(conn, "test123");
			System.out.println(user3.toString());
		}else {
			System.out.println("업데이트 실패");
		}
		System.out.println("---------------------------------------");
		
		// 패스워드 변경
		result = dao.updatePassword(conn, user3.getuNo(), "4321");
		if(result == 1) {
			System.out.println("패스워드 업데이트 성공");
			user3 = dao.findUserById(conn, "test123");
			System.out.println(user3.toString());
		}else {
			System.out.println("패스워드 업데이트 실패");
		}
		System.out.println("---------------------------------------");
		
		// 회원탈퇴
		result = dao.updateStatus(conn, user3.getuNo(), "N");
		if(result == 1) {
			System.out.println("탈퇴 업데이트 성공");
			user3 = dao.findUserById(conn, "test12");
			System.out.println(user3);
		}else {
			System.out.println("탈퇴 업데이트 실패");
		}
		System.out.println("---------------------------------------");
	}
}



















