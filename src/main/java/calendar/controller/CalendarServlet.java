package calendar.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.model.dto.CalendarExt;
import calendar.model.service.CalendarService;
import product.model.dto.ProductExt;
import product.model.service.ProductService;

/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/calendar")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CalendarService calendarService = new CalendarService();
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<CalendarExt> calList = calendarService.findRecentProductCal();

//			List<ProductExt> productAll = productService.findProductsAll();
			ProductExt recentProduct = null;
//			if(productAll != null && !productAll.isEmpty())
//				recentProduct = productAll.get(0);
			
			ProductExt productHere = null;
			Map<String, CalendarExt> calMap = new HashMap<>();
			if (calList != null && !calList.isEmpty()) {
				productHere = productService.findProductByNo(calList.get(0).getProductNo());
				for(CalendarExt cal : calList) {
					calMap.put(cal.getWeekDayCode().toString(), cal);
				}
			}
			System.out.println("calMap = " + calMap);

			request.setAttribute("productHere", productHere);
			request.setAttribute("recentProduct", recentProduct);
//			request.setAttribute("productList", productAll);			
			request.setAttribute("calMap", calMap);
			request.getRequestDispatcher("/WEB-INF/views/calendar/calendar.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
