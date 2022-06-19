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

import board.model.dto.PostingExt;
import board.model.service.BoardService;

/**
 * Servlet implementation class CommunityBoardmainHacksServlet
 */
@WebServlet("/board/community/mainHacks")
public class CommunityBoardMainHacksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 사용자 입력값 처리
			int no = Integer.parseInt(request.getParameter("no"));
			String boardCode = request.getParameter("boardCode");
			String orderBy = request.getParameter("orderBy");
			
			Map<Object, String> param = new HashMap<>();
			param.put("boardCode", boardCode);
			param.put("orderBy", orderBy);
			System.out.println("param = " + param);
			
			// 2. 업무 로직
			List<PostingExt> postingList = boardService.findCommunityPostingList(param);
			PostingExt posting = boardService.findByPostingNo(no);
			
			// 3. view단 처리
			request.setAttribute("postingList", postingList);
			request.setAttribute("posting", posting);
			request.getRequestDispatcher("/WEB-INF/views/board/community/communityBoard.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
