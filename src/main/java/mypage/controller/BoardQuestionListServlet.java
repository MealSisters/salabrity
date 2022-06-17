package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.dto.Posting;
import member.model.dto.Member;
import member.model.service.MemberService;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class BoardQuestionList
 */
@WebServlet("/mypage/boardQuestionList")
public class BoardQuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Posting> list = null;
		
		HttpSession session = request.getSession();
		
		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		
		
		list = mypageService.findQuestionList(memberId);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypage/boardQuestionList.jsp").forward(request, response);
	}


}
