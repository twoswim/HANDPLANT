package com.hp.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.board.model.service.BoardCateService;
import com.hp.board.model.vo.Board;
import com.hp.common.util.PageInfo;

@WebServlet("/board/listPar")
public class BoardListServlet_Par extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardCateService service = new BoardCateService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("findAll 호출됨");
		int page = 1;
		int boardCount = 0;
		PageInfo pageInfo = null;
		List<Board> list = null;
		Map<String, String> searchMap = new HashMap<>();

		try {
			String searchValue = req.getParameter("searchValue");
			if (searchValue != null && searchValue.length() > 0) {
				String searchType = req.getParameter("searchType");
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {}

		boardCount = service.getBoardParCount(searchMap);
		System.out.println("맵 :: " + searchMap);
		pageInfo = new PageInfo(page, 10, boardCount, 10);
//		pageInfo = new PageInfo(page, 4, boardCount, 10); // 페이지(하단 페이지 버튼)가 4개로 보인다.
//		pageInfo = new PageInfo(page, 10, boardCount, 20); // 게시글이 20개로 보인다.
		list = service.getBoardParList(pageInfo, searchMap);

//		list = service.getBoardList(pageInfo);
		System.out.println("불러온 게시글 : " + list.toString());

		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/html/3_boardList_Par.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
