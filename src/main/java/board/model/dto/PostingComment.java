package board.model.dto;

import java.sql.Date;

public class PostingComment {

	private int commentNo;
	private int postingNo;
	private String boardCode;
	private String memberId;
	private String commentContent;
	private String commentLevel;
	private String commentRef;
	private Date regDate;
	
	public PostingComment() {
		super();
	}

	public PostingComment(int commentNo, int postingNo, String boardCode, String memberId, String commentContent,
			String commentLevel, String commentRef, Date regDate) {
		super();
		this.commentNo = commentNo;
		this.postingNo = postingNo;
		this.boardCode = boardCode;
		this.memberId = memberId;
		this.commentContent = commentContent;
		this.commentLevel = commentLevel;
		this.commentRef = commentRef;
		this.regDate = regDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getPostingNo() {
		return postingNo;
	}

	public void setPostingNo(int postingNo) {
		this.postingNo = postingNo;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(String commentLevel) {
		this.commentLevel = commentLevel;
	}

	public String getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(String commentRef) {
		this.commentRef = commentRef;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "PostingComment [commentNo=" + commentNo + ", postingNo=" + postingNo + ", boardCode=" + boardCode
				+ ", memberId=" + memberId + ", commentContent=" + commentContent + ", commentLevel=" + commentLevel
				+ ", commentRef=" + commentRef + ", regDate=" + regDate + "]";
	}
	
}
