package org.kosta.myproject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginFormController {

	@RequestMapping("guest/loginForm")
	public String loginForm() {
		
		return "member/loginForm";
	}

}
