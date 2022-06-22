package cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dto.Member;
import mypage.model.dto.Destination;
import mypage.model.service.DestinationService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DestinationService destinationService = new DestinationService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
		Destination defaultDestination = destinationService.findDefaultDestinationById(memberId);
		List<Destination> destinationList = destinationService.findById(memberId);

		request.setAttribute("defaultDestination", defaultDestination);
		request.setAttribute("destinationList", destinationList);
		request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(request.getParameter("productNo")!= null) {
			session.setAttribute("productNo", request.getParameter("productNo"));
			session.setAttribute("firstShippingDate", request.getParameter("firstShippingDate"));
			session.setAttribute("quantity", request.getParameter("quantity"));
		}
		doGet(request, response);
	}
}
