package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.dto.Destination;
import mypage.model.service.DestinationService;

/**
 * Servlet implementation class DestinationDelFlagUpdate
 */
@WebServlet("/mypage/destination/delFlagUpdate")
public class DestinationDelFlagUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DestinationService destinationService = new DestinationService();
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int shippingAddressNo = Integer.parseInt(request.getParameter("shippingAddressNo"));
			String memberId = request.getParameter("memberId");
					
			Destination destination = new Destination();
			destination.setShippingAddressNo(shippingAddressNo);
			destination.setMemberId(memberId);
			int result = destinationService.delFlagUpdateY(destination);
				
			response.sendRedirect(request.getContextPath() + "/mypage/destination");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
