package board.controller.community.general;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * @author 박수진
 * Servlet implementation class CommunityBoardGeneralCommentDeleteServlet
 */
@WebServlet("/board/community/generalView/commentDelete")
public class CommunityBoardGeneralCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 사용자 입력값 처리
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			int postingNo = Integer.parseInt(request.getParameter("postingNo"));
			
			// 2. 업무 로직
			int result = boardService.deletePostingComment(commentNo);
			String msg = result > 0 ? "댓글 삭제에 성공했습니다." : "댓글 삭제에 실패했습니다.";
			
			// 3. 리다이렉트
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/board/community/generalView?no=" + postingNo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
