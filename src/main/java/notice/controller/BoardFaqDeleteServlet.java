package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.PostingExt;
import board.model.service.BoardService;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class BoardFaqDeleteServlet
 */
@WebServlet("/board/faqDelete")
public class BoardFaqDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = mypageService.deleteQuestion(no);
		String msg = "게시글이 삭제되었습니다.";
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath()+"/board/faq");
	}

}
