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
import board.model.dto.PostingExt;
import board.model.dto.Question;
import common.utill.PageBar;
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
		int numPerPage = mypageService.Num_PER_PAGE;
		int cPage = 1;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		}
		
		int start = (cPage - 1) * numPerPage + 1;
		int end = cPage * numPerPage;
		
		List<Question> list = null;
		HttpSession session = request.getSession();
		String memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		
		
		list = mypageService.findQuestionList(memberId, start, end);
//	System.out.println("----------" + list);
		int totalContents = mypageService.myQuestionTotal(memberId);
//		System.out.println("토탈컨텐츠 : " + totalContents);
		String url = request.getRequestURI();
//		System.out.println(url);
		
		String pageBar = PageBar.getPagebar(cPage, numPerPage, totalContents, url);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypage/boardQuestionList.jsp").forward(request, response);
	}


}
