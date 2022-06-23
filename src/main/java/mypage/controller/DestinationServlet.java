package mypage.controller;

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
 * Servlet implementation class DestinationServlet
 */
@WebServlet("/mypage/destination")
public class DestinationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DestinationService destinationService = new DestinationService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			Member loginMember = (Member) session.getAttribute("loginMember");
			String memberId = loginMember.getMemberId();
			
			List<Destination> list = destinationService.findById(memberId);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/member/mypage/destination.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
