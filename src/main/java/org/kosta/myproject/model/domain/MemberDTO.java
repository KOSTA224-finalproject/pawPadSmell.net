package org.kosta.myproject.model.domain;

import java.io.Serializable;

public class MemberDTO implements Serializable {
	private static final long serialVersionUID = 6440047762418162093L;
	private int memberId;
	private String email;
	private String name;
	private String nickname;
	private String address;
	private String phonenum;
	private String password;
	private String birth;
	private int enable;

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int memberId, String email, String name, String nickname, String address, String phonenum,
			String password, String birth, int enable) {
		super();
		this.memberId = memberId;
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.address = address;
		this.phonenum = phonenum;
		this.password = password;
		this.birth = birth;
		this.enable = enable;
	}



	public MemberDTO(String email, String name, String nickname, String address, String phonenum, String password,
			String birth, int enable) {
		super();
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.address = address;
		this.phonenum = phonenum;
		this.password = password;
		this.birth = birth;
		this.enable = enable;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", email=" + email + ", name=" + name + ", nickname=" + nickname
				+ ", address=" + address + ", phonenum=" + phonenum + ", password=" + password + ", birth=" + birth
				+ ", enable=" + enable + "]";
	}

}
