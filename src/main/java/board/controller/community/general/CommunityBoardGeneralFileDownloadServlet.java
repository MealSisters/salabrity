package board.controller.community.general;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.PostingAttach;
import board.model.service.BoardService;
import common.utill.FileDownload;

/**
 * Servlet implementation class CommunityBoardGeneralFileDownloadServlet
 */
@WebServlet("/board/community/generalFileDownload")
public class CommunityBoardGeneralFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @author 박수진
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 2. 업무 로직
		PostingAttach attach = boardService.findPostingAttachByPostingAttachNo(no);
		
		String saveDirectory = getServletContext().getRealPath("/upload/board/community/general");
		String originalFilename = attach.getOriginalFilename();
		String renamedFilename = attach.getRenamedFilename();
		
		// 3. 응답 처리
		FileDownload.getFileDownload(response, saveDirectory, originalFilename, renamedFilename);
	}

}
