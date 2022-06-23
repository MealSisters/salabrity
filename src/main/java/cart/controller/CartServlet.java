package cart.controller;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.dto.Cart;
import cart.model.service.CartService;
import common.utill.Methods;
import member.model.dto.Member;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/order/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CartService cartService = new CartService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();
			Member loginMember = (Member) session.getAttribute("loginMember");
			String memberId = loginMember.getMemberId();
			
			Map<String, Object> map = cartService.findByIdCart(memberId);
			String defaultDate = new Methods().getDefaultFilstShippingDate();
			List<Cart> cartList = (List<Cart>) map.get("cartList");
			for(Cart cart : cartList) {
				if(cart.getFirstShipppingDate().compareTo(defaultDate) < 0) {
					cart.setFirstShipppingDate(defaultDate);
					cartService.firstShippingDateUpdate(cart);
				}
			}
			request.setAttribute("map", map);
			request.getRequestDispatcher("/WEB-INF/views/order/cart.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

}
