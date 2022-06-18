package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.PostingAttach;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class AdminAnswerDeleteServler
 */
@WebServlet("/admin/answerDelete")
public class AdminAnswerDeleteServler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int answerNo = Integer.parseInt(request.getParameter("no"));
			
			String saveDirectory = getServletContext().getRealPath("/upload/board/qna");
			
			List<PostingAttach> attachments = mypageService.findByNo(answerNo).getAttachments();
			if(attachments != null && attachments.isEmpty())
				for(PostingAttach attach : attachments) {
					File delFile = new File(saveDirectory, attach.getRenamedFilename());
					if(delFile.exists())
						delFile.delete();
					System.out.println("> " + attach.getRenamedFilename() + "파일 삭제");
				}
			
			int result = mypageService.deleteQuestion(answerNo);
			String msg = "게시글이 삭제되었습니다.";
			
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath()+"/admin/questionList");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


}
