package org.kosta.myproject.model.domain;

public class CommentBoardDTO {
	private int commentId;
	private String commentContent;
	private String regdate;
	private MemberDTO memberDTO;
	private BoardDTO boardDTO;
	public CommentBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentBoardDTO(int commentId, String commentContent, String regdate, MemberDTO memberDTO,
			BoardDTO boardDTO) {
		super();
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.regdate = regdate;
		this.memberDTO = memberDTO;
		this.boardDTO = boardDTO;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public BoardDTO getBoardDTO() {
		return boardDTO;
	}
	public void setBoardDTO(BoardDTO boardDTO) {
		this.boardDTO = boardDTO;
	}
	@Override
	public String toString() {
		return "CommentBoardDTO [commentId=" + commentId + ", commentContent=" + commentContent + ", regdate=" + regdate
				+ ", memberDTO=" + memberDTO + ", boardDTO=" + boardDTO + "]";
	}
	
}
