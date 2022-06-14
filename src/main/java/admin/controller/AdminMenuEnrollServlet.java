package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.SalabrityFileRenamePolicy;
import menu.model.dto.MenuExt;

/**
 * Servlet implementation class adminMenuEnrollServlet
 */
@WebServlet("/admin/menuEnroll")
public class AdminMenuEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/admin/menuEnroll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = getServletContext().getRealPath("/images/menu");
		int maxPostSize = 1024 * 1024; // 메뉴 썸네일은 최대 1MB
		String encoding = "utf-8";
		FileRenamePolicy policy = new SalabrityFileRenamePolicy();
		MultipartRequest multiReq = 
				new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		String menuId = multiReq.getParameter("menuId");
		String menuName = multiReq.getParameter("menuName");
		String menuDescription = multiReq.getParameter("menuDescription");
		String ingredients = multiReq.getParameter("ingredients");
		int calorie = Integer.parseInt(multiReq.getParameter("calorie"));
		
		MenuExt menu = new MenuExt();
		menu.setMenuId(menuId);
		menu.setMenuName(menuName);
		menu.setMenuDescription(menuDescription);
		menu.setIngredients(ingredients);
		menu.setCalorie(calorie);
//		File file = multiReq.getFile(ingredients);
		
		
		doGet(request, response);
	}

}
