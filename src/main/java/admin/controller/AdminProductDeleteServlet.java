package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;

/**
 * Servlet implementation class AdminProductDeleteServlet
 */
@WebServlet("/admin/productDelete")
public class AdminProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int productNo = Integer.parseInt(request.getParameter("delProductNo"));
			//System.out.println("productNo@servlet = " + productNo);
			
			// ProductAttach남기기
			// Product del_flag 변경 -> 트리거로 ProductMenu 레코드 삭제
			int result = productService.deleteProduct(productNo);
			
			response.sendRedirect(request.getContextPath() + "/product/productList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
