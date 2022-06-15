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

import common.utill.PageBar;
import menu.model.dto.Menu;
import menu.model.service.MenuService;

/**
 * Servlet implementation class AdminMenuListServlet
 */
@WebServlet("/admin/menuList")
public class AdminMenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService = new MenuService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 페이징 처리
			int numPerPage = MenuService.MENU_NUM_PER_PAGE;
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
		
			String menuId = request.getParameter("menuId");
			String menuName = request.getParameter("menuName");
			
			String sortBy = request.getParameter("sortBy");
			
			Map<String, Object> searchParam = new HashMap<>();
			if (menuId != null)
				searchParam.put("menuId", menuId);
			if (menuName != null)
				searchParam.put("menuName", menuName);
			
			int totalMenu = 0;
			if (!searchParam.isEmpty()) {
				param.put("searchParam", searchParam);
				totalMenu = menuService.getTotalFilteredMenu(searchParam);
			} else {
				totalMenu = menuService.getTotalMenu();				
			}

			// 업무로직
			List<Menu> list = null;
			if (sortBy != null) {
				param.put("sortBy", sortBy);
				list = menuService.findSortedAllMenu(param);
			} else {
				list = menuService.findTopNAllMenu(param);
			}

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
			request.setAttribute("searchParam", searchParam);
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
