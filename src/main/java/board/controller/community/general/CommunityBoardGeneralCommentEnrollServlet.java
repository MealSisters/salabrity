package board.controller.community.general;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardCode;
import board.model.dto.PostingComment;
import board.model.service.BoardService;

/**
 * @author 박수진
 * Servlet implementation class CommunityBoardHacksCommentServlet
 */
@WebServlet("/board/community/generalView/commentEnroll")
public class CommunityBoardGeneralCommentEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 사용자 입력값 처리
			int postingNo = Integer.parseInt(request.getParameter("postingNo"));
			BoardCode boardCode = BoardCode.valueOf(request.getParameter("boardCode"));
			String memberId = request.getParameter("memberId");
			int commentLevel = Integer.parseInt(request.getParameter("commentLevel"));
			int commentRef = Integer.parseInt(request.getParameter("commentRef"));
			String commentContent = request.getParameter("commentContent");
			
			PostingComment pc = new PostingComment(0, postingNo, boardCode, memberId, commentContent, commentLevel, commentRef, null);
			
			// 2. 업무 로직
			int result = boardService.insertPostingComment(pc);
			
			// 3. 리다이렉트
			response.sendRedirect(request.getContextPath() + "/board/community/generalView?no=" + postingNo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
