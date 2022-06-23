package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.model.dto.Cart;
import cart.model.service.CartService;

/**
 * Servlet implementation class CartQuantityUpdateServlet
 */
@WebServlet("/order/cart/quantityUpdate")
public class CartQuantityUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CartService cartService = new CartService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int cartNo = Integer.parseInt(request.getParameter("cartNo"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));

			Cart cart = new Cart();
			cart.setCartNo(cartNo);
			cart.setQuantity(quantity);
			int result = cartService.cartQuantityUpdate(cart);

			PrintWriter out = response.getWriter();
			out.append(result + "");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		
	}

}
