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

import com.hp.board.model.service.BoardService;
import com.hp.board.model.vo.Board;
import com.hp.common.util.PageInfo;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService service = new BoardService();

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
			System.out.println("page : " + page);
		} catch (Exception e) {
		}

		boardCount = service.getBoardCount(searchMap);
		System.out.println("맵 :: " + searchMap);
		pageInfo = new PageInfo(page, 10, boardCount, 10);
//		pageInfo = new PageInfo(page, 4, boardCount, 10); // 페이지(하단 페이지 버튼)가 4개로 보인다.
//		pageInfo = new PageInfo(page, 10, boardCount, 20); // 게시글이 20개로 보인다.
//		HttpSession session=req.getSession();
//		if((String)req.getAttribute("cate") != null && session.getAttribute("cate").equals("notice")) {
//			
//			list = service.getBoardNoList(pageInfo, searchMap);
//		}
		list = service.getBoardList(pageInfo, searchMap);

//		list = service.getBoardList(pageInfo);
		System.out.println("불러온 게시글 : " + list.toString());

		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/html/3_boardList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
