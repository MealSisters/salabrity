package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.dto.Posting;
import common.utill.PageBar;
import member.model.dto.Member;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class BoardFinderServlet
 */
@WebServlet("/mypage/finder")
public class BoardFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		int numPerPage = mypageService.Num_PER_PAGE;
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
		}
		
		Map<String, String> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("searchKeyword", searchKeyword);
//		System.out.println("param = " + param);
		
		int end = cPage * numPerPage;
		int start = (cPage - 1) * numPerPage + 1;
		
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
//		System.out.println(memberId);

		List<Posting> list = mypageService.searchMyWriteList(memberId, param, start, end);
//		System.out.println("list = " + list);
		
		int totalContents = mypageService.searchMyWriteListCount(memberId, param);
//		System.out.println(totalContents);
		
		String url = request.getRequestURI() + "?searchType=" + searchType + "&searchKeyword=" + searchKeyword ;
		String pageBar = PageBar.getPagebar(cPage, numPerPage, totalContents, url);
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypage/boardWriteList.jsp").forward(request, response);
	}

}
