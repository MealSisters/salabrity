package buy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import buy.model.dto.ProductBuy;

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
		// 전달받은 값 처리
		String merchantUid = request.getParameter("merchantUid");
		String memberId = request.getParameter("memberId");
		String payMethod = request.getParameter("payMethod");
		int amount = Integer.parseInt(request.getParameter("amount")) ;
		String buyerEmail = request.getParameter("buyerEmail");
		String buyerName = request.getParameter("buyerName");
		String buyerTel = request.getParameter("buyerTel");
		String buyerAddres = request.getParameter("buyerAddress");
		String buyerPostcode = request.getParameter("buyerPostcode");
		String buyerAddresDetail = request.getParameter("buyerAddressDetail");
		int paySec = Integer.parseInt(request.getParameter("paySec"));
		String impUid = request.getParameter("impUid");
		String payStatement = request.getParameter("payStatement");
		String requestTerm = request.getParameter("requestTerm");
		
		String shippingOpt = request.getParameter("shippingOpt");
		String shippingAddrInput = request.getParameter("shippingAddrInput");
		String shippingAddrDetailInput = request.getParameter("shippingAddrDetailInput");
		
//		String pbList = request.getParameter("productArr");
//		System.out.println("pbList@42 = " + pbList);
		String str = request.getParameter("jsonPbArr");
		System.out.println("str = " + str);
		JsonArray jsonArr = new JsonArray();
		
		
		
//		System.out.println();
//		String[] firstSplitRst = pbList.split("ProductBuy [");
//		System.out.println("firstSplitRst = " + firstSplitRst );
//		List<ProductBuy> castPbList = new ArrayList<>();
//		for(int i = 1 ; i < firstSplitRst.length; i++) {
//			ProductBuy pb = new ProductBuy();			
//			int productNoStrat = firstSplitRst[i].indexOf("productNo=");
//			int productNoEnd= firstSplitRst[i].indexOf(",", firstSplitRst[i].indexOf("productNo="));
//			System.out.println(firstSplitRst[i].substring(productNoStrat + 10, productNoEnd));
//			System.out.println();
//		}
		
		
		
		//배송지처리
		

		
		//상품주문테이블
		

		//결제테이블
		
//		System.out.println("merchantUid@servlet = " + merchantUid);
//		
//		request.getParameter("paymentDate");
//		request.getParameter("buyDate");
//		request.getParameter("impUid");
//		request.getParameter("impUid");
//		request.getParameter("impUid");

	}

}
