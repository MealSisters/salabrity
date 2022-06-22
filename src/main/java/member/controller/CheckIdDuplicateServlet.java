package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class CheckIdDuplicateServlet
 */
@WebServlet("/member/checkIdDuplicate")
public class CheckIdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberIdChk = request.getParameter("memberIdChk");
//		System.out.println("checkId = " + memberId);
		
		Member member = memberService.findByMemberId(memberIdChk);

		response.setContentType("text/plain; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(member != null) {
			writer.print(memberIdChk + " 는 이미 사용중인 아이디입니다.");
		} else {
			writer.print(memberIdChk + " 는 사용가능한 아이디입니다.");
		}
	}

}
