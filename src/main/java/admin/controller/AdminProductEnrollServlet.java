package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.SalabrityFileRenamePolicy;
import menu.model.dto.Menu;
import menu.model.service.MenuService;

/**
 * Servlet implementation class AdminProductEnrollServlet
 */
@WebServlet("/admin/productEnroll")
public class AdminProductEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService = new MenuService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Menu> menuList = menuService.findAllMenu();

		request.setAttribute("menuList", menuList);
		request.getRequestDispatcher("/WEB-INF/views/admin/productEnroll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String saveDirectory = getServletContext().getRealPath("/images/product");
			int maxPostSize = 1024 * 1024 * 10; // 메뉴 썸네일은 최대 10MB
			String encoding = "utf-8";
			FileRenamePolicy policy = new SalabrityFileRenamePolicy();
			MultipartRequest multiReq = 
					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
