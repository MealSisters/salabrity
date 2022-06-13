package board.controller.community;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
import board.model.service.BoardService;
import common.SalabrityFileRenamePolicy;

/**
 * Servlet implementation class CommunityBoardGeneralEnrollServlet
 */
@WebServlet("/board/community/generalEnroll")
public class CommunityBoardGeneralEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/community/communityBoardGeneralEnroll.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 파일저장 경로
			String saveDirectory = getServletContext().getRealPath("/upload/board/community/general");
			System.out.println("saveDirectory = " + saveDirectory);
			
			// 최대 파일 업로드 크기 : 10MB
			int maxPostSize = 1024 * 1024 * 10;
			
			// 인코딩
			String encoding = "utf-8";
			
			// 파일명 재지정 정책 객체
			FileRenamePolicy policy = new SalabrityFileRenamePolicy();
			
			// MultipartRequest객체 생성
			MultipartRequest multiReq = 
					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
			// 사용자 입력값 처리
			String memberId = multiReq.getParameter("memberId");
			String password = multiReq.getParameter("password");
			String title = multiReq.getParameter("title");
			String content = multiReq.getParameter("content");
			
			PostingExt posting = new PostingExt();
			posting.setMemberId(memberId);
			posting.setTitle(title);
			posting.setContent(content);
			
			Enumeration<String> files = multiReq.getFileNames();
			
			while (files.hasMoreElements()) {
				String fileName = files.nextElement();
				File file = multiReq.getFile(fileName);
				
				// 첨부한 파일이 하나라도 있는 경우
				if (file != null) {
					List<PostingAttach> attachments = new ArrayList<>();
					attachments.add(getPostingAttach(multiReq, "upFile"));
					posting.setAttachments(attachments);
				}
			}
			System.out.println("posting@CommunityBoardGeneralEnrollServlet = " + posting);
			
			// 4. 업무 로직 (db insert)
			int result = boardService.insertBoard(posting);
			String msg = result > 0 ? "게시글 등록에 성공했습니다." : "게시글 등록에 실패했습니다.";
			
			// 5. 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/board/community/generalView?no=" + posting.getPostingNo());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	private PostingAttach getPostingAttach(MultipartRequest multiReq, String name) {
		PostingAttach attach = new PostingAttach();
		String originalFilename = multiReq.getOriginalFileName(name);
		String renamedFilename = multiReq.getFilesystemName(name);
		attach.setOriginalFilename(originalFilename);
		attach.setRenamedFilename(renamedFilename);
		return attach;
	}

}
