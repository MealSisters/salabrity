package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.dto.Cart;
import cart.model.service.CartService;

/**
 * Servlet implementation class CartInsertServlet
 */
@WebServlet("/order/cart/insertCart")
public class CartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			response.setContentType("text/plain; charset=utf-8");
			String memberId = (String) request.getParameter("memberId");
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String firstShippingDate = (String) request.getParameter("firstShippingDate");
			Cart cart = new Cart(memberId, productNo, quantity, firstShippingDate);
			int result = cartService.cartInsert(cart);
			String msg = result == 0 ? "이미 장바구니에 있는 상품입니다." : "장바구니에 추가되었습니다.";
			PrintWriter out = response.getWriter();
			out.append(msg);
		}  catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}

