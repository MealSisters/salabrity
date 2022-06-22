package mypage.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;

/**
 * Servlet implementation class memberDeleteServlet
 */
@WebServlet("/mypage/memberDelete")
public class memberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/mypage/memberDelete.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 사용자 입력 값
			String memberId = request.getParameter("memberId");
			
			// 업무로직
			int result = memberService.deleteMember(memberId);
//			System.out.println("탈퇴 회원 정보 : " + memberId);
			String msg = "";
			
			if(result>0) {

				Cookie cookie = new Cookie("saveId", memberId);
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
				HttpSession session = request.getSession();
				Enumeration<String> names = session.getAttributeNames();
				while(names.hasMoreElements()) {
					String name = names.nextElement();
					session.removeAttribute(name);
				}
			msg = "회원 탈퇴가 완료되었습니다.";
			response.sendRedirect(request.getContextPath() + "/");
			
			} else {
			msg = "다시 시도해주세요.";
				doGet(request, response);
			}
			
			request.getSession().setAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
