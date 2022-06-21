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
		try {
			long miliseconds = System.currentTimeMillis();
			Date endDate = new Date(miliseconds);
			Date startDate = new Date(miliseconds - (1000 * 60 * 60 * 24 * 6));
			Map<String, Date> param = new HashMap<>();
			param.put("startDate", startDate);
			param.put("endDate", endDate);

			// 라인차트
			List<SalesTrend> totalSalesData = adminService.findSalesTrend(param);
			// System.out.println("totalSalesData@servlet = " + totalSalesData);

			// 파이차트
			Map<String, Date> pieParam = new HashMap<>();
			pieParam.put("startDate", startDate);
			pieParam.put("endDate", endDate);
			List<SalesTrend> topSalesData = adminService.findTopSalesTrend(pieParam);

			// view단처리
			request.setAttribute("period", param);
			request.setAttribute("piePeriod", pieParam);
			request.setAttribute("salesData", totalSalesData);
			request.setAttribute("topSalesData", topSalesData);
			request.getRequestDispatcher("/WEB-INF/views/admin/adminSalesTrend.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			Date startDate = null;
			Date endDate = null;
			if (!request.getParameter("startDate").equals("")) {
				startDate = Date.valueOf(request.getParameter("startDate"));
			}
			if (!request.getParameter("endDate").equals("")) {
				endDate = Date.valueOf(request.getParameter("endDate"));
			}
			Map<String, Date> param = new HashMap<>();
			param.put("startDate", startDate);
			param.put("endDate", endDate);
			List<SalesTrend> totalSalesData = adminService.findSalesTrend(param);

			Date pieStartDate = null;
			Date pieEndDate = null;
			if(!request.getParameter("topProductStart").equals("")) {
				pieStartDate = Date.valueOf(request.getParameter("topProductStart"));
			}
			if(!request.getParameter("topProductEnd").equals("")) {
				pieEndDate = Date.valueOf(request.getParameter("topProductEnd"));
			}
			Map<String, Date> pieParam = new HashMap<>();
			pieParam.put("startDate", pieStartDate);
			pieParam.put("endDate", pieEndDate);
			List<SalesTrend> topSalesData = adminService.findTopSalesTrend(pieParam);

			request.setAttribute("period", param);
			request.setAttribute("piePeriod", pieParam);
			request.setAttribute("salesData", totalSalesData);
			request.setAttribute("topSalesData", topSalesData);
			request.getRequestDispatcher("/WEB-INF/views/admin/adminSalesTrend.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
