package member.controller;

import java.sql.Date;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.utill.PwdEncrypt;
import member.model.dto.Member;
import member.model.dto.MemberRole;
import member.model.service.MemberService;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/memberEnroll")
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/memberEnroll.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 입력 값
			String memberId = request.getParameter("memberId");
			String password = PwdEncrypt.encrypt(request.getParameter("password"), memberId);
			String memberName = request.getParameter("memberName");
			
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String email = email1 + "@" + email2;
			
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String phone = phone1 + phone2 + phone3;
			
			String zipcode = request.getParameter("zipcode");
			String address = request.getParameter("address");
			String addressDetail = request.getParameter("addressDetail");
			
			String _birthday = request.getParameter("birthday");
			Date birthday = null;
			if(_birthday != null && !"".equals(_birthday))
				birthday = Date.valueOf(_birthday);
			
			String gender = request.getParameter("gender");
			
			Member member = new Member(memberId, password, memberName, gender, birthday, email, phone, zipcode, address,
					addressDetail, null, MemberRole.U);
			System.out.println("입력한 회원 정보 : " + member);
			
			
			int result = memberService.insertMember(member);
//			response.sendRedirect(request.getContextPath() + "/WEB-INF/views/member/joinEnd.jsp");
			request.getRequestDispatcher("/WEB-INF/views/member/joinEnd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
