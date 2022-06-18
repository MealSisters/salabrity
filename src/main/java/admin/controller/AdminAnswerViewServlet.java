package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.PostingExt;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class AdminAnswerViewServlet
 */
@WebServlet("/admin/answerView")
public class AdminAnswerViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postingNo = Integer.parseInt(request.getParameter("no"));
		PostingExt posting = mypageService.findByNo(postingNo);
		posting.setContent(posting.getContent().replaceAll("\n", "<br/>"));
		
		request.setAttribute("posting", posting);
		request.getRequestDispatcher("/WEB-INF/views/admin/answerView.jsp").forward(request, response);
	}

}
