package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.utill.PwdEncrypt;
import member.model.dto.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class PwdUpdateServlet
 */
@WebServlet("/mypage/pwdUpdate")
public class PwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/mypage/pwdUpdate.jsp")
			.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String memberId = request.getParameter("memberId");
			String oldPassword = PwdEncrypt.encrypt(request.getParameter("oldPassword"), memberId);
			String newPassword = PwdEncrypt.encrypt(request.getParameter("newPassword"), memberId);

			System.out.println("memberId = " + memberId);
			System.out.println("oldPassword = " + oldPassword);
			System.out.println("newPassword = " + newPassword);
			
			Member member = memberService.findByMemberId(memberId);
			String msg = "";
			String location = request.getContextPath();
			if(member != null && oldPassword.equals(member.getPassword())) {
				Member updateMember = new Member();
				updateMember.setMemberId(memberId);
				updateMember.setPassword(newPassword);
				int result = memberService.updatePassword(updateMember);
				msg = "비밀번호가 변경되었습니다.";
				location += "/mypage/memberUpdate";
			} else {
				msg = "기존 비밀번호가 일치하지 않습니다.";
				location += "/mypage/pwdUpdate";
			}
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(location);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	}

}
