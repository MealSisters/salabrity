package buy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/buy/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//배송지처리

		
		//상품주문테이블
		
		
		
		
		
		//결제테이블
		int merchantUid = Integer.parseInt(request.getParameter("merchantUid"));
		String memberId = request.getParameter("memberId");
		String pay_method = request.getParameter("payMethod");
		int amount = Integer.parseInt(request.getParameter("amount")) ;
		String buyerEmail = request.getParameter("buyerEmail");
		String buyerName = request.getParameter("buyerName");
		String buyerTel = request.getParameter("buyerTel");
		String buyerPostcode = request.getParameter("buyerPostcode");
		String buyerAddres = request.getParameter("buyerAddress");
		String buyerAddresDetail = request.getParameter("buyerAddressDetail");
		request.getParameter("paymentDate");
		request.getParameter("buyDate");
		request.getParameter("impUid");
		request.getParameter("impUid");
		request.getParameter("impUid");

	}

}
