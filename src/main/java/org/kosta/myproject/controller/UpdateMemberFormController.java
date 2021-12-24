package org.kosta.myproject.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.service.MemberService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UpdateMemberFormController {
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping("updateForm")
	public String updateForm() {
		System.out.println("업데이트폼 통과");
		return "member/updateMemberForm";
	}
	

	@PostMapping("updateMemberAction")
	//첫번째 매개변수 Authentication : Spring Security 인증 정보 , 두번째 매개변수 memberDTO : 수정폼에서 전달받는 데이터 
	public String updateMemberAction(HttpServletRequest request ,Authentication authentication, MemberDTO memberDTO) {
		
		StringBuilder sb=new StringBuilder();
		   sb.append(request.getParameter("address1"));
		      sb.append(" ");
		      sb.append(request.getParameter("address2"));
		      sb.append(" ");
		      sb.append(request.getParameter("address3"));
		      sb.append(" ");
		      sb.append(request.getParameter("address4"));
		      memberDTO.setAddress(sb.toString());
		
		MemberDTO dto = (MemberDTO)authentication.getPrincipal();			
		memberService.updateMember(memberDTO);//service에서 변경될 비밀번호를 암호화한다 
		// 수정한 회원정보로 g_member 회원정보를 업데이트한다
		dto.setPassword(memberDTO.getPassword());
		dto.setName(memberDTO.getName());
		dto.setAddress(memberDTO.getAddress());	
		dto.setPhonenum(memberDTO.getPhonenum());
		dto.setBirth(memberDTO.getBirth());
		System.out.println(dto.toString());
		return "redirect:updateMember";
	}
	
	@RequestMapping("updateMember")
	public String updateMember() {
		return "member/update_result";
	}
	
}
