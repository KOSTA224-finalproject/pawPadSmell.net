package org.kosta.myproject.model.domain;

public class BoardDTO {
	private int postId;
	private int rnum;
	private String title;
	private String content;
	public MemberDTO memberDTO;
	private String regdate;
	private int hits;
	private BoardTypeDTO boardTypeDTO; 
	private CategoryDTO categoryDTO;
	private int commentCount;
	private String filename;
	private String filepath;
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int postId, int rnum, String title, String content, MemberDTO memberDTO, String regdate, int hits,
			BoardTypeDTO boardTypeDTO, CategoryDTO categoryDTO, int commentCount, String filename, String filepath) {
		super();
		this.postId = postId;
		this.rnum = rnum;
		this.title = title;
		this.content = content;
		this.memberDTO = memberDTO;
		this.regdate = regdate;
		this.hits = hits;
		this.boardTypeDTO = boardTypeDTO;
		this.categoryDTO = categoryDTO;
		this.commentCount = commentCount;
		this.filename = filename;
		this.filepath = filepath;
	}

	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
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
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public BoardTypeDTO getBoardTypeDTO() {
		return boardTypeDTO;
	}
	public void setBoardTypeDTO(BoardTypeDTO boardTypeDTO) {
		this.boardTypeDTO = boardTypeDTO;
	}
	public CategoryDTO getCategoryDTO() {
		return categoryDTO;
	}
	public void setCategoryDTO(CategoryDTO categoryDTO) {
		this.categoryDTO = categoryDTO;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}



	@Override
	public String toString() {
		return "BoardDTO [postId=" + postId + ", rnum=" + rnum + ", title=" + title + ", content=" + content
				+ ", memberDTO=" + memberDTO + ", regdate=" + regdate + ", hits=" + hits + ", boardTypeDTO="
				+ boardTypeDTO + ", categoryDTO=" + categoryDTO + ", commentCount=" + commentCount + ", filename="
				+ filename + ", filepath=" + filepath + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	

	
}
