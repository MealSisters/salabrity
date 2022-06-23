package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buy.model.dto.BuyExt;
import buy.model.service.BuyService;
import member.model.dto.Member;

/**
 * Servlet implementation class OrderList
 */
@WebServlet("/mypage/orderList")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BuyService buyService = new BuyService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			Member loginMember = (Member) session.getAttribute("loginMember");
			String memberId = loginMember.getMemberId();
			
			List<BuyExt> list = buyService.findBuyExtById(memberId);

			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/member/mypage/orderList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
