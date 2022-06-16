package board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
import common.SalabrityFileRenamePolicy;

/**
 * BoardUtil
 * @author 박수진
 */
public class BoardUtil {

	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String saveDirectory) throws IOException {
		MultipartRequest multiReq = 
				new MultipartRequest(request, 
						saveDirectory, 
						1024 * 1024 * 10, 
						"utf-8", 
						new SalabrityFileRenamePolicy());
		return multiReq;
	}
	
	public static void getPostingAttach(MultipartRequest multiReq, PostingExt posting) {
		// 업로드 파일
		File attach1 = multiReq.getFile("attach1");
		File attach2 = multiReq.getFile("attach2");
		File attach3 = multiReq.getFile("attach3");
		
		// 첨부한 파일이 하나라도 있는 경우
		if(attach1 != null || attach2 != null || attach3 != null) {
			List<PostingAttach> attachments = new ArrayList<>();
			if(attach1 != null) {
				attachments.add(getPostingAttach(multiReq, "attach1"));
			}
			if(attach2 != null) {
				attachments.add(getPostingAttach(multiReq, "attach2"));
			}
			if(attach3 != null) {
				attachments.add(getPostingAttach(multiReq, "attach3"));
			}				
			posting.setAttachments(attachments);
		}
	}
	
	public static PostingAttach getPostingAttach(MultipartRequest multiReq, String name) {
		PostingAttach attach = new PostingAttach();
		String originalFilename = multiReq.getOriginalFileName(name);
		String renamedFilename = multiReq.getFilesystemName(name);
		attach.setOriginalFilename(originalFilename);
		attach.setRenamedFilename(renamedFilename);
		return attach;
	}
	
	public static void getReplacePostingContent(PostingExt posting) {
		posting.setTitle(posting.getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
		posting.setContent(posting.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
		posting.setContent(posting.getContent().replaceAll("\n", "<br/>"));
	}

}
