package org.kosta.myproject.model.domain;

public class MyPageDTO {
	private MemberDTO memberDTO;
	private String profileFilename;
	private String profileFilepath;
	private String profileText;
	
	public MyPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyPageDTO(MemberDTO memberDTO, String profileFilename, String profileFilepath, String profileText) {
		super();
		this.memberDTO = memberDTO;
		this.profileFilename = profileFilename;
		this.profileFilepath = profileFilepath;
		this.profileText = profileText;
	}

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}

	public String getProfileFilename() {
		return profileFilename;
	}

	public void setProfileFilename(String profileFilename) {
		this.profileFilename = profileFilename;
	}

	public String getProfileFilepath() {
		return profileFilepath;
	}

	public void setProfileFilepath(String profileFilepath) {
		this.profileFilepath = profileFilepath;
	}

	public String getProfileText() {
		return profileText;
	}

	public void setProfileText(String profileText) {
		this.profileText = profileText;
	}

	@Override
	public String toString() {
		return "MyPageDTO [memberDTO=" + memberDTO + ", profileFilename=" + profileFilename + ", profileFilepath="
				+ profileFilepath + ", profileText=" + profileText + "]";
	}
	
}
