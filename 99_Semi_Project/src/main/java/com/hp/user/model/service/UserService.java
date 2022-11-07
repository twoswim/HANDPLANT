package com.hp.user.model.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.hp.user.model.dao.UserDao;
import com.hp.user.model.vo.User;

/**
 * 멤버에 관련된 기능 구현
 * 기능 : 로그인, 로그아웃, 회원가입, 회원탈퇴, 정보수정
 */
public class UserService {
	private UserDao dao = new UserDao();
	
	public User finduserById(String id) {
		Connection conn = getConnection();
		User user = dao.findUserById(conn, id);
		close(conn);
		return user;
	}
	
	// 로그인기능, id pw를 DB에서 대조하여 인증된 사용자인지 검증하는 기능
	public User login(String id, String pw) {
		User user = finduserById(id);

		// 꼼수 기능, 향후 pw를 hash코드로 대체할건데, pw 변경이 필요함으로 admin 따로 기능구현 
		if(user != null && user.getuIds().equals("admin")) {
			return user;
		}
		
		if(user != null && user.getuPw().equals(pw)) {
			return user;
		}else {
			return null;
		}
	}
	
	// 회원 수정
	public int save(User user) {
		int result = 0;
		Connection conn = getConnection();
		
		if(user.getuNo() != 0) {
			result = dao.updateUser(conn, user);
		}else {
			result = dao.insertUser(conn, user);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int save2(User user) {
		int result = 0;
		Connection conn = getConnection();
		
		if(user.getuNo() != 0) {
			result = dao.updateUser(conn, user);
		}else {
			result = dao.insertKakaoUser(conn, user);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 회원 탈퇴
	public int delete(int no) {
		Connection conn = getConnection();
		int result = dao.updateStatus(conn, no, "N");
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 패스워드 변경
	public int updatePassword(int no, String password) {
		Connection conn = getConnection();
		int result = dao.updatePassword(conn, no, password);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 중복 가입 방지용
	public boolean isDuplicated(String id) {
		Connection conn = getConnection();
		User user = dao.findUserById(conn, id);
		close(conn);

		if(user != null) {
			return true; // 중복됨
		}else {
			return false; // 중복되지 않음! -> 회원가입 가능
		}
	}

}

