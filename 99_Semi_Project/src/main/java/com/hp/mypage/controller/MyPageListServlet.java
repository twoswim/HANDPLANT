package com.hp.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.board.model.service.BoardService;
import com.hp.board.model.vo.Board;
import com.hp.board.model.vo.Reply;
import com.hp.common.util.MyHttpServlet;
import com.hp.mypage.model.service.MyPlantService;
import com.hp.mypage.model.vo.MyPlant;
import com.hp.product.service.ProductService;
import com.hp.product.vo.Product;
import com.hp.user.model.vo.User;

@WebServlet("/myPage/list")
public class MyPageListServlet extends MyHttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("findAll 호출됨");
		
		
		
		//uer
		User loginUser = getSessionUser(req);
		int uNo = loginUser.getuNo();
		String uid = loginUser.getuIds();
		
		BoardService bService = new BoardService();
		ProductService prService = new ProductService();
		MyPlantService mpservice = new MyPlantService();
		
		//board
		List<Board> board = bService.getBoardListByUno(uNo);
		req.setAttribute("blist", board);
		
		//reply
		List<Reply> rlist= bService.getReplyListByUid(uid);
		req.setAttribute("rlist", rlist);
		System.out.println("댓글리스트 : " + rlist.toString());
		
		//product
		List<Product> product = prService.getProductListByUno(uNo);
		System.out.println("스토어 : " + product.toString());
		
		req.setAttribute("prlist", product);
		
		//myplant
		List<MyPlant> myplant = mpservice.getMyPlantListByUno(uNo);
		System.out.println("반려식물 :" + myplant.toString());
		req.setAttribute("myplant", myplant);
		
		//한번만불러줌
		req.getRequestDispatcher("/views/html/6_myPage.jsp").forward(req, resp);
		
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
