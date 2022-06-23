package board.controller.community.general;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardCode;
import board.model.dto.PostingLike;
import board.model.service.BoardService;

/**
 * @author 박수진
 * Servlet implementation class CommunityBoardGeneralLikeServlet
 */
@WebServlet("/board/community/generalLike")
public class CommunityBoardGeneralLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
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
			response.sendRedirect(request.getContextPath() + "/board/community/generalView?no=" + postingNo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
