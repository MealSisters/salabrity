package admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.dto.SalesTrend;
import admin.model.service.AdminService;

/**
 * Servlet implementation class SalesTrendServlet
 */
@WebServlet("/admin/salesTrend")
public class SalesTrendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자입력값 처리
		// 업무로직
		long miliseconds = System.currentTimeMillis();
        Date endDate = new Date(miliseconds);
		Date startDate = new Date(miliseconds - (1000 * 60 * 60 * 24 * 6));
		Map<String, Date> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		
		List<SalesTrend> totalSalesData = adminService.findSalesTrend(param);
		System.out.println("totalSalesData@servlet = " + totalSalesData);
		
		// view단처리
		request.setAttribute("period", param);
		request.setAttribute("salesData", totalSalesData);
		request.getRequestDispatcher("/WEB-INF/views/admin/adminSalesTrend.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Date startDate = null;
		Date endDate = null;
		if(!request.getParameter("startDate").equals("")) {
			startDate = Date.valueOf(request.getParameter("startDate"));
		}
		if(!request.getParameter("endDate").equals("")) {
			endDate = Date.valueOf(request.getParameter("endDate"));
		}
		Map<String, Date> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		List<SalesTrend> totalSalesData = adminService.findSalesTrend(param);
		System.out.println("totalSalesData@doPost = " + totalSalesData);
		
		System.out.println("startDate@doPost = " + startDate);
		System.out.println("endDate@doPost = " + endDate);
		
		request.setAttribute("period", param);
		request.setAttribute("salesData", totalSalesData);
		request.getRequestDispatcher("/WEB-INF/views/admin/adminSalesTrend.jsp").forward(request, response);
	}

}
