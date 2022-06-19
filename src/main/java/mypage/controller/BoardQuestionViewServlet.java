package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.PostingExt;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class BoardQuestionView
 */
@WebServlet("/mypage/boardQuestionView")
public class BoardQuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int no = Integer.parseInt(request.getParameter("no"));
			
			PostingExt posting = mypageService.findByNo(no);
			System.out.println("서블릿"+posting);
			
//			posting.setTitle(posting.getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
//			posting.setContent(posting.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
//			posting.setContent(posting.getContent().replaceAll("\n", "<br/>"));
			
			request.setAttribute("posting", posting);
			request.getRequestDispatcher("/WEB-INF/views/member/mypage/boardQuestionView.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
