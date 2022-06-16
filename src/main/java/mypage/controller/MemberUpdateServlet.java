package mypage.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mypage/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/mypage/memberUpdate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String zipcode = request.getParameter("zipcode");
			String address = request.getParameter("address");
			String addressDetail = request.getParameter("addressDetail");
			
			String _birthday = request.getParameter("birthday");
			Date birthday = null;
			if(_birthday != null && !"".equals(_birthday))
				birthday = Date.valueOf(_birthday);
			
			String gender = request.getParameter("gender");
			
			Member member = new Member(memberId, null, memberName, gender, birthday, email, phone, zipcode, address,
					addressDetail, null, null);
			System.out.println("회원 정보 수정" + member);
			
			int result = memberService.updateMember(member);
			String msg = "회원 정보 수정 성공";
			
			//세션 정보 갱신
			Member updateMember = memberService.findByMemberId(memberId);
			request.getSession().setAttribute("loginMember", updateMember);
			
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/mypage/memberUpdate");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
