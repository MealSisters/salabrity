package board.model.dto;

import java.sql.Date;
import java.util.List;

public class Question extends Posting {
	private int answerNo;
	private int attachCount;
	private List<PostingAttach> attachments;

	public Question(int answerNo, int attachCount, List<PostingAttach> attachments) {
		super();
		this.answerNo = answerNo;
		this.attachCount = attachCount;
		this.attachments = attachments;
	}

	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Question(int postingNo, BoardCode boardCode, String memberId, String title, String content, Date regDate,
			int readCount, int postingLevel, int postingRef) {
		super(postingNo, boardCode, memberId, title, content, regDate, readCount, postingLevel, postingRef);
		// TODO Auto-generated constructor stub
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	public List<PostingAttach> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<PostingAttach> attachments) {
		this.attachments = attachments;
	}

	@Override
	public String toString() {
		return "Question [answerNo=" + answerNo + ", attachCount=" + attachCount + ", attachments=" + attachments
				+ ", toString()=" + super.toString() + "]";
	}

}
