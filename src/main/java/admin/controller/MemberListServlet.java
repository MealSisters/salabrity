package admin.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import common.utill.PageBar;
import member.model.dto.Member;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/admin/memberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminService adminService = new AdminService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 사용자입력값 처리
			String memberRole = request.getParameter("memberRole");
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String gender = request.getParameter("gender");
			String phone = request.getParameter("phone");

			Map<String, Object> searchParam = new HashMap<>();
			if (memberRole != null) {
				searchParam.put("memberRole", memberRole);
				searchParam.put("memberId", memberId);
				searchParam.put("memberName", memberName);
				searchParam.put("gender", gender);
				searchParam.put("phone", phone);
			}

			// 페이징 처리
			int numPerPage = AdminService.MEMBER_NUM_PER_PAGE;
			int cPage = 1;
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
				// 예외발생시 현재페이지는 1로 처리
			}

			Map<String, Object> param = new HashMap<>();
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			param.put("start", start);
			param.put("end", end);

			// 업무로직
			int totalMembers = 0;
			List<Member> list = null;
			if (!searchParam.isEmpty()) {
				searchParam.put("start", start);
				searchParam.put("end", end);
				list = adminService.findMemberBy(searchParam);
				totalMembers = adminService.getFilteringMembers(searchParam);
				System.out.println("listSize@servlet = " + list.size());
			} else {
				list = adminService.findAllMember(param);
				totalMembers = adminService.getTotalMembers();
			}

			String url = request.getRequestURI();
			String pagebar = PageBar.getPagebar(cPage, numPerPage, totalMembers, url);

			// view단처리
			request.setAttribute("list", list);
			request.setAttribute("pagebar", pagebar);
			request.getRequestDispatcher("/WEB-INF/views/admin/memberList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
