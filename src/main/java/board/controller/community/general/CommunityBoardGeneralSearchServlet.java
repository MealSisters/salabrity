package board.controller.community.general;

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
 * Servlet implementation class CommunityBoardGeneralSearchServlet
 */
@WebServlet("/board/community/generalSearch")
public class CommunityBoardGeneralSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 0. 페이징 처리
			int numPerPage = boardService.NUM_PER_PAGE;
			int cPage = 1;
			
			try {
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch (NumberFormatException e) {
				// 예외발생시 현재 페이지는 1로 처리
			}
			
			Map<String, Object> pageParam = new HashMap<>();
			int start = (cPage - 1) * numPerPage + 1;
			int end = cPage * numPerPage;
			pageParam.put("start", start);
			pageParam.put("end", end);

			// 1. 사용자 입력값 처리
			String searchType = request.getParameter("searchType");
			String searchKeyword = request.getParameter("searchKeyword");
			
			Map<String, String> param = new HashMap<>();
			param.put("searchType", searchType);
			param.put("searchKeyword", searchKeyword);
			System.out.println("param = " + param);
			
			// 2. 업무 로직
			// 2.a. content 영역
			List<PostingExt> postingList = boardService.searchBy(pageParam, param, BoardCode.C2);

			// 2.b. pagebar 영역
			int totalPostingContents = boardService.getTotalPostings(BoardCode.C2);
			String url = request.getRequestURI();
			String pagebar = PageBar.getPagebar(cPage, numPerPage, totalPostingContents, url);
			System.out.println("pagebar = " + pagebar);
			
			// 3. view단 처리
			request.setAttribute("postingList", postingList);
			request.setAttribute("pagebar", pagebar);
			request.getRequestDispatcher("/WEB-INF/views/board/community/general/communityBoardGeneralList.jsp")
				.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
