package board.controller.notice;

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
 * @author 박수진
 * Servlet implementation class NoticeBoardFileDownloadServlet
 */
@WebServlet("/board/community/noticeFileDownload")
public class NoticeBoardFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자 입력값 처리
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 2. 업무 로직
		PostingAttach attach = boardService.findPostingAttachByPostingAttachNo(no);
		System.out.println(attach);
		
		String saveDirectory = getServletContext().getRealPath("/upload/board/notice");
		String originalFilename = attach.getOriginalFilename();
		String renamedFilename = attach.getRenamedFilename();
		
		// 3. 응답 처리
		FileDownload.getFileDownload(response, saveDirectory, originalFilename, renamedFilename);
	}

}
