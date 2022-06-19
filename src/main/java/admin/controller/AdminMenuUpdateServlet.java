package admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import common.SalabrityFileRenamePolicy;
import menu.model.dto.MenuAttach;
import menu.model.dto.MenuExt;
import menu.model.service.MenuService;

/**
 * Servlet implementation class AdminMenuUpdateServlet
 */
@WebServlet("/admin/menuUpdate")
public class AdminMenuUpdateServlet extends HttpServlet {
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
			request.getRequestDispatcher("/WEB-INF/views/admin/menuUpdate.jsp").forward(request, response);
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
			String saveDirectory = getServletContext().getRealPath("/upload/menu");
			int maxPostSize = 1024 * 1024 * 10; // 메뉴 썸네일은 최대 10MB
			String encoding = "utf-8";
			FileRenamePolicy policy = new SalabrityFileRenamePolicy();
			MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			int menuNo = Integer.parseInt(multiReq.getParameter("menuNo"));
			String menuId = multiReq.getParameter("menuId");
			String menuName = multiReq.getParameter("menuName");
			String menuDescription = multiReq.getParameter("menuDescription");
			String ingredients = multiReq.getParameter("ingredients");
			int calorie = Integer.parseInt(multiReq.getParameter("calorie"));
			int originAttachNo = Integer.parseInt(multiReq.getParameter("originAttachNo"));

			MenuExt menu = new MenuExt();
			menu.setMenuNo(menuNo);
			menu.setMenuId(menuId);
			menu.setMenuName(menuName);
			menu.setMenuDescription(menuDescription);
			menu.setIngredients(ingredients);
			menu.setCalorie(calorie);
			File file = multiReq.getFile("menuAttach");

			if (file != null) {
				MenuAttach attach = new MenuAttach();
				String originalFilename = multiReq.getOriginalFileName("menuAttach"); // 업로드한 파일명
				String renamedFilename = multiReq.getFilesystemName("menuAttach"); // 저장된 파일명

				attach.setMenuNo(menuNo);
				attach.setOriginalFileName(originalFilename);
				attach.setRenamedFileName(renamedFilename);
				menu.setMenuAttach(attach);
			}
			int result = menuService.updateMenu(menu);

			// 신규 파일 존재하면 기존파일 삭제
			if (file != null) {
				MenuAttach attach = menuService.findAttachByNo(originAttachNo);
				File delFile = new File(saveDirectory, attach.getRenamedFileName());
				if (delFile.exists())
					delFile.delete();
				result = menuService.deleteMenuAttach(originAttachNo);
			}
			response.sendRedirect(request.getContextPath() + "/admin/menuList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
