package admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
 * Servlet implementation class AdminDashboardServlet
 */
@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* ------------------------------------------ 최근 sales추이 데이터 ------------------------------------------ */
		int MIN_PERIOD = AdminService.CHART_MIN_PERIOD;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long miliseconds = System.currentTimeMillis();
        Date endDate = new Date(miliseconds);
		Date startDate = new Date(miliseconds - (1000 * 60 * 60 * 24 * 6));
		Map<String, Date> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		List<SalesTrend> totalSalesData = adminService.findSalesTrend(param);
		int[] salesArr = new int[MIN_PERIOD];
		String[] dateArr = new String[MIN_PERIOD];
		
		long initialDate = endDate.getTime();
		if(totalSalesData != null && !totalSalesData.isEmpty()) {
			for(int i = salesArr.length -1 ; i >= 0; i--){
				Date dateHere = new Date(initialDate);
				String sdfHere = sdf.format(dateHere);
				dateArr[i] = sdfHere;
				for(int j = 0; j < totalSalesData.size(); j ++){
					String compareDate = sdf.format(totalSalesData.get(j).getSalesDate());
					if(compareDate.compareTo(sdfHere) == 0) {
						salesArr[i] = totalSalesData.get(j).getAmount();
					}
				}
				initialDate -= (24 * 60 * 60 * 1000);
			}
		} else {
			Long today = endDate.getTime();
			for (int i = dateArr.length - 1 ; i >= 0; i--) {
				Date dateHere = new Date(today);
				String sdfHere = sdf.format(dateHere);
				dateArr[i] = sdfHere;
				today -= (24 * 60 * 60 * 1000);
			}
		}
		
		String salesData = "['";
		for (int i = 0; i < salesArr.length; i++) {
			if( i != salesArr.length - 1){
				salesData += salesArr[i] + "', '";
			} else {
				salesData += salesArr[i] + "']";
			}
		}
		
		/* ------------------------------------------ 최근 member추이 데이터 ------------------------------------------ */
		List<Map<Date, Integer>> enrollMemberList = adminService.getEnrollMemberByPeriod(param);
		Integer[] enrollMemberCount = new Integer[MIN_PERIOD];
		
		for(int i = 0 ; i < MIN_PERIOD ; i++) {
			for(Map<Date,Integer> map : enrollMemberList) {
				if(map.containsKey(Date.valueOf(dateArr[i]))) {
					enrollMemberCount[i] = map.get(Date.valueOf(dateArr[i]));
				}
			}
			System.out.println();
		}
		
		for(int i = 0 ; i < MIN_PERIOD ; i++) {
			if(enrollMemberCount[i] == null) enrollMemberCount[i] = 0;
		}
		
		
		/* ---------------------------------------------- today 데이터 --------------------------------------------- */
		Map<String, Object> todayDataMap = new HashMap<>();
		int todayPosting = adminService.getTodayPosting(); 
		int todaySales = salesArr[MIN_PERIOD-1];
		int todayMember = enrollMemberCount[MIN_PERIOD-1];
		
		
		todayDataMap.put("posting", todayPosting);
		todayDataMap.put("sales", todaySales);
		todayDataMap.put("member", todayMember);
		
		
		/* ---------------------------------------------- view단 처리 ---------------------------------------------- */
		request.setAttribute("todayDataMap", todayDataMap);
		request.setAttribute("memberData", enrollMemberCount);
		request.setAttribute("salesTrendData", salesData);
		request.getRequestDispatcher("/WEB-INF/views/admin/adminDashboard.jsp").forward(request, response);
	}

}
