package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SalesTrendServlet
 */
@WebServlet("/admin/salesTrend")
public class SalesTrendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자입력값 처리
		// 업무로직
		
		// view단처리
		request.getRequestDispatcher("/WEB-INF/views/admin/adminSalesTrend.jsp").forward(request, response);
	}

}
