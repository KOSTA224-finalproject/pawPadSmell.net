package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.domain.AuthorityDTO;
import org.kosta.myproject.model.domain.MemberDTO;
@Mapper
public interface MemberMapper {

	MemberDTO findMemberById(String email);

	List<String> getAddressList();

	List<MemberDTO> findMemberListByAddress(String address);	

	int getMemberCount();

	void updateMember(MemberDTO vo);

	void registerMember(MemberDTO vo);

	int idcheck(String id);

	List<AuthorityDTO> findAuthorityByUsername(String username);

	void registerRole(AuthorityDTO authority);

	int nickcheck(String userNickname);

	MemberDTO findEmailByName(String name);
	
	MemberDTO getMember(int memberId);
	
	

}