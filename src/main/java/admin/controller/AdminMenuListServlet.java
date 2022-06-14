package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import common.utill.PageBar;
import menu.model.dto.Menu;

/**
 * Servlet implementation class AdminMenuListServlet
 */
@WebServlet("/admin/menuList")
public class AdminMenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 페이징 처리
			int numPerPage = AdminService.MENU_NUM_PER_PAGE;
			int cPage = 1;
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
				// 예외발생시 현재페이지는 1로 처리
			}
			Map<String, Object> param = new HashMap<>();
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			param.put("start", start);
			param.put("end", end);

			String sortBy = request.getParameter("sortBy");

			// 업무로직
			int totalMenu = 0;
			List<Menu> list = null;
			if (sortBy != null) {
				param.put("sortBy", sortBy);
				list = adminService.findSortedAllMenu(param);
			} else {
				list = adminService.findAllMenu(param);
			}
			totalMenu = adminService.getTotalMenu();

			String url = request.getRequestURI();
			String pagebar = "";
			if (sortBy != null) {
				pagebar = PageBar.getMultiParamPagebar(cPage, numPerPage, totalMenu, url + "?sortBy=" + sortBy);
			} else {
				pagebar = PageBar.getPagebar(cPage, numPerPage, totalMenu, url);
			}

			// view단처리
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request.setAttribute("sortBy", sortBy);
			request.getRequestDispatcher("/WEB-INF/views/admin/menuList.jsp").forward(request, response);
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
