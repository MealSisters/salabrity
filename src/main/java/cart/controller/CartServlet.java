package cart.controller;
//ㅇㅇㅇ22
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
			// 업무로직
			HttpSession session = request.getSession();
			Member loginMember = (Member) session.getAttribute("loginMember");
			String memberId = loginMember.getMemberId();
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			cal.setTime(new Date());
			cal.add(Calendar.DATE, 3);
			if(cal.get(Calendar.DAY_OF_WEEK) == 1){
				cal.add(Calendar.DATE, 1);
			} else if(cal.get(Calendar.DAY_OF_WEEK) == 7){
				cal.add(Calendar.DATE, 2);
			}
			Date date = cal.getTime();
			String defaultDate = sdf.format(date);
			//아이디로 장바구니 조회
			Map<String, Object> map = cartService.findByIdCart(memberId);
			//날짜 비교 후 업데이트
			List<Cart> cartList = (List<Cart>) map.get("cartList");
			for(Cart cart : cartList) {
				if(cart.getFirstShipppingDate().compareTo(defaultDate) < 0) {
					cart.setFirstShipppingDate(defaultDate);
					int updateResult = cartService.firstShippingDateUpdate(cart);
					System.out.println("updateResult" + updateResult);
				}
				
			}
			// view단 처리
			request.setAttribute("map", map);
			request.getRequestDispatcher("/WEB-INF/views/order/cart.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	
	}

}
