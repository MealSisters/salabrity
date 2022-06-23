package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import menu.model.dto.Menu;
import menu.model.service.MenuService;

/**
 * Servlet implementation class MenuNameCheckServlet
 */
@WebServlet("/admin/menuIdCheck")
public class MenuIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService = new MenuService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String inputId = request.getParameter("menuId");

			int idCheck = 0;
			List<Menu> list = menuService.findMenuById(inputId);
			if (!list.isEmpty())
				idCheck = list.size();

			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(idCheck, response.getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
