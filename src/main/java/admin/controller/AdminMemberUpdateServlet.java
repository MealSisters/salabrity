package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.dto.Member;
import member.model.dto.MemberRole;

/**
 * Servlet implementation class AdminMemberUpdateServlet
 */
@WebServlet("/admin/memberRoleUpdate")
public class AdminMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String memberId = request.getParameter("memberId");
			MemberRole memberRole = MemberRole.valueOf(request.getParameter("memberRole"));
			String memberRoleText = (memberRole == MemberRole.A) ? "관리자" : "회원";
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberRole(memberRole);
			int result = adminService.updateMemberRole(member);
			System.out.println("result = " + result);
			
			request.getSession().setAttribute("msg", "[" + memberId + "]의 권한이 [" + memberRoleText + "]으로 변경되었습니다.");
			response.sendRedirect(request.getContextPath() + "/admin/memberList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
