package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import menu.model.dto.MenuAttach;
import menu.model.service.MenuService;

/**
 * Servlet implementation class AdminMenuDeleteServlet
 */
@WebServlet("/admin/menuDelete")
public class AdminMenuDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService = new MenuService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int menuNo = Integer.parseInt(request.getParameter("delMenuNo"));
			
			String saveDirectory = getServletContext().getRealPath("/images/menu");
			MenuAttach attach = menuService.findAttachByMenuNo(menuNo);
			File delFile = new File(saveDirectory, attach.getRenamedFileName());
			if (delFile.exists()) {
				delFile.delete();
			}
			
			int result = menuService.deleteMenu(menuNo);
			
			response.sendRedirect(request.getContextPath() + "/admin/menuList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
