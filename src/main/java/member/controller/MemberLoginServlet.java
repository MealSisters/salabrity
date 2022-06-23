package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.utill.PwdEncrypt;
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
		try {
			// 사용자 입력 값
			String memberId = request.getParameter("memberId");
			String password = PwdEncrypt.encrypt(request.getParameter("password"), memberId);
			String saveId = request.getParameter("saveId");
			
			System.out.println("memberId@MemberLoginServlet = " + memberId);
			System.out.println("password@MemberLoginServlet = " + password);
			System.out.println("saveId@MemberLoginServlet = " + saveId);
			
			// 업무로직
			Member member = memberService.findByMemberId(memberId);
			
			HttpSession session = request.getSession();
			// saveId
			Cookie cookie = new Cookie("saveId", memberId); // 쿠키 객체 생성
			cookie.setPath(request.getContextPath());
			if(saveId != null) {
				cookie.setMaxAge(7 * 24 * 60 * 60);
			} else {
				// 로그인 실패
				cookie.setMaxAge(0); 
			}
			response.addCookie(cookie); // 쿠키 객체 브라우저로 보내기 
			
			if(member != null && password.equals(member.getPassword())) {
				// 로그인 성공
				session.setAttribute("loginMember", member);
				response.sendRedirect(request.getContextPath() + "/");
				
			} else {
				session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
				doGet(request, response);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} 
		
	}
	

}