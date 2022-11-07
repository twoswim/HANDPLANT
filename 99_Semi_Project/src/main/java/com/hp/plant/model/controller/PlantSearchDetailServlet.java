package com.hp.plant.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.plant.model.service.PlantSearchDetailService;
import com.hp.plant.model.vo.PlantInfo;

@WebServlet("/html/2_plantSearchDetail")
public class PlantSearchDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private PlantSearchDetailService service = new PlantSearchDetailService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		HttpSession session = req.getSession();
		
//		int info = (int) session.getAttribute("info");
		int info = Integer.parseInt(req.getParameter("info"));
		
		PlantInfo plantInfo = service.detailInfo(info);
		
		if(plantInfo == null) {
			resp.sendRedirect(req.getContextPath() + "/");
			return;
		}
		req.setAttribute("plantInfo", plantInfo);
		req.getRequestDispatcher("/views/html/2_plantSearchDetail.jsp").forward(req, resp);
	}
	
	
//	public static void main(String[] args) {
//		PlantSearchDetailService ps = new PlantSearchDetailService();
//		PlantInfo plantInfo = ps.detailInfo(1);
//		
//		System.out.println(plantInfo.toString());
//	}
}
