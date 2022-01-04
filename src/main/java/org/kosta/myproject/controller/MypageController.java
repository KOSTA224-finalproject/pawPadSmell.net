package org.kosta.myproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.myproject.model.domain.BoardDTO;
import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.domain.MyPageDTO;
import org.kosta.myproject.model.domain.PagingBean;
import org.kosta.myproject.model.mapper.BoardMapper;
import org.kosta.myproject.model.mapper.MemberMapper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MypageController {
	@Resource
	MemberMapper memberMapper;
	@Resource
	BoardMapper boardMapper;

	@RequestMapping("member/mypage")
	public String Mypage( Authentication authentication,MemberDTO memberDTO, Model model, String pageNo,
			MyPageDTO mypageDTO) {

		memberDTO = (MemberDTO) authentication.getPrincipal();
//		memberDTO = (MemberDTO) authentication;
		System.out.println(memberDTO);
		int totalpostcount = boardMapper.getMypageCount(memberDTO.getMemberId());
		System.out.println(boardMapper.myPageProfile(memberDTO));
		model.addAttribute("mypage",boardMapper.myPageProfile(memberDTO));
		PagingBean pagingBean = null;

		if (pageNo == null)
			pagingBean = new PagingBean(totalpostcount);
		else {
			pagingBean = new PagingBean(totalpostcount, Integer.parseInt(pageNo));
		}

		model.addAttribute("pagingBean", pagingBean);
		model.addAttribute("list", boardMapper.getAllMypage(memberDTO.getMemberId(), pagingBean.getStartRowNumber(),
				pagingBean.getEndRowNumber()));
		return "member/mypage.tiles2";
	}

	@RequestMapping("member/mypage/upload")
	public String Upload(HttpSession session,Model model, Authentication authentication, MemberDTO memberDTO, String pageNo,MyPageDTO mypageDTO,MultipartFile file) throws IllegalStateException, IOException {
		memberDTO = (MemberDTO) authentication.getPrincipal();
	   
	       //1. 실제 파일이 저장되는 경로 지정
	       //System.getProperty(“user.dir”) -> 현재 작업 디렉토리
		String projectPath = session.getServletContext().getRealPath("/")+"myfiles";
	        
	    //2. UUID로 식별자 랜덤으로 이름 만들어줌
	        //UUID : 네트워크 상에서 고유성이 보장되는 id를 만들기 위한 표준 규약
	       //랜덤으로 파일 이름 생성 
	       UUID uuid = UUID.randomUUID();
	       
	    //3.    uuid+원래 파일이름 = 새로운 파일이름 // 같은 이름의 파일을 업로드 시 기존의 파일 덮어쓰기 방지를 위함.
	       String fileName = uuid + "_" + file.getOriginalFilename();
	       
	    //4.  파일 넣어주는 껍데기 : 파일 생성해주되 경로 설정하고 파일 이름도 받겠다.
	       //File(File parent, String Child) parent 객체 폴더의 child 라는 파일에 대한 File 객체를 생성
	       //File saveFile = new File(projectPath, fileName);
	       //(저장할 폴더 이름, 저장할 파일 이름)
	       File saveFile = new File(projectPath, fileName);
	       
	    //5.  업로드된 파일 저장
	       file.transferTo(saveFile); //exception 경고 뜸. throws 해준다.
	       
	    //6. db에 파일명, 파일 경로 저장
	       mypageDTO.setProfileFilename(fileName);
	       mypageDTO.setProfileFilepath(fileName);
	       mypageDTO.setMemberDTO(memberDTO);
	       System.out.println(memberDTO.toString());
	       System.out.println("mypageDTO:"+" "+mypageDTO);
	       boardMapper.myPageWrite(mypageDTO);

		
	      
		
		int totalpostcount = boardMapper.getMypageCount(memberDTO.getMemberId());

		PagingBean pagingBean = null;

		if (pageNo == null)
			pagingBean = new PagingBean(totalpostcount);

		else {
			pagingBean = new PagingBean(totalpostcount, Integer.parseInt(pageNo));
		}

		model.addAttribute("pagingBean", pagingBean);
		model.addAttribute("list", boardMapper.getAllMypage(memberDTO.getMemberId(), pagingBean.getStartRowNumber(),
				pagingBean.getEndRowNumber()));
		 model.addAttribute("mypage",boardMapper.myPageProfile(memberDTO));
		return "member/profile_ok";

	}
	
	@RequestMapping("member/getProfile")
	@ResponseBody
	public void getProfile(HttpSession session, Authentication authentication,MyPageDTO mypageDTO,MultipartFile file) throws IllegalStateException, IOException{
		// System.out.println(mypageDTO.toString());
		System.out.println(session.getServletContext().getRealPath("/"));
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		 mypageDTO.setMemberDTO(memberDTO);
	       //1. 실제 파일이 저장되는 경로 지정
	       //System.getProperty(“user.dir”) -> 현재 작업 디렉토리
	       // String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files";
		  String projectPath = session.getServletContext().getRealPath("/")+"myfiles";
	            
	    //2. UUID로 식별자 랜덤으로 이름 만들어줌
	        //UUID : 네트워크 상에서 고유성이 보장되는 id를 만들기 위한 표준 규약
	       //랜덤으로 파일 이름 생성 
	       UUID uuid = UUID.randomUUID();
	       
	       //C:\kosta224\framework-finalproject_PawPadSmell\git-pawpadsmell\src\main\webapp
	       
	       
	       
	    //3.    uuid+원래 파일이름 = 새로운 파일이름 // 같은 이름의 파일을 업로드 시 기존의 파일 덮어쓰기 방지를 위함.
	       String fileName = uuid + "_" + file.getOriginalFilename();
	       
	    //4.  파일 넣어주는 껍데기 : 파일 생성해주되 경로 설정하고 파일 이름도 받겠다.
	       //File(File parent, String Child) parent 객체 폴더의 child 라는 파일에 대한 File 객체를 생성
	       //File saveFile = new File(projectPath, fileName);
	       //(저장할 폴더 이름, 저장할 파일 이름)
	       File saveFile = new File(projectPath, fileName);
	       
	    //5.  업로드된 파일 저장
	       file.transferTo(saveFile); //exception 경고 뜸. throws 해준다.
	       
	    //6. db에 파일명, 파일 경로 저장
	       mypageDTO.setProfileFilename(fileName);
	       mypageDTO.setProfileFilepath(fileName);
	       mypageDTO.setMemberDTO(memberDTO);
	       System.out.println(memberDTO.toString());
	       System.out.println("mypageDTO:"+" "+mypageDTO);
	       boardMapper.updateProfile(mypageDTO);
		
	}
	
	@RequestMapping("member/{memberId}")
	public String memberInfo( Authentication authentication, Model model, String pageNo,
		MyPageDTO mypageDTO, @PathVariable int memberId, MemberDTO memberDTO ) {
		
		System.out.println(memberId);
		memberDTO = memberMapper.getMember(memberId);
		
		mypageDTO = boardMapper.getMemberInfo(memberId);
		System.out.println("첫번째 mypageDTO >>>> "+mypageDTO);
		//mypageDTO.setMemberDTO(memberDTO);  //java.lang.NullPointerException: null
		//System.out.println("두번째 mypageDTO >>>> "+mypageDTO);   
		
		model.addAttribute("mypage", mypageDTO);
		model.addAttribute("member", memberDTO);
		System.out.println(memberDTO);
		
		int totalpostcount = boardMapper.getMemberInfoCount(memberId);
		PagingBean pagingBean = null;

		if (pageNo == null)
			pagingBean = new PagingBean(totalpostcount);
		else {
			pagingBean = new PagingBean(totalpostcount, Integer.parseInt(pageNo));
		}

		model.addAttribute("pagingBean", pagingBean);
		
		  model.addAttribute("list",
		  boardMapper.getAllMemberInfo(memberId,
		  pagingBean.getStartRowNumber(), pagingBean.getEndRowNumber()));
		  //List<BoardDTO> getAllMemberInfo(int memberId,int getStartRowNumber, int getEndRowNumber );//회원 정보 조회 - 작성한 게시글 리스트
		
		return "member/mypage.tiles2";
	}

}