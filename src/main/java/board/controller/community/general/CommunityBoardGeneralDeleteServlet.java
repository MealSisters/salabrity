package board.controller.community.general;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.dto.BoardCode;
import board.model.dto.PostingAttach;
import board.model.service.BoardService;

/**
 * @author 박수진
 * Servlet implementation class CommunityBoardGeneralDeleteServlet
 */
@WebServlet("/board/community/generalDelete")
public class CommunityBoardGeneralDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 사용자 입력값 처리
			int no = Integer.parseInt(request.getParameter("no"));
			BoardCode boardCode = BoardCode.valueOf(request.getParameter("boardCode"));
			
			// 2. 업무 로직
			// 첨부파일 존재시 삭제
			List<PostingAttach> attachments = boardService.findByPostingNo(no).getAttachments();
			String path = "/upload/board/community/general";
			deletePostingAttach(attachments, path);
			
			// posting테이블 레코드 삭제
			int result = boardService.deletePosting(no);
			
			// 3. 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", "게시물 삭제가 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/board/community/general?boardCode=" + boardCode);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void deletePostingAttach(List<PostingAttach> attachments, String path) {
		if(attachments != null && !attachments.isEmpty()) {
			for(PostingAttach attach : attachments) {
				String delDirectory = getServletContext().getRealPath(path);
				File delFilename = new File(delDirectory, attach.getRenamedFilename());
				if(delFilename.exists()) {
					delFilename.delete();
				}
			}
		}
	}

}
