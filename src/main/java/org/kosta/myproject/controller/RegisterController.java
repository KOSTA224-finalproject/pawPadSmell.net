package org.kosta.myproject.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class RegisterController {
	
	@Resource
	private MemberService memberService;
	
	@PostMapping("guest/register")
	public String register(HttpServletRequest request, MemberDTO memberDTO) {
		StringBuilder sb=new StringBuilder();
		   sb.append(request.getParameter("address1"));
		      sb.append(" ");
		      sb.append(request.getParameter("address2"));
		      sb.append(" ");
		      sb.append(request.getParameter("address3"));
		      sb.append(" ");
		      sb.append(request.getParameter("address4"));
		      memberDTO.setAddress(sb.toString());
		
		//등록시 service에서 비밀번호를 암호화 한다 
		memberService.registerMember(memberDTO);
		System.out.println(memberDTO.toString());
		System.out.println(memberDTO.getMemberId());
		return "redirect:/guest/registerResult";
	}

	@RequestMapping("guest/registerResult")
	public String registerResult() {
		System.out.println("test");
		return "member/loginForm";
	}

}
