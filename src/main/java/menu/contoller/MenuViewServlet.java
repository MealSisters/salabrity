package menu.contoller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.model.dto.MenuExt;
import menu.model.service.MenuService;

/**
 * Servlet implementation class MenuViewServlet
 */
@WebServlet("/menu/menuInfo")
public class MenuViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService = new MenuService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int menuNo = Integer.parseInt(request.getParameter("menuNo"));
			MenuExt menu = menuService.findByMenuNo(menuNo);
			

			request.setAttribute("menu", menu);
			request.getRequestDispatcher("/WEB-INF/views/menu/menuInfo.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
