package survey.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class BoardFaqServlet
 */
@WebServlet("/survey/surveyResult")
public class SurveyResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String uniq = request.getParameter("uniq");
			String gender = request.getParameter("gender");		
			int w = Integer.parseInt(request.getParameter("weightInput"));
			int h = Integer.parseInt(request.getParameter("heightInput"));

			request.getRequestDispatcher("/WEB-INF/views/survey/surveyResult.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
