package org.kosta.myproject.model.service;

import java.util.List;

import org.kosta.myproject.model.domain.AuthorityDTO;
import org.kosta.myproject.model.domain.MemberDTO;

public interface MemberService {
	
	MemberDTO findMemberById(String email);

	List<String> getAddressList();

	List<MemberDTO> findMemberListByAddress(String address);

	int getMemberCount();

	void updateMember(MemberDTO vo);

	void registerMember(MemberDTO vo);

	int idcheck(String id);
	
	List<AuthorityDTO> findAuthorityByUsername(String username);

	int nickcheck(String userNickname);

	MemberDTO findEmailByName(String name);

}
