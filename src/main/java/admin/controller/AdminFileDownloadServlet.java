package admin.controller;

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
 * Servlet implementation class AdminFileDownloadServlet
 */
@WebServlet("/admin/fileDownload")
public class AdminFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int no = Integer.parseInt(request.getParameter("no"));
			
			PostingAttach attach = boardService.findPostingAttachByPostingAttachNo(no);
			System.out.println(attach);
			
			String saveDirectory = getServletContext().getRealPath("/upload/question/mypage");
			String originalFilename = attach.getOriginalFilename();
			String renamedFilename = attach.getRenamedFilename();
			
			FileDownload.getFileDownload(response, saveDirectory, originalFilename, renamedFilename);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
