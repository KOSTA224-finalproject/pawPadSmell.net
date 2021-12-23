package org.kosta.myproject.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.myproject.model.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class AjaxController {
	@Resource
	private MemberService memberService;
	@RequestMapping("guest/idcheck")
	@ResponseBody
	public int idcheckAjax(String userId) {
		
		System.out.println(userId);
		return memberService.idcheck(userId);
	}
	@RequestMapping("guest/nickcheck")
	@ResponseBody
	public int idcheck1Ajax(String userNickname) {
		
		System.out.println(userNickname);
		return memberService.nickcheck(userNickname);
	}
}
