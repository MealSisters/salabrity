package admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;

/**
 * Servlet implementation class AdminMemberChartServlet
 */
@WebServlet("/admin/memberChart")
public class AdminMemberChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String daysVal = request.getParameter("days");

		String[] week = daysVal.split(",");
		List<Integer> dataList = new ArrayList<>();  
		int result = 0;
		for(int i = 0; i < week.length ; i++) {
			result = adminService.getEnrollMemberByDate(Date.valueOf(week[i]));
			System.out.println(week[i] + "의 result = " + result);
			dataList.add(result);
		}
		

		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(dataList, response.getWriter());
	}

}
