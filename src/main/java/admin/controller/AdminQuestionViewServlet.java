package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import board.model.dto.Question;

/**
 * Servlet implementation class AdminQuestionViewServlet
 */
@WebServlet("/admin/questionView")
public class AdminQuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int questionNo = Integer.parseInt(request.getParameter("no"));
			
			Question question = adminService.findQuestion(questionNo);
			question.setContent(question.getContent().replaceAll("\n", "<br/>"));
			
			request.setAttribute("question", question);
			request.getRequestDispatcher("/WEB-INF/views/admin/questionView.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
