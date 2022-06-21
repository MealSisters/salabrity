package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/findPwdUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String randomStr = (String) request.getSession().getAttribute("randomStr");
		String randomPwd = request.getParameter("randomPwd");
		String email = request.getParameter("email");
		String newPwd = PwdEncrypt.encrypt(request.getParameter("newPwd"), email);
		
		if(!randomStr.equals(randomPwd)){
			request.setAttribute("msg", "인증번호가 일치하지 않습니다");
			return;
		}
		
		Member member = memberService.findByMemberEmail(email);
		String msg = "";
		String location = request.getContextPath();
		if(member != null) {
			Member findPwdUpdate = new Member();
			findPwdUpdate.setEmail(email);
			findPwdUpdate.setPassword(newPwd);
			int result = memberService.findPwdUpdate(findPwdUpdate);
			System.out.println(result);
			msg = "비밀번호가 변경되었습니다.";
			location += "/member/login";
		} else {
			msg = "기존 비밀번호가 일치하지 않습니다.";
			location += "/member/findPwdUpdate";
		}
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(location);
		} 
	

}
