package com.hp.product.dao;

import static com.hp.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hp.board.model.vo.Board;
import com.hp.product.vo.Product;

public class ProductDao {
	public int saveProductLike(Connection conn, Product p, int uNo) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT_LIKE VALUES(SEQ_prLikeNo.NEXTVAL, ?, ? )";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
	
			pstmt.setInt(1, p.getPrNo());
			pstmt.setInt(2, uNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Product> findByUno(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		String query = "SELECT P.prNo, P.prName, P.prType, P.prPrice, P.prImage, P.prUrl, L.prNo " 
				 +"FROM product_like L, product P " 
				 +"WHERE L.uNo = ? AND (L.prNo = P.prNo)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setPrNo(rs.getInt("prNo"));
				product.setPrName(rs.getString("prName"));
				product.setPrType(rs.getString("prType"));
				product.setPrPrice(rs.getString("prPrice"));
				product.setPrImage(rs.getString("prImage"));
				product.setPrUrl(rs.getString("prUrl"));
				
				System.out.println(product.toString());
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	
	
	public List<Product> findAll(Connection conn) {
		System.out.println("product findAll 호출됨");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		String queryBefore = "SELECT * "
				 		   + "FROM PRODUCT";

		try {
			pstmt = conn.prepareStatement(queryBefore);

			int count = 1;

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setPrNo(rs.getInt("prNo"));
				p.setPrName(rs.getString("prName"));
				p.setPrType(rs.getString("prType"));
				p.setPrPrice(rs.getString("prPrice"));
				p.setPrImage(rs.getString("prImage"));
				p.setPrUrl(rs.getString("prUrl"));
				
				System.out.println(p.toString());
				list.add(p);
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
