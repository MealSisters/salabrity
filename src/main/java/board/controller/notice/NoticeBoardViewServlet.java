package board.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardUtil;
import board.model.dto.PostingExt;
import board.model.service.BoardService;

/**
 * @author 박수진
 * Servlet implementation class NoticeBoardViewServlet
 */
@WebServlet("/board/noticeView")
public class NoticeBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 사용자 입력값 처리
			int no = Integer.parseInt(request.getParameter("no"));
			
			// 쿠키 처리 - 조회수 제어용
			// 브라우저별로 읽지 않았을 경우에만 조회수 증가
			boolean hasRead = false;
			String postingCookieVal = "";
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(Cookie cookie : cookies) {
					String name = cookie.getName();
					String value = cookie.getValue();
					if("postingCookie".equals(name)) {
						postingCookieVal = value;
						if(value.contains("|" + no + "|")) {
							hasRead = true;
						}
						break;
					}	
				}
			}
			
			// 2. 업무 로직
			// 조회수 증가
			if(!hasRead) {
				int result = boardService.updateReadCount(no);
				Cookie cookie = new Cookie("postingCookie", postingCookieVal + "|" + no + "|");
				cookie.setPath(request.getContextPath() + "/board/noticeView");
				cookie.setMaxAge(365 * 24 * 60 * 60);
				response.addCookie(cookie);
			}
			
			// 게시글 조회
			PostingExt posting = boardService.findByPostingNo(no);
			BoardUtil.getReplacePostingContent(posting);
			
			// 3. view단 위임
			request.setAttribute("posting", posting);
			request.getRequestDispatcher("/WEB-INF/views/board/notice/noticeBoardView.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
