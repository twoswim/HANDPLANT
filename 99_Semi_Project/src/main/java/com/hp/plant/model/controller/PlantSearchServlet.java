package com.hp.plant.model.controller;

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
import com.hp.plant.model.service.PlantSearchDetailService;
import com.hp.plant.model.vo.PlantInfo;

@WebServlet("/plant/list")
public class PlantSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PlantSearchDetailService service = new PlantSearchDetailService();
	PlantController pc = new PlantController();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("selectAll 호출");
		
		int page = 1;
		int plantCount = 0;
		PageInfo pageInfo = null;
		List<PlantInfo> list = null;
		
		Map<String, String> searchMap = new HashMap<>();
		
		try {
			String searchValue = req.getParameter("searchValue");
			if(searchValue != null && searchValue.length() > 0) {
				String searchType = req.getParameter("searchType");
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
//			e.printStackTrace();			
		}
		
		plantCount = service.getPlantCount(searchMap);
		System.out.println("plantcount : " + plantCount);
		pageInfo = new PageInfo(page, 10, plantCount, 16);
		list = service.getPlantInfoList(pageInfo, searchMap);
		
//		list = pc.initPlant();
		System.out.println("식물리스트 : " + list.toString());
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/html/2_plantSearch.jsp").forward(req, resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
