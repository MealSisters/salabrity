package board.model.dto;

import java.sql.Date;
import java.util.List;

public class PostingExt extends Posting {

	private int attachCount;
	private int commentCount;
	private int likeCount;
	private List<PostingAttach> attachments;
	private List<PostingComment> comments;
	private List<PostingLike> likes;
	
	public PostingExt() {
		super();
	}

	public PostingExt(int attachCount, int commentCount, int likeCount, List<PostingAttach> attachments,
			List<PostingComment> comments, List<PostingLike> likes) {
		super();
		this.attachCount = attachCount;
		this.commentCount = commentCount;
		this.likeCount = likeCount;
		this.attachments = attachments;
		this.comments = comments;
		this.likes = likes;
	}

	public PostingExt(int postingNo, BoardCode boardCode, String memberId, String title, String content, Date regDate,
			int readCount, int postingLevel, int postingRef, int attachCount, int commentCount, int likeCount,
			List<PostingAttach> attachments, List<PostingComment> comments, List<PostingLike> likes) {
		super(postingNo, boardCode, memberId, title, content, regDate, readCount, postingLevel, postingRef);
		this.attachCount = attachCount;
		this.commentCount = commentCount;
		this.likeCount = likeCount;
		this.attachments = attachments;
		this.comments = comments;
		this.likes = likes;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
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

	public List<PostingLike> getLikes() {
		return likes;
	}

	public void setLikes(List<PostingLike> likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return "PostingExt [attachCount=" + attachCount + ", commentCount=" + commentCount + ", likeCount=" + likeCount
				+ ", attachments=" + attachments + ", comments=" + comments + ", likes=" + likes + ", toString()="
				+ super.toString() + "]";
	}
	
}
