package board.model.dto;

import java.sql.Date;

public class PostingComment {

	private int commentNo;
	private int postingNo;
	private BoardCode boardCode;
	private String memberId;
	private String commentContent;
	private int commentLevel;
	private int commentRef;
	private Date regDate;
	
	public PostingComment() {
		super();
	}

	public PostingComment(int commentNo, int postingNo, BoardCode boardCode, String memberId, String commentContent,
			int commentLevel, int commentRef, Date regDate) {
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

	public BoardCode getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(BoardCode boardCode) {
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

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
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
