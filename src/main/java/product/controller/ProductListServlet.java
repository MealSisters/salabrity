package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.dto.ProductExt;
import product.model.service.ProductService;


@WebServlet("/product/productList")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List <ProductExt> list = productService.findAllProduct();
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/product/productList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

}
