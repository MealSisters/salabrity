package board.controller.community.hacks;

import java.io.File;
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
import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
import board.model.service.BoardService;

/**
 * @author 박수진
 * Servlet implementation class CommunityBoardHacksUpdateServlet
 */
@WebServlet("/board/community/hacksUpdate")
public class CommunityBoardHacksUpdateServlet extends HttpServlet {
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
		request.getRequestDispatcher("/WEB-INF/views/board/community/hacks/communityBoardHacksUpdate.jsp")
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
			int no = Integer.parseInt(multiReq.getParameter("no"));
			BoardCode boardCode = BoardCode.valueOf(multiReq.getParameter("boardCode"));
			String memberId = multiReq.getParameter("memberId");
			String title = multiReq.getParameter("title");
			String content = multiReq.getParameter("content");
			
			PostingExt posting = new PostingExt();
			posting.setPostingNo(no);
			posting.setBoardCode(boardCode);
			posting.setMemberId(memberId);
			posting.setTitle(title);
			posting.setContent(content);
			
			BoardUtil.getPostingAttach(multiReq, posting);
			
			// 2. 업무 로직
			int result = boardService.updatePosting(posting);
			String msg = result > 0 ? "게시글 수정에 성공했습니다." : "게시글 수정에 실패했습니다.";
						
			// 첨부 파일 삭제 처리
			deletePostingAttach(saveDirectory, multiReq);
			
			// 3. 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/board/community/hacksView?no=" + no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void deletePostingAttach(String saveDirectory, MultipartRequest multiReq) {
		int result;
		String[] delFiles = multiReq.getParameterValues("delFile");
		if(delFiles != null) {
			for(String temp : delFiles) {
				int attachNo = Integer.parseInt(temp);
				PostingAttach attach = boardService.findPostingAttachByPostingAttachNo(attachNo);
							
				// a. 저장된 파일에 대한 처리 - 파일 삭제
				File delFile = new File(saveDirectory, attach.getRenamedFilename());
				if(delFile.exists()) delFile.delete();
							
				// b. db record에 대한 처리 - db record 삭제
				result = boardService.deletePostingAttach(attachNo);
			}
		}
	}

}
