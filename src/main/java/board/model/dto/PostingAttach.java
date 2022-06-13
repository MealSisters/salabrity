package board.model.dto;

import java.sql.Date;

public class PostingAttach {

	private int postingAttachNo;
	private int postingNo;
	private String boardCode;
	private String originalFilename;
	private String renamedFilename;
	private Date regDate;
	
	public PostingAttach() {
		super();
	}

	public PostingAttach(int postingAttachNo, int postingNo, String boardCode, String originalFilename,
			String renamedFilename, Date regDate) {
		super();
		this.postingAttachNo = postingAttachNo;
		this.postingNo = postingNo;
		this.boardCode = boardCode;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
		this.regDate = regDate;
	}

	public int getPostingAttachNo() {
		return postingAttachNo;
	}

	public void setPostingAttachNo(int postingAttachNo) {
		this.postingAttachNo = postingAttachNo;
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

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "PostingAttach [postingAttachNo=" + postingAttachNo + ", postingNo=" + postingNo + ", boardCode="
				+ boardCode + ", originalFilename=" + originalFilename + ", renamedFilename=" + renamedFilename
				+ ", regDate=" + regDate + "]";
	}
	
}
