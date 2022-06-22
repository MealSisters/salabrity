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


@WebServlet("/order/cart/shippingDateUpdate")
public class CartShippingDateUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CartService cartService = new CartService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//입력값 처리
			int cartNo = Integer.parseInt(request.getParameter("cartNo"));
			String firstShippingDate = request.getParameter("firstShippingDate");
			
			//업무로직
			Cart cart = new Cart();
			cart.setCartNo(cartNo);
			cart.setFirstShipppingDate(firstShippingDate);
			int result = cartService.firstShippingDateUpdate(cart);
			//값 처리

			PrintWriter out = response.getWriter();
			out.append(result + "");
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

}