package board.controller.community.hacks;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import board.BoardUtil;
import board.model.dto.BoardCode;
import board.model.dto.PostingExt;
import board.model.service.BoardService;

/**
 * @author 박수진
 * Servlet implementation class CommunityBoardGeneralEnrollServlet
 */
@WebServlet("/board/community/hacksEnroll")
public class CommunityBoardHacksEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/community/hacks/communityBoardHacksEnroll.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 0. MultipartRequest객체 생성
			// 파일저장 경로
			String saveDirectory = getServletContext().getRealPath("/upload/board/community/hacks");			
			MultipartRequest multiReq = BoardUtil.getMultipartRequest(request, saveDirectory);
			
			// 1. 사용자 입력값 처리
			String memberId = multiReq.getParameter("memberId");
			String title = multiReq.getParameter("title");
			String content = multiReq.getParameter("content");
			
			PostingExt posting = new PostingExt();
			posting.setBoardCode(BoardCode.C1);
			posting.setMemberId(memberId);
			posting.setTitle(title);
			posting.setContent(content);
			
			BoardUtil.getPostingAttach(multiReq, posting);
			
			// 2. 업무 로직 (db insert)
			int result = boardService.insertPosting(posting);
			String msg = result > 0 ? "게시글 등록에 성공했습니다." : "게시글 등록에 실패했습니다.";
			
			// 3. 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/board/community/hacksView?no=" + posting.getPostingNo());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
