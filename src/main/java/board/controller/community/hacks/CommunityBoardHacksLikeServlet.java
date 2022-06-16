package board.controller.community.hacks;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.dto.BoardCode;
import board.model.dto.PostingLike;
import board.model.service.BoardService;

/**
 * Servlet implementation class CommunityBoardHacksLikeServlet
 */
@WebServlet("/board/community/hacksLike")
public class CommunityBoardHacksLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postingNo = Integer.parseInt(request.getParameter("postingNo"));
		BoardCode boardCode = BoardCode.valueOf(request.getParameter("boardCode"));
		String memberId = request.getParameter("memberId");
		
		PostingLike like = boardService.likeCheck(postingNo, boardCode, memberId);
		
		if(like == null) {
			boardService.updateLikeCount(postingNo, boardCode, memberId);
		}
		else {
			boardService.setPostingLike(like);
		}
		
		request.setAttribute("like", like);
		response.sendRedirect(request.getContextPath() + "/board/community/hacksView?no=" + postingNo);
	}

}
