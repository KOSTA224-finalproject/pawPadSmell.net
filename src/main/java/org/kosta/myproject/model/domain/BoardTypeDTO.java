package org.kosta.myproject.model.domain;

public class BoardTypeDTO {
	private int boardId;
	private String boardName;
	public BoardTypeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardTypeDTO(int boardId, String boardName) {
		super();
		this.boardId = boardId;
		this.boardName = boardName;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	@Override
	public String toString() {
		return "BoardTypeDTO [boardId=" + boardId + ", boardName=" + boardName + "]";
	}

}
