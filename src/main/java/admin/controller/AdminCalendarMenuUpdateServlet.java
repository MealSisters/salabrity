package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.model.dto.Calendar;
import calendar.model.dto.WeekDayCode;
import calendar.model.service.CalendarService;
import menu.model.dto.MenuExt;
import menu.model.service.MenuService;
import product.model.dto.ProductExt;
import product.model.dto.ProductMenu;
import product.model.service.ProductService;

/**
 * Servlet implementation class AdminCalendarMenuUpdateServlet
 */
@WebServlet("/admin/calendarMenuUpdate")
public class AdminCalendarMenuUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	private MenuService menuService = new MenuService();
	private CalendarService calendarService = new CalendarService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			WeekDayCode dataDate = WeekDayCode.valueOf(request.getParameter("dataDate"));

			ProductExt product = productService.findProductByNo(productNo);
			List<ProductMenu> menus = product.getMenus();
			List<MenuExt> canSelectMenus = new ArrayList<>();
			for(ProductMenu menu : menus) {
				MenuExt canSelect = menuService.findByMenuNo(menu.getMenuNo());
				canSelectMenus.add(canSelect);
			}
			Calendar calendar = calendarService.findCalByProductNoAndwdCode(productNo, dataDate);
			
			request.setAttribute("menuList", canSelectMenus);
			request.setAttribute("calendar", calendar);
			request.setAttribute("product", product);
			request.getRequestDispatcher("/WEB-INF/views/admin/adminCalendarMenuUpdate.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int calNo = Integer.parseInt(request.getParameter("calNo"));
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			int menuNo = Integer.parseInt(request.getParameter("menuNo"));
			
			Calendar calendar = new Calendar();
			calendar.setCalNo(calNo);
			calendar.setMenuNo(menuNo);
			
			int result = calendarService.updateCalendar(calendar);
			
			response.sendRedirect(request.getContextPath() + "/calendar?productNo=" + productNo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
