package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.model.dto.Destination;
import mypage.model.service.DestinationService;

/**
 * Servlet implementation class DestinationEnrollServlet
 */
@WebServlet("/mypage/destination/enroll")
public class DestinationEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DestinationService destinationService = new DestinationService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			//1. 입력값 처리
			String shippingPerson = request.getParameter("shipping_person");
			String telephone = request.getParameter("telephone");
			String zipcode = request.getParameter("zipcode");
			String address= request.getParameter("address");
			String addressDetail = request.getParameter("address_detail");
			String memberId = request.getParameter("member_id");
			
			//2. 업무로직
			Destination destination = new Destination(
					memberId,telephone, zipcode, address, addressDetail, shippingPerson);
			int result = destinationService.insertDestination(destination);
			String msg = result > 0 ? "등록이 완료되었습니다.": "등록에 실패했습니다.";
			session.setAttribute("msg", msg);
			//3. 리다이렉트
			response.sendRedirect(request.getContextPath() + "/mypage/destination");
		} catch (Exception e) {

			e.printStackTrace();
			throw e;
		}
		
	}

}
