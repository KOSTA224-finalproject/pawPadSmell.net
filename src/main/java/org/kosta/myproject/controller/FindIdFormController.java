package org.kosta.myproject.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindIdFormController {

	@RequestMapping("/guest/findIdForm")
	public String FindIdForm() {
		
		return "member/findIdForm";
	}

}
