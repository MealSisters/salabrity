package board.model.dto;

public class PostingLike {

	private int postingNo;
	private BoardCode boardCode;
	private String memberId;
	private String status;
	
	public PostingLike() {
		super();
	}

	public PostingLike(int postingNo, BoardCode boardCode, String memberId, String status) {
		super();
		this.postingNo = postingNo;
		this.boardCode = boardCode;
		this.memberId = memberId;
		this.status = status;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PostingLike [postingNo=" + postingNo + ", boardCode=" + boardCode + ", memberId=" + memberId
				+ ", status=" + status + "]";
	}
	
}
