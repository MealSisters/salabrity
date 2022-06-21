package survey.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class surveyResultServlet
 */
@WebServlet("/surveyResult")
public class SurveyResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SurveyResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/surveyCustom.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		
		try {
			
			String uniq = request.getParameter("uniq");
			String gender = request.getParameter("gender");	
			
			double h = Double.parseDouble(request.getParameter("heightInput"));
			double w = Double.parseDouble(request.getParameter("weightInput"));

			h = h/100;
			double bmi = w/(h*h);

			String resultName = "";
			String resultDesc = "";
			
			String mealName[] = { "일반식단", "체중조절식단", "저당식단", "베이비식단" };
			String mealDesc[] = { "일반식단 설명", "체중조절식단 설명", "저당식단 설명", "베이비식단 설명" };
			
			if(uniq !=null){ 
					if(uniq.equals("diabetes")){
						resultName = mealName[2];
						resultDesc = mealDesc[2];
					}
					if(uniq.equals("baby")){
						resultName = mealName[3];
						resultDesc = mealDesc[3];
					}
				}
			if(uniq == null && gender.equals("male")){
				 if(bmi < 25){
					resultName = mealName[0];
					resultDesc = mealDesc[0];
				 }
				 else if(bmi > 25){
					resultName = mealName[1];
					resultDesc = mealDesc[1];
				 }
				}
			if(uniq == null && gender.equals("female")){
				 if(bmi < 23.0){
					resultName = mealName[0];
					resultDesc = mealDesc[0];
				 }
				 else if(bmi > 23){
					resultName = mealName[1];
					resultDesc = mealDesc[1];
				 }
				}
			
			request.getRequestDispatcher("surveyResult.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
