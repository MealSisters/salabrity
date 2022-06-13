package board.model.dto;

public class BoardCategory {
	
	private BoardCode boardCode;
	private String boardName;
	
	public BoardCategory() {
		super();
	}

	public BoardCategory(BoardCode boardCode, String boardName) {
		super();
		this.boardCode = boardCode;
		this.boardName = boardName;
	}

	public BoardCode getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(BoardCode boardCode) {
		this.boardCode = boardCode;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	@Override
	public String toString() {
		return "BoardCategory [boardCode=" + boardCode + ", boardName=" + boardName + "]";
	}
	
}
