package buy.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

import buy.model.dto.BuyExt;
import buy.model.dto.PayPB;
import buy.model.dto.PayStatement;
import buy.model.dto.ProductBuyExt;
import buy.model.service.BuyService;
import mypage.model.dto.Destination;
import mypage.model.service.DestinationService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/buy/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DestinationService destinationService = new DestinationService();
	private BuyService buyService = new BuyService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 전달받은 값 처리
			Long merchantUid = Long.parseLong(request.getParameter("merchantUid"));
			String memberId = request.getParameter("memberId");
			String payMethod = request.getParameter("payMethod");
			int amount = Integer.parseInt(request.getParameter("amount")) ;
			String buyerEmail = request.getParameter("buyerEmail");
			String buyerName = request.getParameter("buyerName");
			String buyerTel = request.getParameter("buyerTel");
			String buyerAddress = request.getParameter("buyerAddr");
			String buyerPostcode = request.getParameter("buyerPostcode");
			String buyerAddresDetail = request.getParameter("buyerAddressDetail");
			Long paySec = Long.parseLong(request.getParameter("paySec"));
			Date paymentDate = new Date(paySec * 1000);
			String impUid = request.getParameter("impUid");
			String payStatement = request.getParameter("payStatement");
			String requestTerm = request.getParameter("requestTerm");

			String str = request.getParameter("jsonPbArr");

			int shippingAddressNo = Integer.parseInt(request.getParameter("shippingAddrNo"));
			String shippingAddrInput = request.getParameter("shippingAddrInput");
			String shippingAddrDetailInput = request.getParameter("shippingAddrDetailInput");
			
			System.out.println("buyerPostcode@servlet" + buyerPostcode);
			// 배송지 정보 처리
			// 직접입력일땐 shipping_address 테이블에 레코드 추가
			if(shippingAddressNo == 0 ) {
				Destination destination = new Destination(
						memberId, buyerTel, buyerPostcode, shippingAddrInput, shippingAddrDetailInput, buyerName);
				shippingAddressNo = destinationService.insertDestinationReturnDestNo(destination);
			}
			
			// 주문 객체 생성 및 추가
			Date today = new Date(System.currentTimeMillis());
			BuyExt buy = new BuyExt(merchantUid, memberId, shippingAddressNo, payMethod, amount, buyerEmail, buyerName,
					buyerTel, buyerAddress, buyerPostcode, paymentDate, today, impUid, PayStatement.valueOf(payStatement), requestTerm);

			Gson gson = new Gson();
			PayPB[] array = gson.fromJson(str, PayPB[].class);
			List<PayPB> tmpList = Arrays.asList(array);
			List<ProductBuyExt> pbList = new ArrayList<>();
			for (PayPB ppb : tmpList) {
				ProductBuyExt pb = new ProductBuyExt();
				pb.setProductNo(ppb.getProductNo());
				pb.setMerchantUid(merchantUid);
				pb.setQuantity(ppb.getQuantity());
				pb.setFirstShippingDate(Date.valueOf(ppb.getFirstShippingDate()));
				pbList.add(pb);
			}
			buy.setList(pbList);

			// 주문테이블 insert + 상품-주문 테이블 insert 트랜잭션 처리
			int result = buyService.insertBuy(buy);

			String msg = "결제성공";

			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(msg, response.getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

}
