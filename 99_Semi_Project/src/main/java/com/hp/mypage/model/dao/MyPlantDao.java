package com.hp.mypage.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.hp.common.util.PageInfo;
import com.hp.mypage.model.vo.MyPlant;

public class MyPlantDao {
	
	// 게시물의 개수를 가져오는 쿼리문
	public int getMyPlantCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM MYPLANT WHERE mpStatus='Y'";
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
	
	public List<MyPlant> selectAll(Connection conn) {
		List<MyPlant> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM MYPLANT M, USERS U WHERE M.UNO = U.UNO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
				int mpNo = rs.getInt("MPNO");  						 //내식물번호
				int uNo = rs.getInt("UNO");   						 //유저번호
				String mpName = rs.getString("MPNAME");				 //내식물이름
				String mpSctNm = rs.getString("MPSCTNM");			 //품종
				String mpWatering = rs.getString("MPWATERING");		 //물주기기록
				String mpStatus = rs.getString("MPSTATUS");			 //상태
				String mpCreateDate = rs.getString("MPCREATEDATE");	 //분양날짜
				String mpFileName = rs.getString("MPFILENAME");		 //첨부파일
				String re_mpFileName = rs.getString("RE_MPFILENAME");//첨부파일

				MyPlant myplant = new MyPlant(mpNo, uNo, mpSctNm, mpName, mpWatering,
						mpStatus, mpCreateDate, mpFileName, re_mpFileName);
				list.add(myplant);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}
	
	//작성 정보받아오기
	public List<MyPlant> findByUno(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyPlant> list = new ArrayList<MyPlant>();
		String query = "SELECT mpNo, mpName, mpSctNm, mpWatering, mpCreateDate, mpFileName, re_mpFileName "
					 + "FROM myplant WHERE uNo = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MyPlant myplant = new MyPlant();
				myplant.setMpNo(rs.getInt("mpNo"));
				myplant.setMpName(rs.getString("mpName"));
				myplant.setMpSctNm(rs.getString("mpSctNm"));
				myplant.setMpWatering(rs.getString("mpWatering"));
				myplant.setMpCreateDate(rs.getString("mpCreateDate"));
				myplant.setMpFileName(rs.getString("mpFileName"));
				myplant.setRe_mpFileName(rs.getString("re_mpFileName"));
				
				System.out.println(myplant.toString());
				list.add(myplant);
			}
			System.out.println(list.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// DB에 담기
	public int insertAll(Connection conn, List<MyPlant> list) {
		int result = 0;
		try {
			for (int i = 0; i < list.size(); i++) {
				MyPlant myplant = list.get(i);
				String sql = "INSERT INTO "
						+ "MYPLANT(MPNO, UNO, MPNAME, MPSCTNM, MPWATERING, MPSTATUS, MPFILENAME, RE_MPFILENAME)"
						+ "VALUES(SEQ_MPNO.NEXTVAL, ?, ?, ?, ?, DEFAULT, ?, ?, ?) ";

				PreparedStatement pstmt = conn.prepareStatement(sql);

				int cnt = 1;
				pstmt.setInt(cnt++, myplant.getMpNo());			  //내식물번호
				pstmt.setString(cnt++, myplant.getMpName());	  //유저번호
				pstmt.setString(cnt++, myplant.getMpSctNm());	  //품종
				pstmt.setString(cnt++, myplant.getMpWatering());  //물주기
				pstmt.setString(cnt++, myplant.getMpCreateDate());//분양날짜
				pstmt.setString(cnt++, myplant.getMpFileName());  //첨부파일

				result = pstmt.executeUpdate();
				pstmt.close();
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//추가하기
	public int insertAdd(Connection conn, MyPlant myplant) {
		try {
			String sql = "INSERT INTO "
					+ "MYPLANT(MPNO, UNO, MPNAME, MPSCTNM, MPWATERING, MPSTATUS, MPFILENAME, RE_MPFILENAME)"
					+ "VALUES(SEQ_MPNO.NEXTVAL, ?, ?, ?, ?, DEFAULT, ?, ?, ?) ";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			int cnt = 1;
			pstmt.setInt(cnt++, 1);				  //식물번호
			pstmt.setInt(cnt++, 1);				  //유저번호
			pstmt.setString(cnt++, "개나리");		  //이름
			pstmt.setString(cnt++, "개나리나리");	  //품종
			pstmt.setString(cnt++, "주 1회");		  //물주기
			pstmt.setString(cnt++, "2020-02-02"); //분양날짜
			pstmt.setString(cnt++, "Y");		  //첨부파일

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteByMpno(Connection conn, int no) {
		try {
			String sql = "delete from myplant where mpno = ?";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);				  //식물번호

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<MyPlant> findAll(Connection conn, PageInfo pageInfo) {
		System.out.println("findAll 호출됨");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyPlant> list = new ArrayList<MyPlant>();
		String query = "SELECT mpNo, uNo, mpName, mpSctNm, mpWatering, mpStatus, mpCreateDate, mpFileName, re_mpFileName "
				 + "FROM ("
				 	+ "SELECT mpNo, uNo, mpName, mpSctNm, mpWatering, mpStatus, mpCreateDate, mpFileName, re_mpFileName "
				 	+ "FROM ( "
				 		+ "SELECT P.mpNo, U.uNo, U.uIds, U.uName, P.uNo, P.mpName, P.mpSctNm, P.mpWatering, P.mpStatus, P.mpCreateDate, P.mpFileName "
				 		+ "FROM MYPLANT P JOIN USERS U ON(P.uNo = U.uNo) "
				 		+ "WHERE P.mpSctNm = 'Y' ORDER BY P.mpNo DESC)) " 
				 		+ "WHERE mpNo BETWEEN ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MyPlant myplant = new MyPlant();
				myplant.setMpNo(rs.getInt("mpNo"));
				myplant.setuNo(rs.getInt("uNo"));
				myplant.setMpSctNm(rs.getString("mpSctNm"));
				myplant.setMpName(rs.getString("mpName"));
				myplant.setMpWatering(rs.getString("mpWatering"));
				myplant.setMpStatus(rs.getString("mpStatus"));
				myplant.setMpCreateDate(rs.getString("mpCreateDate"));
				list.add(myplant);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	
	
	public List<MyPlant> findAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		System.out.println("findAll 호출됨");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyPlant> list = new ArrayList<MyPlant>();
		String queryBefore = "SELECT mpNo, uNo, mpSctNm, mpName, mpWatering, mpStatus, mpCreateDate, mpFileName, re_mpFileName "
				 		   + "FROM myplant";

		try {
			pstmt = conn.prepareStatement(queryBefore);

			int count = 1;

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MyPlant myplant = new MyPlant();
				myplant.setMpNo(count);
				myplant.setuNo(rs.getInt("uNo"));
				myplant.setMpSctNm(rs.getString("mpSctNm"));
				myplant.setMpName(rs.getString("mpName"));
				myplant.setMpWatering(rs.getString("mpWatering"));
				myplant.setMpCreateDate(rs.getString("mpCreateDate"));
				myplant.setRe_mpFileName(rs.getString("re_mpFileName"));
				
				System.out.println(myplant.toString());
				list.add(myplant);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}


	public List<MyPlant> findAll(Connection conn) {
		System.out.println("findAll3 호출됨");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyPlant> list = new ArrayList<MyPlant>();
		String query = "SELECT mpNo, uNo, mpSctNm, mpName,  mpWatering, mpStatus, mpCreateDate, mpFileName, re_mpFileName "
		 		   + "FROM myplant";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MyPlant myplant = new MyPlant();
				myplant.setMpNo(rs.getInt("mpNo"));
				myplant.setuNo(rs.getInt("uNo"));
				myplant.setMpSctNm(rs.getString("mpSctNm"));
				myplant.setMpName(rs.getString("mpName"));
				myplant.setMpWatering(rs.getString("mpWatering"));
				myplant.setMpStatus(rs.getString("mpStatus"));
				myplant.setMpCreateDate(rs.getString("mpCreateDate"));
				list.add(myplant);
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
	public int insertMyPlant(Connection conn, MyPlant myplant) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO myplant VALUES(SEQ_mpNo.NEXTVAL, ?, ?, ?, ?, DEFAULT, ?, ?, ?)";
		int result = 0;
		try { 
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, myplant.getuNo());              //회원번호
			pstmt.setString(2, myplant.getMpSctNm());		//품종
			pstmt.setString(3, myplant.getMpName());		//식물이름(애칭)
			pstmt.setString(4, myplant.getMpWatering());	//물주기
			pstmt.setString(5, myplant.getMpCreateDate());	//분양날짜
			pstmt.setString(6, myplant.getMpFileName());	//첨부파일
			pstmt.setString(7, myplant.getRe_mpFileName());	//첨부파일
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 상세 게시글을 조회 
	public MyPlant findmyplantByNo(Connection conn, int boNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyPlant myplant = null;
		String query = "SELECT mpNo, uNo, mpName, mpSctNm, mpWatering, mpStatus, mpCreateDate, mpFileName, re_mpFileName "
		 		   + "FROM myplant"
				+ "WHERE mpNo = ?";
		
					 
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				myplant = new MyPlant();
				myplant.setMpNo(rs.getInt("mpNo"));
				myplant.setuNo(rs.getInt("uNo"));
				myplant.setMpSctNm(rs.getString("mpSctNm"));
				myplant.setMpName(rs.getString("mpName"));
				myplant.setMpWatering(rs.getString("mpWatering"));
				myplant.setMpStatus(rs.getString("mpStatus"));
				myplant.setMpCreateDate(rs.getString("mpCreateDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return myplant;
	}
	
	// 게시글 삭제(실제로는 안보여주기 기능) 를 위한 쿼리
	public int updateStatus(Connection conn, int mpNo, String mpStatus) {
		PreparedStatement pstmt = null;
		String query = "UPDATE MYPLANT SET mpStatus = ? WHERE mpNo = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mpStatus);
			pstmt.setInt(2, mpNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	// 게시글 수정
	public int updateMyPlant(Connection conn, MyPlant myplant) {
		PreparedStatement pstmt = null;
		String query = "UPDATE MYPLANT SET mpName=?, mpSctNm=?, mpWatering=?, mpCreateDate=?, re_mpFileName=? WHERE mpNo=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, myplant.getMpNo());				//내식물번호
			pstmt.setString(3, myplant.getMpSctNm());		//품종
			pstmt.setString(2, myplant.getMpName());		//식물이름 (애칭)
			pstmt.setString(4, myplant.getMpWatering());	//물주기
			pstmt.setString(5, myplant.getMpCreateDate());	//분양날짜
			pstmt.setString(6, myplant.getRe_mpFileName());	//첨부파일

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}




}
