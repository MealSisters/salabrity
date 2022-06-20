package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.Posting;
import common.utill.PageBar;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class BoardFaqServlet
 */
@WebServlet("/board/faq")
public class BoardFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int numPerPage = mypageService.Num_PER_PAGE;
			int cPage = 1;
			
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
			}
			
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			
			List<Posting> list = null;
			
			list = mypageService.findFaqList(start, end);
			System.out.println(list);

			int totalContents = mypageService.faqTotal();
			String url = request.getRequestURI();
			System.out.println(url);
			
			String pageBar = PageBar.getPagebar(cPage, numPerPage, totalContents, url);
			
			request.setAttribute("cPage", cPage);
			request.setAttribute("pageBar", pageBar);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/notice/faqBoard.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
