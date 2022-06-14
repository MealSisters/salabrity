package board.controller.community.hacks;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.model.dto.BoardCode;
import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
import board.model.service.BoardService;
import common.SalabrityFileRenamePolicy;

/**
 * Servlet implementation class CommunityBoardGeneralUpdateServlet
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
			// 2. MultipartRequest객체 생성		
			// 파일저장 경로
			String saveDirectory = getServletContext().getRealPath("/upload/board/community/hacks");

			MultipartRequest multiReq =
					new MultipartRequest(
							request, 
							saveDirectory, 
							1024 * 1024 * 10, 
							"utf-8", 
							new SalabrityFileRenamePolicy());
			
			// 3. 사용자 입력값 처리
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
			
			// 업로드 파일
			File attach1 = multiReq.getFile("attach1");
			File attach2 = multiReq.getFile("attach2");
			File attach3 = multiReq.getFile("attach3");
			
			// 첨부파일 처리
			if(attach1 != null || attach2 != null || attach3 != null) {
				List<PostingAttach> attachments = new ArrayList<>();
				if(attach1 != null) {
					attachments.add(getPostingAttach(multiReq, no, "attach1"));
				}
				if(attach2 != null) {
					attachments.add(getPostingAttach(multiReq, no, "attach2"));
				}
				if(attach3 != null) {
					attachments.add(getPostingAttach(multiReq, no, "attach3"));
				}
				posting.setAttachments(attachments);
			}
			
			// 4. 업무 로직
			int result = boardService.updatePosting(posting);
			String msg = result > 0 ? "게시글 수정에 성공했습니다." : "게시글 수정에 실패했습니다.";
						
			// 첨부 파일 삭제 처리
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
					System.out.println("> " + attachNo +"번 첨부파일 삭제!");
				}
			}
			
			// 5. 리다이렉트
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/board/community/hacksView?no=" + no);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	private PostingAttach getPostingAttach(MultipartRequest multiReq, int postingNo, String name) {
		PostingAttach attach = new PostingAttach();
		attach.setPostingNo(postingNo);
		String originalFilename = multiReq.getOriginalFileName(name); // 업로드한 파일명
		String renamedFilename = multiReq.getFilesystemName(name); // 저장된 파일명
		attach.setOriginalFilename(originalFilename);
		attach.setRenamedFilename(renamedFilename);
		return attach;
	}

}
