package cart.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.service.CartService;
import member.model.dto.Member;

/**
 * Servlet implementation class CartToOrderAll
 */
@WebServlet("/order/cartOrder")
public class CartToOrderAll extends HttpServlet {
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

			Map<String, Object> orderMap = cartService.findByIdCart(memberId);
			session.setAttribute("orderMap", orderMap);
			request.getRequestDispatcher("/order/order").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	}

}
