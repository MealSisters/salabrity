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
import menu.model.dto.MenuAttach;
import menu.model.service.MenuService;
import product.model.dto.ProductAttach;
import product.model.dto.ProductExt;
import product.model.dto.ProductMenu;
import product.model.dto.ProductTarget;
import product.model.dto.Thumbnail;
import product.model.service.ProductService;

/**
 * Servlet implementation class AdminProductUpdateServlet
 */
@WebServlet("/admin/productUpdate")
public class AdminProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MenuService menuService = new MenuService();
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int productNo = Integer.parseInt(request.getParameter("productNo"));

			List<Menu> menuList = menuService.findAllMenu();
			ProductExt product = productService.findProductByNo(productNo);
			
			System.out.println();

			request.setAttribute("menuList", menuList);
			request.setAttribute("product", product);
			request.getRequestDispatcher("/WEB-INF/views/admin/productUpdate.jsp").forward(request, response);
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

			int originalThumbnailNo = Integer.parseInt(multiReq.getParameter("originalThumbnail"));
			int originalDetail1No = Integer.parseInt(multiReq.getParameter("originalDetail1"));
			int originalDetail2No = 0;
			if (multiReq.getParameter("originalDetail2") != null) {
				originalDetail2No = Integer.parseInt(multiReq.getParameter("originalDetail2"));
			}

			boolean delFileflag = Boolean.parseBoolean(multiReq.getParameter("delFileflag"));

			int productNo = Integer.parseInt(multiReq.getParameter("productNo"));
			String productName = multiReq.getParameter("productName");
			String productDescription = multiReq.getParameter("productDescription");
			ProductTarget productTarget = ProductTarget.valueOf(multiReq.getParameter("productTarget"));
			int subscriptionPeriod = Integer.parseInt(multiReq.getParameter("subscriptionPeriod"));
			String[] arrMenuNo = multiReq.getParameterValues("menuNo");

			ProductExt product = new ProductExt();
			product.setProductNo(productNo);
			product.setProductName(productName);
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
				pm.setProductNo(productNo);
				pm.setMenuNo(Integer.parseInt(arrMenuNo[i]));
				pmList.add(pm);
			}
			product.setMenus(pmList);

			int result = productService.updateProduct(product);

			if (thumbnail != null) {
				result = deleteAttach(saveDirectory, originalThumbnailNo);
			}
			if (detailimg1 != null) {
				result = deleteAttach(saveDirectory, originalDetail1No);
			}
			if (detailimg2 != null || delFileflag != false) { // 테이블만 지워짐
				if (originalDetail2No != 0)
					result = deleteAttach(saveDirectory, originalDetail2No);
			}

			response.sendRedirect(request.getContextPath() + "/product/productList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	private int deleteAttach(String saveDirectory, int productAttachNo) {
		int result = 0;
		ProductAttach attach = productService.findAttachByNo(productAttachNo);
		File delFile = new File(saveDirectory, attach.getRenamedFileName());
		if (delFile.exists())
			delFile.delete();
		result = productService.deleteProductAttach(productAttachNo);
		return result;
	}

	private ProductAttach getAttachment(MultipartRequest multiReq, String name, Thumbnail thumbnail) {
		ProductAttach attach = new ProductAttach();
		String originalFilename = multiReq.getOriginalFileName(name);
		String renamedFilename = multiReq.getFilesystemName(name);

		attach.setProductNo(Integer.parseInt(multiReq.getParameter("productNo")));
		attach.setOriginalFileName(originalFilename);
		attach.setRenamedFileName(renamedFilename);
		attach.setThumbnail(thumbnail);
		return attach;
	}

}
