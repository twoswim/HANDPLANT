package com.hp.product.service;

import static com.hp.common.JDBCTemplate.close;
import static com.hp.common.JDBCTemplate.commit;
import static com.hp.common.JDBCTemplate.getConnection;
import static com.hp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.hp.common.util.PageInfo;
import com.hp.product.dao.ProductDao;
import com.hp.product.vo.Product;

public class ProductService {
	
	private ProductDao dao = new ProductDao();
	
	public List<Product> getProductList() {
		Connection conn = getConnection();
		List<Product> list = dao.findAll(conn);
		close(conn);
		return list;
	}
	
	public int saveProductLike(Product p, int uNo) {
		Connection conn = getConnection();
		int result = dao.saveProductLike(conn, p, uNo);
		close(conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Product> getProductListByUno(int uNo) {
		Connection conn = getConnection();
		List<Product> list = dao.findByUno(conn, uNo);
		close(conn);
		return list;
	}

}
