package org.kosta.myproject.model.domain;

public class StoreDTO {
	private BoardDTO boardDTO;
	private int price;
	private String place;
	private double locinfoX;
	private double locinfoY;
	public StoreDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoreDTO(BoardDTO boardDTO, int price, String place, double locinfoX, double locinfoY) {
		super();
		this.boardDTO = boardDTO;
		this.price = price;
		this.place = place;
		this.locinfoX = locinfoX;
		this.locinfoY = locinfoY;
	}
	public BoardDTO getBoardDTO() {
		return boardDTO;
	}
	public void setBoardDTO(BoardDTO boardDTO) {
		this.boardDTO = boardDTO;
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
		return "StoreDTO [boardDTO=" + boardDTO + ", price=" + price + ", place=" + place + ", locinfoX=" + locinfoX
				+ ", locinfoY=" + locinfoY + "]";
	}
	
}
