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
 * Servlet implementation class QuestionBoardReplyEnrollServlet
 */
@WebServlet("/admin/QnAList/answer")
public class QnABoardAnswerServlet extends HttpServlet {
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
		request.getRequestDispatcher("/WEB-INF/views/board/question/qnaBoardAnswer.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 0. MultipartRequest객체 생성
			// 파일저장 경로
			String saveDirectory = getServletContext().getRealPath("/upload/board/qna");			
			MultipartRequest multiReq = BoardUtil.getMultipartRequest(request, saveDirectory);
			
			// 1. 사용자 입력값 처리
			String memberId = multiReq.getParameter("aMemberId");
			String title = multiReq.getParameter("aTitle");
			String content = multiReq.getParameter("aContent");
			int postingLevel = Integer.parseInt(multiReq.getParameter("postingLevel"));
			int postingRef = Integer.parseInt(multiReq.getParameter("postingRef"));
			
			PostingExt posting = new PostingExt();
			posting.setBoardCode(BoardCode.Q1);
			posting.setMemberId(memberId);
			posting.setTitle(title);
			posting.setContent(content);
			posting.setPostingLevel(postingLevel);
			posting.setPostingRef(postingRef);
			
			BoardUtil.getPostingAttach(multiReq, posting);
			
			// 2. 업무 로직 (db insert)
			int result = boardService.insertPostingRef(posting);
			String msg = result > 0 ? "게시글 등록에 성공했습니다." : "게시글 등록에 실패했습니다.";
			
			// 3. 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/admin/questionList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
