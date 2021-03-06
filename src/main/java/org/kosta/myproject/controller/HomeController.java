package org.kosta.myproject.controller;

import javax.annotation.Resource;

import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.mapper.BoardMapper;
import org.kosta.myproject.model.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Resource
	private BoardMapper boardMapper;
	@Resource
	private MemberMapper memberMapper;
	@Autowired
	public HomeController(BoardMapper boardMapper) {
		super();
		this.boardMapper = boardMapper;
	}

	@RequestMapping(value = { "/home", "/" })
	public String home(Authentication authentication, Model model) {// Authentication : Spring Security의 인증객체
		// Spring Security Authentication 인증객체는 아래처럼 SecurityContext 에 저장되어 있다
		// System.out.println("home
		// "+SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		// Principal(사전적 의미:본인 ) 객체는 인증된 회원 정보 객체를 말한다
		// org.kosta.myproject.config.security.MemberAuthenticationProvider 에서 할당
		if (authentication != null) {
			System.out.println("Home: 인증받은 사용자 " + authentication.getPrincipal() + authentication.getName());
			model.addAttribute("board", boardMapper.getComId());
			model.addAttribute("list", boardMapper.getCategoryList());
		} else
			System.out.println("Home: 인증받지 않은 사용자");
		return "templates/home.tiles";
	}

	/*
	 * 로그인 하였으나 권한이 없는 요청을 하였을 경우 보여지는 페이지를 지정
	 * org.kosta.myproject.config.security.WebSecurityConfig 에서 아래와 같이 설정되어 있음
	 * http.exceptionHandling().accessDeniedPage("/accessDeniedView"); 일반
	 * 회원(ROLE_MEMBER)로 로그인한 후 관리자 서비스 AdminController에 접근해서 테스트 해본다
	 * http://localhost:7777/admin/main
	 */
	@RequestMapping("accessDeniedView")
	public String accessDeniedView() {
		return "auth/accessDeniedView";
	}

	@RequestMapping("/second-list")
	public String secondHandBoards(Authentication authentication, Model model) {
		model.addAttribute("board", boardMapper.getSecId());
		model.addAttribute("list", boardMapper.getCategoryList());
		return "/board/second-list";
	}
	@RequestMapping("/community-list")
	public String CommunityBoards(Model model) {
		model.addAttribute("board", boardMapper.getComId());
		model.addAttribute("list", boardMapper.getCategoryList());
		return "/board/community-list";
	}
}
