package com.hp.mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.util.PageInfo;
import com.hp.mypage.model.service.MyPlantService;
import com.hp.mypage.model.vo.MyPlant;

@WebServlet("/myplant/list")
public class MyPlantListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MyPlantService service = new MyPlantService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("findAll 호출됨");
		int page = 1;
		int myplantCount = 0;
		PageInfo pageInfo = null;
		List<MyPlant> list = null;
		Map<String, String> searchMap = new HashMap<>();
		try {
			String searchValue = req.getParameter("searchValue");
			if(searchValue != null && searchValue.length() > 0) {
				String searchType = req.getParameter("searchType");
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {}
		
		myplantCount= service.getMyPlantCount(searchMap);
		System.out.println("맵 :: " +searchMap);
		pageInfo = new PageInfo(page, 10, myplantCount, 10);
//		pageInfo = new PageInfo(page, 4, boardCount, 10); // 페이지(하단 페이지 버튼)가 4개로 보인다.
//		pageInfo = new PageInfo(page, 10, boardCount, 20); // 게시글이 20개로 보인다.
//		list = service.getBoardList(pageInfo);
			
		list = service.getBoardList2(pageInfo);
		System.out.println("불러온 게시글 : " + list.toString());
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/html/6_myPage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

