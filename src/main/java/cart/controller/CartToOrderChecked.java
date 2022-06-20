package cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.dto.Cart;
import cart.model.service.CartService;
import product.model.dto.ProductExt;
import product.model.service.ProductService;

/**
 * Servlet implementation class CartToOrderChecked
 */
@WebServlet("/order/cart/checkedCartOrder")
public class CartToOrderChecked extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CartService cartService = new CartService();
	ProductService productService = new ProductService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력값 처리
		String checkedCartNoListStr = request.getParameter("checkedCartNoList");
		String getStr[] = checkedCartNoListStr.split(",");
		System.out.println("getStr = "+getStr);
		//업무로직
		List<Cart> cartList = new ArrayList<Cart>();
		List<ProductExt> productList = new ArrayList<ProductExt>();
		
		List<Integer> cartNoList = new ArrayList<Integer>();
		for(int i = 0; i <  getStr.length; i++) {
			int cartNo = Integer.parseInt(getStr[i]);
			Cart cart = cartService.findByCartNo(cartNo);
			ProductExt product = productService.findProductByNo(cart.getProductNo());
		//Cart 리스트에 추가
				cartList.add(cart);
		//Product 리스트에 추가
				productList.add(product);
		}
		
		//Map에 넣기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartList", cartList);
		map.put("productList", productList);
		request.setAttribute("map", map);
		System.out.println(map);
		//포워딩
		request.getRequestDispatcher("/order/order").forward(request, response);
	}

}
