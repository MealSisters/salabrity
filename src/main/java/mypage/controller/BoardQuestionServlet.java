package mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import board.model.dto.BoardCode;
import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
import common.SalabrityFileRenamePolicy;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class BoardQuestionView
 */
@WebServlet("/mypage/boardQuestion")
public class BoardQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MypageService mypageService = new MypageService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/mypage/boardQuestion.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String saveDirectory = getServletContext().getRealPath("/upload/question/mypage");
			System.out.println("saveDirectory = " + saveDirectory);
			
			int maxPostSize = 1024 * 1024 * 10;
			
//			// d. 인코딩
			String encoding = "utf-8";
		
			MultipartRequest multiReq = 
					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new SalabrityFileRenamePolicy());
			
			// 사용자 입력 값
			String memberId = multiReq.getParameter("memberId");
			String title = multiReq.getParameter("title");
			String content = multiReq.getParameter("content");
			
			PostingExt posting = new PostingExt();
			posting.setBoardCode(BoardCode.Q1);
			posting.setMemberId(memberId);
			posting.setTitle(title);
			posting.setContent(content);
			System.out.println("question" + posting);
			
			File upFile1 = multiReq.getFile("upFile1");
			File upFile2 = multiReq.getFile("upFile2");
			
			
			// 첨부한 파일이 하나라도 있는 경우
			if(upFile1 != null || upFile2 != null) {
				List<PostingAttach> attachments = new ArrayList<>();
				if(upFile1 != null) 
					attachments.add(getAttachment(multiReq, "upFile1"));
				if(upFile2 != null)
					attachments.add(getAttachment(multiReq, "upFile2"));
				
				posting.setAttachments(attachments); // 없으면 null처리			
			}
			System.out.println("체크체크questionEnroll = " + posting);
			
			int result = mypageService.insertQuestion(posting);
			
			response.sendRedirect(request.getContextPath() + "/mypage/boardQuestionList");
//			response.sendRedirect(request.getContextPath() + "/mypage/boardQuestionView?no=" + posting.getPostingNo());
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} 
	}
	
	private PostingAttach getAttachment(MultipartRequest multiReq, String name) {
		PostingAttach attach = new PostingAttach();
		String OriginalFilename = multiReq.getOriginalFileName(name); // 업로드한 파일명 가져오기
		String renamedFilename = multiReq.getFilesystemName(name); // 저장된 파일명
		attach.setOriginalFilename(OriginalFilename);
		attach.setRenamedFilename(renamedFilename);
		return attach;
	}
	
}
