package board.controller.notice;

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
import common.utill.PageBar;

/**
 * @author 박수진
 * Servlet implementation class NoticeBoardServlet
 */
@WebServlet("/board/notice")
public class NoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 사용자 입력값 처리
			int numPerPage = boardService.NUM_PER_PAGE;
			int cPage = 1;
			
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
				// 예외발생시 현재 페이지는 1로 처리
			}
			
			Map<String, Object> param = new HashMap<>();
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			param.put("start", start);
			param.put("end", end);
			
			BoardCode boardCode = BoardCode.N;
			
			// 2. 업무 로직
			// 2.a. content 영역
			List<PostingExt> postingList = boardService.findAllPostingList(param, boardCode);
			
			// 2.b. pagebar 영역
			int totalPostingContents = boardService.getTotalPostings(boardCode);
			String url = request.getRequestURI();
			String pagebar = "";
			if (boardCode != null) {
				pagebar = PageBar.getMultiParamPagebar(cPage, numPerPage, totalPostingContents, url + "?BoardCode=" + boardCode);
			}
			else {
				pagebar = PageBar.getPagebar(cPage, numPerPage, totalPostingContents, url);
			}
			System.out.println("pagebar = " + pagebar);
			
			// 3. view단 처리
			request.setAttribute("postingList", postingList);
			request.setAttribute("pagebar", pagebar);
			request.getRequestDispatcher("/WEB-INF/views/board/notice/noticeBoard.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
