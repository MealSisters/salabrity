package mypage.controller;

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
 * Servlet implementation class BoardQuestionDelete
 */
@WebServlet("/mypage/questionDelete")
public class BoardQuestionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int no = Integer.parseInt(request.getParameter("no"));
//			System.out.println(no);
			
			List<PostingAttach> attachments = mypageService.findByNo(no).getAttachments();
			if(attachments != null && attachments.isEmpty())
				for(PostingAttach attach : attachments) {
					String saveDirectory = getServletContext().getRealPath("/upload/question/mypage");
					File delFile = new File(saveDirectory, attach.getRenamedFilename());
					if(delFile.exists())
						delFile.delete();
//					System.out.println("> " + attach.getRenamedFilename() + "파일 삭제");
				}
			
			int result = mypageService.deleteQuestion(no);
			String msg = "게시글이 삭제되었습니다.";
			
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath()+"/mypage/boardQuestionList");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

}
