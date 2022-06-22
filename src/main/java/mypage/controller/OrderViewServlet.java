package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buy.model.dto.BuyExt;
import buy.model.service.BuyService;
import mypage.model.dto.Destination;
import mypage.model.service.DestinationService;
import product.model.dto.ProductExt;
import product.model.service.ProductService;

/**
 * Servlet implementation class orderViewServlet
 */
@WebServlet("/mypage/orderView")
public class OrderViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BuyService buyService = new BuyService();
	private ProductService productService = new ProductService();
	private DestinationService destinationService = new DestinationService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Long merchantUid = Long.parseLong(request.getParameter("merchantUid"));	
			
			List<BuyExt> buyList = buyService.findBuyByMerchantUid(merchantUid);
			List<ProductExt> productList = new ArrayList<ProductExt>();
			for(int i = 0; i < buyList.size();i++) {
				int no = buyList.get(0).getList().get(i).getProductNo();
				ProductExt product = productService.findProductByNo(no);
				productList.add(product);
			}
			Destination destination = destinationService.findDestinationByShippingAddressNo(buyList.get(0).getShippingAddressNo());
			
			request.setAttribute("buyList", buyList);
			request.setAttribute("productList", productList);
			request.setAttribute("destination", destination);

			request.getRequestDispatcher("/WEB-INF/views/member/mypage/orderView.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	
}