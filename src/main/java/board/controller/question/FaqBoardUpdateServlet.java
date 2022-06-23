package board.controller.question;

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
 * Servlet implementation class FaqBoardUpdateServlet
 */
@WebServlet("/board/faqUpdate")
public class FaqBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 2. 업무 로직 - db에서 한 건 조회
		PostingExt posting = boardService.findByPostingNo(no);
		
		// 3. view단 처리
		request.setAttribute("posting", posting);
		request.getRequestDispatcher("/WEB-INF/views/board/question/faqBoardUpdate.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {			
			// 1. 사용자 입력값 처리
			int no = Integer.parseInt(request.getParameter("no"));
			BoardCode boardCode = BoardCode.valueOf(request.getParameter("boardCode"));
			String memberId = request.getParameter("memberId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			PostingExt posting = new PostingExt();
			posting.setPostingNo(no);
			posting.setBoardCode(boardCode);
			posting.setMemberId(memberId);
			posting.setTitle(title);
			posting.setContent(content);
			
			// 2. 업무 로직
			int result = boardService.updatePosting(posting);
			String msg = result > 0 ? "게시글 수정에 성공했습니다." : "게시글 수정에 실패했습니다.";
			
			// 3. 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/board/faq");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
