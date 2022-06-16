package board.model.dto;

import java.sql.Date;

public class Posting {

	private int postingNo;
	private BoardCode boardCode;
	private String memberId;
	private String title;
	private String content;
	private Date regDate;
	private int readCount;
	private int postingLevel;
	private int postingRef;
	
	public Posting() {
		super();
	}

	public Posting(int postingNo, BoardCode boardCode, String memberId, String title, String content, Date regDate,
			int readCount, int postingLevel, int postingRef) {
		super();
		this.postingNo = postingNo;
		this.boardCode = boardCode;
		this.memberId = memberId;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
		this.postingLevel = postingLevel;
		this.postingRef = postingRef;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getPostingLevel() {
		return postingLevel;
	}

	public void setPostingLevel(int postingLevel) {
		this.postingLevel = postingLevel;
	}

	public int getPostingRef() {
		return postingRef;
	}

	public void setPostingRef(int postingRef) {
		this.postingRef = postingRef;
	}

	@Override
	public String toString() {
		return "Posting [postingNo=" + postingNo + ", boardCode=" + boardCode + ", memberId=" + memberId + ", title="
				+ title + ", content=" + content + ", regDate=" + regDate + ", readCount=" + readCount
				+ ", postingLevel=" + postingLevel + ", postingRef=" + postingRef + "]";
	}
	
}
