package com.hp.plant.model.dao;

import static com.hp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.hp.plant.model.vo.PlantInfo;
import com.hp.common.util.PageInfo;

public class PlantDao {
	
	public List<PlantInfo> selectAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		List<PlantInfo> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String queryAfter = "";
		String queryBefore = "SELECT plNo,pNo, pKorName ,pSctName, pEngName , pLang, pContent, pUse, pGrow ,pType, pImgUrl1 , pImgUrl2 ,pImgUrl3, pTag FROM ( " 
				+" SELECT ROWNUM AS plNo,pNo, pKorName ,pSctName, pEngName , pLang, pContent, pUse, pGrow ,pType, pImgUrl1 , pImgUrl2 ,pImgUrl3, pTag FROM PLANT_INFO WHERE 1=1 ";
		
		if (searchMap.containsKey("pKorName")) {
			queryBefore += "AND pkorName LIKE ? ";
		
		}
		
		if (searchMap.containsKey("pTag")) {
			queryBefore += "AND pTag LIKE ? ";
		
		}

			queryAfter = ") WHERE plNo BETWEEN ? and ? ";
		
		
		String query = queryBefore + queryAfter;
		try {
			pstmt = conn.prepareStatement(query);
			
			int count = 1;
			if (searchMap.containsKey("pKorName")) {
				pstmt.setString(count++, "%" + searchMap.get("pKorName") + "%");
			}
			if (searchMap.containsKey("pTag")) {
				pstmt.setString(count++, "%" + searchMap.get("pTag") + "%");
			}
			pstmt.setInt(count++, pageInfo.getStartList());
			pstmt.setInt(count++, pageInfo.getEndList());
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
				int pNo 			= rs.getInt("pNo");
//				String pMonth 		= rs.getString("fMonth");
//				String pDay 		= rs.getString("fDay");
				String pKorName 		= rs.getString("pKorName");
				String pSctName 		= rs.getString("pSctName");
				String pEngName 		= rs.getString("pEngName");
				String pLang 		= rs.getString("pLang");
				String pContent 		= rs.getString("pContent");
				String pUse 		= rs.getString("pUse");
				String pGrow 	= rs.getString("pGrow");
				String pType 		= rs.getString("pType");
//				String pFileName1 		= rs.getString("fileName1");
//				String pFileName2		= rs.getString("fileName2");
//				String pFileName3 	= rs.getString("fileName3");
				String pImgUrl1 		= rs.getString("pimgUrl1");
				String pImgUrl2		= rs.getString("pimgUrl2");
				String pImgUrl3 	= rs.getString("pimgUrl3");
//				String pWatering 	= rs.getString("fWatering");
//				String pSunshine 	= rs.getString("fSunshine");
//				String pHumidity 	= rs.getString("fHumidity");
//				String pTemperature 	= rs.getString("fTemperature");

//				PlantInfo info = new PlantInfo(pNo, pMonth,pDay,pKorName ,pSctName, pEngName ,pLang, pContent, pUse, pGrow ,pType,pFileName1,
//						pFileName2,pFileName3,pImgUrl1 , pImgUrl2 ,pImgUrl3,pWatering,pSunshine,pHumidity,pTemperature ) ;
				PlantInfo info = new PlantInfo(pNo, pKorName ,pSctName, pEngName , pLang, pContent, pUse, pGrow ,pType,
						pImgUrl1 , pImgUrl2 ,pImgUrl3) ;
				list.add(info);
				
				System.out.println("검색한거  : " + list.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 식물 번호로 검색
	public PlantInfo detailInfo(Connection conn, int no) {
		PlantInfo info = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM PLANT_INFO WHERE pNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				int count = 1;
				int pNo 			= rs.getInt("pNo");
				String pImgUrl1 		= rs.getString("pimgUrl1");
				String pImgUrl2		= rs.getString("pimgUrl2");
				String pImgUrl3 	= rs.getString("pimgUrl3");
				String pWatering 	= rs.getString("pWaterCycle");
				String pSunshine 	= rs.getString("pSunshine");
				String pHumidity 	= rs.getString("pHumidity");
				String pTemperature 	= rs.getString("pTemperature");
				String pKorName 		= rs.getString("pKorName");
				String pSctName 		= rs.getString("pSctName");
				String pEngName 		= rs.getString("pEngName");
				String pLang 		= rs.getString("pLang");
				String pContent 		= rs.getString("pContent");
				String pUse 		= rs.getString("pUse");
				String pGrow 	= rs.getString("pGrow");
				String pType 		= rs.getString("pType");
				String pTag 		= rs.getString("pTag");

				info = new PlantInfo(pNo, pKorName ,pSctName, pEngName ,pLang, pContent, pUse, pGrow ,pType, 
						pImgUrl1 , pImgUrl2 ,pImgUrl3 ,pWatering,pSunshine,pHumidity,pTemperature,pTag) ;
//				list.add(info)
//				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(info);
		return info;
	}

	// DB에 담기
		public  int insertAll(Connection conn, List<PlantInfo> list) {
			int result = 0;
			try {
				for (int i = 0; i < list.size(); i++) {
					PlantInfo plant = list.get(i);
					String sql = "INSERT INTO "
							+ "PLANT_INFO(PNO, PKORNAME, PSCTNAME, PENGNAME, PLANG, PCONTENT, PUSE, PGROW, PTYPE, PIMGURL1, PIMGURL2, PIMGURL3)"
							+ "VALUES(SEQ_pNo.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

					PreparedStatement pstmt = conn.prepareStatement(sql);

					int cnt = 1;
//					pstmt.setInt(cnt++, plant.getfNo());
					pstmt.setString(cnt++, plant.getfKorNm());
					pstmt.setString(cnt++, plant.getfSctNm());
					pstmt.setString(cnt++, plant.getfEngNm());
					pstmt.setString(cnt++, plant.getfLang());
					pstmt.setString(cnt++, plant.getfContent());
					pstmt.setString(cnt++, plant.getfUse());
					pstmt.setString(cnt++, plant.getfGrow());
					pstmt.setString(cnt++, plant.getfType());
					pstmt.setString(cnt++, plant.getImgUrl1());
					pstmt.setString(cnt++, plant.getImgUrl2());
					pstmt.setString(cnt++, plant.getImgUrl3());

					result = pstmt.executeUpdate();
					pstmt.close();
				}
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
		
		public int insertAdd(Connection conn, PlantInfo plant) {
			try {
				String sql = "INSERT INTO "
						+ "PLANT_INFO_ADD(P_NO, P_KORNAME, P_SCTNAME, P_ENGNAME, P_LANG) "
						+ "VALUES(?, ?, ?, ?, ?) ";

				PreparedStatement pstmt = conn.prepareStatement(sql);

				int cnt = 1;
				pstmt.setInt(cnt++, 1);
				pstmt.setString(cnt++, "진달래");
				pstmt.setString(cnt++, "JINDALLRE");
				pstmt.setString(cnt++, "P_ENGNAME");
				pstmt.setString(cnt++, "P_LANG");
				
				int result = pstmt.executeUpdate();
				pstmt.close();
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}





	// searchMap : key=탐색할 컨텐츠, value=키워드
	// - 탐색 가능 컨텐츠 : pKorName, (+ 꽃말 + 특징)
	public int getPlantCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT  COUNT(*) " 
					+ "FROM PLANT_INFO " 
					+ "WHERE 1=1";
		
		if (searchMap.containsKey("pKorName")) {
			query += "AND PKORNAME LIKE ? ";
		}
		
		if (searchMap.containsKey("pTag")) {
			query += "AND PTAG LIKE ? ";
		}

		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("pKorName")) {
				pstmt.setString(count++, "%" + searchMap.get("pKorName") + "%");
			}
			if (searchMap.containsKey("pTag")) {
				pstmt.setString(count++, "%" + searchMap.get("pTag") + "%");
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
	
	public int searchByName(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT  COUNT(*) " 
					+ "FROM PLANT_INFO " 
					+ "WHERE 1=1";
		
		if (searchMap.containsKey("pKorName")) {
			query += "AND PKORNAME LIKE ? ";
		}

		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("pKorName")) {
				pstmt.setString(count++, "%" + searchMap.get("pKorName") + "%");
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
	
	// 식물의 리스트를 가져오는 메소드
	public List<PlantInfo> findAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PlantInfo> list = new ArrayList<PlantInfo>();
		String query = "SELECT  * " + "FROM PLANT_INFO" ;
//		+ "WHERE 1=1"

		if (searchMap.containsKey("pKorNm")) {
			query += "AND P.PKORNAME LIKE ? ";
		}

		try {
			pstmt = conn.prepareStatement(query);

			int count = 1;
			if (searchMap.containsKey("pKorNm")) {
				pstmt.setString(count++, "%" + searchMap.get("pKorNm") + "%");
			}
	

//			pstmt.setInt(count++, pageInfo.getStartList());
//			pstmt.setInt(count++, pageInfo.getEndList());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				int pNo 			= rs.getInt("fNo");
				String pKorName 		= rs.getString("fKorNm");
				String pSctName 		= rs.getString("fSctNm");
				String pEngName 		= rs.getString("fEngNm");
				String pLang 		= rs.getString("fLang");
				String pContent 		= rs.getString("fContent");
				String pUse 		= rs.getString("fUse");
				String pGrow 	= rs.getString("fGrow");
				String pType 		= rs.getString("fType");
				String pImgUrl1 		= rs.getString("imgUrl1");
				String pImgUrl2		= rs.getString("imgUrl2");
				String pImgUrl3 	= rs.getString("imgUrl3");

				PlantInfo info = new PlantInfo(pNo, pKorName ,pSctName, pEngName ,pLang, pContent, pUse, pGrow ,pType, pImgUrl1 , pImgUrl2 ,pImgUrl3 ) ;
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}


	private static Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public static void main(String[] args) {
		Connection conn = getConnection();
		PlantDao dao = new PlantDao();
		List<PlantInfo> list = new ArrayList<PlantInfo>();
		
		dao.insertAll(conn, list);
	}

	
}
