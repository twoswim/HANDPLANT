package com.hp.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.product.service.ProductService;
import com.hp.product.vo.Product;

@WebServlet("/product/list")
public class ProductListServlet extends HttpServlet {

		private static final long serialVersionUID = 1L;

		private ProductService service = new ProductService();
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("findAll 호출됨");
			int page = 1;
			int boardCount = 0;
			List<Product> list = null;
			
			

			
			list = service.getProductList();
			System.out.println("불러온 상품 : " + list.toString());
			
			req.setAttribute("list", list);
			//3 5 7
			req.getRequestDispatcher("/views/html/4_store.jsp").forward(req, resp);
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req, resp);
		}
		
//		public static void main(String[] args) {
//			ProductService service2 = new ProductService();
//			List<Product> list = service2.getProductList();
//			
//			System.out.println(list.toString());
//		}
	}


















