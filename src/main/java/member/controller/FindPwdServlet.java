package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dto.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class FindPwServlet
 */
@WebServlet("/member/findPwd")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/findPwd.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		String memberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		
		Member member = memberService.findByMemberId(memberId);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(member == null || !member.getMemberId().equals(memberId) || !member.getEmail().equals(email)){
        	writer.println("<script>alert('해당하는 회원 정보가 없습니다. 다시 시도해주세요.');</script>");
			writer.println("<script>history.back();</script>");
			writer.close();
            return;
      }else {
		
    	  String host = "smtp.naver.com";
    	  String user = "salabrity@naver.com";
    	  String password = "toffjqmflxl123~!";
    	  
    	  String toEmail = member.getEmail();

    	  
    	  Properties props = new Properties();
    	  props.put("mail.smtp.host", host);
          props.put("mail.smtp.port", 465);
          props.put("mail.smtp.auth", "true");
  		  props.put("mail.smtp.ssl.enable", "true");
  		  props.put("mail.smtp.starttls.enable", "true");
  		  props.put("mail.debug", "true");
  		  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
          
          int random = (int)(Math.random() * (999999 - 100000 + 1)) + 100000;
			String randomMsg = Integer.toString(random);
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			
			try {
				MimeMessage send = new MimeMessage(session);
				send.setFrom(new InternetAddress(user));
				send.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
				send.setSubject("샐러브리티 인증번호 발급 안내입니다.");
				send.setText("인증번호는 " + randomMsg + " 입니다.");

				Transport.send(send);
				
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
				HttpSession savePwd = request.getSession();
				savePwd.setAttribute("randomMsg", randomMsg);
				request.setAttribute("email", email);
				request.setAttribute("memberId", memberId);
				savePwd.setAttribute("msg", "이메일로 인증번호가 전송되었습니다.");
				request.getRequestDispatcher("/WEB-INF/views/member/findPwdUpdate.jsp").forward(request, response);
          
	}

}
}
