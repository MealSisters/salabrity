package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import product.model.dto.ProductAttach;
import product.model.dto.ProductExt;
import product.model.dto.ProductMenu;
import product.model.dto.ProductTarget;
import product.model.dto.Thumbnail;
import product.model.service.ProductService;

/**
 * Servlet implementation class AdminProductEnrollServlet
 */
@WebServlet("/admin/productEnroll")
public class AdminProductEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService = new MenuService();
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Menu> menuList = menuService.findAllMenu();

			request.setAttribute("menuList", menuList);
			request.getRequestDispatcher("/WEB-INF/views/admin/productEnroll.jsp").forward(request, response);
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
			String saveDirectory = getServletContext().getRealPath("/upload/product");
			int maxPostSize = 1024 * 1024 * 10; // 첨부파일 크기 최대 10MB
			String encoding = "utf-8";
			FileRenamePolicy policy = new SalabrityFileRenamePolicy();
			MultipartRequest multiReq = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			String productId = multiReq.getParameter("productId");
			String productName = multiReq.getParameter("productName");
			int productPrice = Integer.parseInt(multiReq.getParameter("productPrice"));
			String productDescription = multiReq.getParameter("productDescription");
			ProductTarget productTarget = ProductTarget.valueOf(multiReq.getParameter("productTarget"));
			int subscriptionPeriod = Integer.parseInt(multiReq.getParameter("subscriptionPeriod"));
			String[] arrMenuNo = multiReq.getParameterValues("menuNo");

			ProductExt product = new ProductExt();
			product.setProductId(productId);
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			product.setProductdescription(productDescription);
			product.setProductTarget(productTarget);
			product.setSubscriptionPeriod(subscriptionPeriod);

			File thumbnail = multiReq.getFile("thumbnail");
			File detailimg1 = multiReq.getFile("detailimg1");
			File detailimg2 = multiReq.getFile("detailimg2");
			List<ProductAttach> attachs = new ArrayList<>();
			// 썸네일
			if (thumbnail != null) {
				attachs.add(getAttachment(multiReq, "thumbnail", Thumbnail.Y));
			}
			// 상세이미지
			if (detailimg1 != null || detailimg2 != null) {
				if (detailimg1 != null)
					attachs.add(getAttachment(multiReq, "detailimg1", Thumbnail.N1));
				if (detailimg2 != null)
					attachs.add(getAttachment(multiReq, "detailimg2", Thumbnail.N2));
			}
			product.setAttachs(attachs);

			List<ProductMenu> pmList = new ArrayList<>();
			for (int i = 0; i < arrMenuNo.length; i++) {
				ProductMenu pm = new ProductMenu();
				pm.setMenuNo(Integer.parseInt(arrMenuNo[i]));
				pmList.add(pm);
			}
			product.setMenus(pmList);

			int result = productService.insertProduct(product);

			response.sendRedirect(request.getContextPath() + "/product/productList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	private ProductAttach getAttachment(MultipartRequest multiReq, String name, Thumbnail thumbnail) {
		ProductAttach attach = new ProductAttach();
		String originalFilename = multiReq.getOriginalFileName(name);
		String renamedFilename = multiReq.getFilesystemName(name);

		attach.setOriginalFileName(originalFilename);
		attach.setRenamedFileName(renamedFilename);
		attach.setThumbnail(thumbnail);
		return attach;
	}

}
