package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/member/findId")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/findId.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("phone");
		
		String findId = memberService.findId(memberName, phone);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(findId != null) {
			writer.print("<script>alert('가입하신 회원님의 아이디는 ");
			writer.print(findId);
			writer.println(" 입니다.'); </script>");
			writer.println("<script>history.go(-2);</script>");
			writer.close();
		} else {
			writer.println("<script>alert('해당하는 회원 정보가 없습니다. 다시 시도해주세요.');</script>");
			writer.println("<script>history.back();</script>");
			writer.close();
		}

	}
}
