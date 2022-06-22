package cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.dto.Cart;
import cart.model.service.CartService;

/**
 * Servlet implementation class insertCarts
 */
@WebServlet("/order/cart/insertCarts")
public class CasrtsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService = new CartService();

	@Override

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			response.setContentType("text/plain; charset=utf-8");
			String[] quantityStrArr = request.getParameterValues("quantity");
			String[] productNoStrArr = request.getParameterValues("productNo");
			String memberId = request.getParameter("memberId");
			String firstShippingDate = (String) request.getParameter("firstShippingDate");
			int result = 0;
			if(quantityStrArr.length == productNoStrArr .length) {
			for(int i = 0; i < quantityStrArr.length; i++) {
				int quantity = Integer.parseInt(quantityStrArr[i]);
				int productNo = Integer.parseInt(productNoStrArr[i]);
				Cart cart = new Cart(memberId, productNo, quantity, firstShippingDate);
				result = cartService.cartInsert(cart);
			}

			String msg = result == 0 ? "이미 장바구니에 있는 상품입니다." : "장바구니에 추가되었습니다.";
			HttpSession session = request.getSession();
			session.setAttribute("addCartSuccessMsg",msg);
			response.sendRedirect("/salabrity/mypage/orderList");
			}
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

}
