package com.hp.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.product.service.ProductService;
import com.hp.product.vo.Product;
import com.hp.user.model.vo.User;
import com.hp.common.util.MyHttpServlet;

@WebServlet("/product/like")

public class ProductLikeServlet extends MyHttpServlet{
	
	private static final long serialVersionUID = 1L;

	private ProductService service = new ProductService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Product p = (Product)req.getAttribute("product");
//		Product p = (Product)session.getAttribute("product");
		
		int prNo = Integer.parseInt(req.getParameter("prNo"));
		
		HttpSession session = req.getSession();
		
		
		List<Product> list = (List<Product>)session.getAttribute("list");
		
		Product p = list.get(prNo-1);
		System.out.println("받아온 상품 :" + p.toString());
		
		
		try {
//		User loginMember = (User)req.getAttribute("user");
		User loginMember = getSessionUser(req);
		int result = service.saveProductLike(p, loginMember.getuNo());
		
		
		System.out.println(result);
		
		if(result > 0) {
			sendCommonPage("찜상품이 정상적으로 등록되었습니다.", "/product/list", req, resp);
			return;
		}else {
			sendCommonPage("찜상품 등록에 실패하였습니다. (code=102)", "/product/list", req, resp);
		}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("정상적으로 처리할 수 없습니다. (code=103)",  "/product/list", req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		// TODO Auto-generated method stub
		return null;
	}


	


}
