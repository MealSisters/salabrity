package product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.dto.ProductExt;
import product.model.service.ProductService;

/**
 * Servlet implementation class ProductInfoServlet
 */
@WebServlet("/product/productInfo")
public class ProductInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		// 사용자 입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		//업무 로직
		ProductExt product = productService.findProductByNo(no);
		System.out.println("product.getDelFlag() = " + product.getDelFlag());
		if(product.getDelFlag().equals("Y")) {;
			response.sendRedirect(request.getContextPath() + "/");
		} else {
		System.out.println(product);
		//view단 위임
		request.setAttribute("product", product);
		request.getRequestDispatcher("/WEB-INF/views/product/productInfo.jsp").forward(request, response);}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
