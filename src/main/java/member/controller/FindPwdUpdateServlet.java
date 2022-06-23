package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.utill.PwdEncrypt;
import member.model.dto.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdUpdateServlet
 */
@WebServlet("/member/findPwdUpdate")
public class FindPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/findPwdUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String randomMsg = (String) request.getSession().getAttribute("randomMsg");
		String randomPwd = request.getParameter("randomPwd");
		String memberId = request.getParameter("memberId");
		String newPassword = PwdEncrypt.encrypt(request.getParameter("newPassword"), memberId);
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (!randomMsg.equals(randomPwd)) {
			writer.println("<script>alert('인증번호가 일치하지 않습니다. 다시 시도해주세요.');</script>");
			writer.println("<script>history.go(-2);</script>");
			writer.close();
			return;
		}

		Member member = memberService.findByMemberId(memberId);
		if (member != null) {
			Member findPwdUpdate = new Member();
			findPwdUpdate.setMemberId(memberId);
			findPwdUpdate.setPassword(newPassword);
			int result = memberService.findPwdUpdate(findPwdUpdate);
			String msg = "";
			msg = "비밀번호가 변경되었습니다.";

			request.getSession().setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);
			
		}

	}

}
