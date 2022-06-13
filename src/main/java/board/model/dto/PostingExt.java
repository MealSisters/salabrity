package board.model.dto;

import java.sql.Date;
import java.util.List;

public class PostingExt extends Posting {

	private int attachCount;
	private int commentCount;
	private List<PostingAttach> attachments;
	private List<PostingComment> comments;
	
	public PostingExt() {
		super();
	}

	public PostingExt(int attachCount, int commentCount, List<PostingAttach> attachments,
			List<PostingComment> comments) {
		super();
		this.attachCount = attachCount;
		this.commentCount = commentCount;
		this.attachments = attachments;
		this.comments = comments;
	}

	public PostingExt(int postingNo, String boardCode, String memberId, String title, String content, Date regDate,
			int readCount, int likeCount, int postingLevel, int postingRef, int attachCount, int commentCount,
			List<PostingAttach> attachments, List<PostingComment> comments) {
		super(postingNo, boardCode, memberId, title, content, regDate, readCount, likeCount, postingLevel, postingRef);
		this.attachCount = attachCount;
		this.commentCount = commentCount;
		this.attachments = attachments;
		this.comments = comments;
	}

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public List<PostingAttach> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<PostingAttach> attachments) {
		this.attachments = attachments;
	}

	public List<PostingComment> getComments() {
		return comments;
	}

	public void setComments(List<PostingComment> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "PostingExt [attachCount=" + attachCount + ", commentCount=" + commentCount + ", attachments="
				+ attachments + ", comments=" + comments + ", toString()=" + super.toString() + "]";
	}
	
}
