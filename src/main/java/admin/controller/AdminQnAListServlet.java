package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import board.model.dto.Question;
import common.utill.PageBar;

/**
 * Servlet implementation class AdminQnAListServlet
 */
@WebServlet("/admin/questionList")
public class AdminQnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int numPerPage = adminService.QUESTION_NUM_PER_PAGE;
			int cPage = 1;
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
				// 예외발생시 현재페이지는 1로 처리
			}
			Map<String, Object> param = new HashMap<>();
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			param.put("start", start);
			param.put("end", end);
			
			int totalQuestions = adminService.getTotalQuestion();
			List<Question> list = adminService.findAllQuestion(param);
			// System.out.println("list@servlet = " + list);

			String url = request.getRequestURI();
			String pagebar = PageBar.getPagebar(cPage, numPerPage, totalQuestions, url);
			
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);			
			request.getRequestDispatcher("/WEB-INF/views/admin/adminQnAList.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
