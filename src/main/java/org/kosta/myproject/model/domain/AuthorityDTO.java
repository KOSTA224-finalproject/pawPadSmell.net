package org.kosta.myproject.model.domain;

import java.io.Serializable;
// 회원의 권한을 저장하는 클래스 
public class AuthorityDTO implements Serializable {
	private static final long serialVersionUID = 5188280555844223102L;
	private int user_id;
	private String authority;
	
	public AuthorityDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuthorityDTO(int user_id, String authority) {
		super();
		this.user_id = user_id;
		this.authority = authority;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "AuthorityDTO [user_id=" + user_id + ", authority=" + authority + "]";
	}

	

}
