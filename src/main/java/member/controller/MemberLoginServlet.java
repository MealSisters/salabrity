package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dto.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 4. 응답처리 view단으로 jsp위임 처리
		request.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자 입력 값
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		System.out.println("memberId@MemberLoginServlet = " + memberId);
		System.out.println("password@MemberLoginServlet = " + password);
		
		// 업무로직
		Member member = memberService.findByMemberId(memberId);
		System.out.println("member@MemberLoginServlet = " + member);
		
		HttpSession session = request.getSession();
		if(member != null && password.equals(member.getPassword())) {
			session.setAttribute("loginMember", member);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
		} else {
			// 로그인 실패 
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			doGet(request, response);
		}
		
//		String referer = request.getHeader("Referer");
//		response.sendRedirect(referer);
		
//		response.sendRedirect(request.getContextPath() + "/");
		
	
		
	}
	

}
