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
	private int price;
	private String place;
	private double locinfoX;
	private double locinfoY;
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardDTO(int postId, int rnum, String title, String content, MemberDTO memberDTO, String regdate, int hits,
			BoardTypeDTO boardTypeDTO, CategoryDTO categoryDTO, int commentCount, String filename, String filepath,
			int price, String place, double locinfoX, double locinfoY) {
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
		this.price = price;
		this.place = place;
		this.locinfoX = locinfoX;
		this.locinfoY = locinfoY;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public double getLocinfoX() {
		return locinfoX;
	}
	public void setLocinfoX(double locinfoX) {
		this.locinfoX = locinfoX;
	}
	public double getLocinfoY() {
		return locinfoY;
	}
	public void setLocinfoY(double locinfoY) {
		this.locinfoY = locinfoY;
	}
	@Override
	public String toString() {
		return "BoardDTO [postId=" + postId + ", rnum=" + rnum + ", title=" + title + ", content=" + content
				+ ", memberDTO=" + memberDTO + ", regdate=" + regdate + ", hits=" + hits + ", boardTypeDTO="
				+ boardTypeDTO + ", categoryDTO=" + categoryDTO + ", commentCount=" + commentCount + ", filename="
				+ filename + ", filepath=" + filepath + ", price=" + price + ", place=" + place + ", locinfoX="
				+ locinfoX + ", locinfoY=" + locinfoY + "]";
	}
	
	

	
}
