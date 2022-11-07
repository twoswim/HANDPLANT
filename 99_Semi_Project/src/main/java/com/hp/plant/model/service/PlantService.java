package com.hp.plant.model.service;

import static com.hp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import com.hp.plant.model.dao.PlantDao;
import com.hp.plant.model.vo.PlantInfo;

public class PlantService {
	private PlantDao dao = new PlantDao();
	private Connection conn = null;

	public PlantService() {
		conn = getConnection();
	}
	
	public int insertAll(List<PlantInfo> list) {
		int result = dao.insertAll(conn, list);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
}
