package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.model.dto.Calendar;
import calendar.model.dto.WeekDayCode;
import calendar.model.service.CalendarService;

/**
 * Servlet implementation class AdminCalendarMenuDeleteServlet
 */
@WebServlet("/admin/calendarMenuDelete")
public class AdminCalendarMenuDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CalendarService calendarService = new CalendarService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int productNo = Integer.parseInt(request.getParameter("delProductNo"));
			WeekDayCode dataDate = WeekDayCode.valueOf(request.getParameter("delWeekDayCode"));
			System.out.println("productNo@doPost = " + productNo);
			System.out.println("dataDate@doPost = " + dataDate);

			Calendar cal = new Calendar();
			cal.setProductNo(productNo);
			cal.setWeekDayCode(dataDate);

			int result = calendarService.deleteCalendar(cal);

			response.sendRedirect(request.getContextPath() + "/calendar?productNo=" + productNo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
