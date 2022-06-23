package board.controller.community;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardCode;
import board.model.dto.PostingExt;
import board.model.service.BoardService;

/**
 * Servlet implementation class CommunityBoardServlet
 */
@WebServlet("/board/community")
public class CommunityBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 사용자 입력값 처리	
			Map<Object, String> c1Board = new HashMap<>();
			c1Board.put("boardCode", "C1");
			c1Board.put("orderBy", "reg_date");
			
			Map<Object, String> c2Board = new HashMap<>();
			c2Board.put("boardCode", "C2");
			c2Board.put("orderBy", "read_count");
			
			// 2. 업무 로직
			List<PostingExt> cPostingList = boardService.findCommunityPostingList(c1Board);
			List<PostingExt> pPostingList = boardService.findCommunityPostingList(c2Board);
			
			// 3. view단 처리
			request.setAttribute("cPostingList", cPostingList);
			request.setAttribute("pPostingList", pPostingList);
			request.getRequestDispatcher("/WEB-INF/views/board/community/communityBoard.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
