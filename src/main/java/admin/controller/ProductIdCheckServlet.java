package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import product.model.dto.Product;
import product.model.service.ProductService;

/**
 * Servlet implementation class ProductIdCheckServlet
 */
@WebServlet("/admin/productIdCheck")
public class ProductIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String inputId = request.getParameter("productId");

			int idCheck = 0;
			List<Product> list = productService.findProductById(inputId);
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
