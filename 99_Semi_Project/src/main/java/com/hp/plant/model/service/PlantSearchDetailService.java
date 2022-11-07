package com.hp.plant.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.hp.plant.model.dao.PlantDao;
import com.hp.plant.model.vo.PlantInfo;
import com.hp.common.util.PageInfo;

public class PlantSearchDetailService {
	private PlantDao dao = new PlantDao();
	private Connection conn = null;

	public PlantSearchDetailService() {
		setConn(getConnection());
	}
	
	public int getPlantCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getPlantCount(conn, searchMap);
		close(conn);
		return result;
	}
	
	public List<PlantInfo> getPlantInfoList(PageInfo pageinfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<PlantInfo> list = dao.selectAll(conn, pageinfo, searchMap); // selectby~
		close(conn);
		return list;
	}

	public PlantInfo detailInfo(int pNo) {
		Connection conn = getConnection();
		PlantInfo plantinfo = dao.detailInfo(conn, pNo);
		
		if(pNo > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
	
		return plantinfo;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
}
