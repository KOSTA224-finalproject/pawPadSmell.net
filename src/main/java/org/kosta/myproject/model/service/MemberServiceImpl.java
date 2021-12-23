package org.kosta.myproject.model.service;

import java.util.List;

import org.kosta.myproject.model.domain.AuthorityDTO;
import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	private MemberMapper memberMapper;
	/*
	 * 비밀번호 암호화처리를 위한 객체를 주입받는다 
	 * spring boot : org.kosta.config.security.WebSecurityConfig 에 @Bean 설정 되어 있음 
	 * spring legacy: spring-security.xml 에서 bean 설정이 되어 있음
	 */
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	public MemberServiceImpl(MemberMapper memberMapper, BCryptPasswordEncoder passwordEncoder) {
		super();
		this.memberMapper = memberMapper;
		this.passwordEncoder = passwordEncoder;
	}

	// 회원가입시 반드시 권한까지 부여되도록 트랜잭션 처리한다
	@Transactional
	@Override
	public void registerMember(MemberDTO memberDTO) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(memberDTO.getPassword());
		memberDTO.setPassword(encodedPwd);
		memberMapper.registerMember(memberDTO);
		System.out.println(memberDTO.getMemberId());
		// 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
		AuthorityDTO authority = new AuthorityDTO(memberDTO.getMemberId(), "ROLE_MEMBER");
		memberMapper.registerRole(authority);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(memberDTO.getPassword());
		memberDTO.setPassword(encodePassword);
		memberMapper.updateMember(memberDTO);
	}
	@Override
	public MemberDTO findMemberById(String email) {
		return memberMapper.findMemberById(email);
	}
	@Override
	public MemberDTO findEmailByName(String name) {
		MemberDTO dto= memberMapper.findEmailByName(name);
		return dto;
	}

	@Override
	public List<String> getAddressList() {
		return memberMapper.getAddressList();
	}

	@Override
	public List<MemberDTO> findMemberListByAddress(String address) {
		return memberMapper.findMemberListByAddress(address);
	}

	@Override
	public int getMemberCount() {
		return memberMapper.getMemberCount();
	}

	@Override
	public int idcheck(String id) {
		int count = memberMapper.idcheck(id);
		return (count == 0) ? 0 : 1;
	}
	
	@Override
	public int nickcheck(String userNickname) {
		int count = memberMapper.nickcheck(userNickname);
		return (count == 0) ? 0 : 1;
	}

	@Override
	public List<AuthorityDTO> findAuthorityByUsername(String username) {
		return memberMapper.findAuthorityByUsername(username);
	}
}
