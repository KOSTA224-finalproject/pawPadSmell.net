package org.kosta.myproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.myproject.model.domain.BoardDTO;
import org.kosta.myproject.model.domain.BoardTypeDTO;
import org.kosta.myproject.model.domain.CategoryDTO;
import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.domain.PagingBean;
import org.kosta.myproject.model.mapper.BoardMapper;
import org.kosta.myproject.model.mapper.CommentBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource
	private BoardMapper boardMapper;
	@Resource
	private CommentBoardMapper commentBoardMapper;
	@Resource
	private PagingBean pagingBean;

	@Autowired
	public BoardController(BoardMapper boardMapper, CommentBoardMapper commentBoardMapper, PagingBean pagingBean) {
		super();
		this.boardMapper = boardMapper;
		this.commentBoardMapper = commentBoardMapper;
		this.pagingBean = pagingBean;
	}

	@RequestMapping("/write/{boardId}/{categoryId}") // 게시글 작성화면 호출
	public String boardWriteForm(Authentication authentication, Model model, @PathVariable("boardId") int boardId,
			@PathVariable("categoryId") int categoryId) {
		model.addAttribute("boardId", boardId);
		model.addAttribute("categoryId", categoryId);
		MemberDTO userDetails = (MemberDTO) authentication.getPrincipal();
		model.addAttribute("boardname", boardMapper.getBoardName(boardId));
		model.addAttribute("categoryname", boardMapper.getCatName(categoryId));
		
		
		String nickname = userDetails.getNickname();
		System.out.println("작성화면으로 들어감!");
		model.addAttribute("nick", nickname);
		return "board/board-write.tiles2";
	}

	@RequestMapping("/writepro/{boardId}/{categoryId}")
	public String boardWrite(Authentication authentication, BoardDTO boardDTO, Model model,  MultipartFile file,
			@PathVariable("boardId") int boardId, @PathVariable("categoryId") int categoryId)
			throws IllegalStateException, IOException {// 작성한 글 및 파일 업로드 처리
		
		
		//@RequestParam(value="file", required=false) MultipartFile file,
/*
		BoardTypeDTO boardTypeDTO = new BoardTypeDTO();
		boardTypeDTO = (BoardTypeDTO) authentication.getPrincipal();
		boardDTO.setBoardTypeDTO(boardTypeDTO);
		System.out.println(boardDTO);
		
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO = (CategoryDTO) authentication.getPrincipal();
		boardDTO.setCategoryDTO(categoryDTO);
*/
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) authentication.getPrincipal();
		boardDTO.setMemberDTO(memberDTO);
		model.addAttribute(memberDTO);
		
		BoardTypeDTO boardtypeDTO = new BoardTypeDTO();
		boardtypeDTO.setBoardId(boardId);
		boardDTO.setBoardTypeDTO(boardtypeDTO);
		model.addAttribute(boardtypeDTO);
		
		CategoryDTO categoryDTO = new CategoryDTO();
		categoryDTO.setCategoryId(categoryId);
		boardDTO.setCategoryDTO(categoryDTO);
		model.addAttribute(categoryDTO);
		System.out.println("***********************");
		System.out.println(file.isEmpty());//파일이 선택되지 않았다면 true
		if(file.isEmpty()==false) {
		/*
		 * boardDTO.setMemberDTO(memberDTO); System.out.println(boardDTO);
		 * 
		 * MemberDTO userDetails = (MemberDTO) authentication.getPrincipal(); String
		 * nickname = userDetails.getNickname(); //String nickname =
		 * memberDTO.getNickname(); model.addAttribute("nick", nickname);
		 */
		System.out.println(boardDTO.toString()+"  "+memberDTO.toString()+ " " + categoryDTO.toString());
		//System.out.println(boardDTO.getBoardTypeDTO().getBoardId()+boardDTO.getCategoryDTO().getCategoryId());
		
		// 1. 실제 파일이 저장되는 경로 지정
		// System.getProperty(“user.dir”) -> 현재 작업 디렉토리
		String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files";

		// 2. UUID로 식별자 랜덤으로 이름 만들어줌
		// UUID : 네트워크 상에서 고유성이 보장되는 id를 만들기 위한 표준 규약
		// 랜덤으로 파일 이름 생성
		UUID uuid = UUID.randomUUID();
		//String uuid = UUID.randomUUID().toString();

		// 3. uuid+원래 파일이름 = 새로운 파일이름 // 같은 이름의 파일을 업로드 시 기존의 파일 덮어쓰기 방지를 위함.
		//System.out.println("uuid 는 !!  :  " + uuid);
		//if(uuid != null){ System.out.println("uuid 생성됨!"); }
		System.out.println(file.getOriginalFilename());
		String fileName = uuid + "_" + file.getOriginalFilename();
		//System.out.println(fileName);
		//if(fileName == null){ System.out.println("파일 이름 못 받아옴 ㅠㅜ"); }


		// 4. 파일 넣어주는 껍데기 : 파일 생성해주되 경로 설정하고 파일 이름도 받겠다.
		// File(File parent, String Child) parent 객체 폴더의 child 라는 파일에 대한 File 객체를 생성
		// File saveFile = new File(projectPath, fileName);
		// (저장할 폴더 이름, 저장할 파일 이름)
		File saveFile = new File(projectPath, fileName);

		// 5. 업로드된 파일 저장
		file.transferTo(saveFile); // exception 경고 뜸. throws 해준다.

		// 6. db에 파일명, 파일 경로 저장
		boardDTO.setFilename(fileName);
		boardDTO.setFilepath("/files/" + fileName);
		}else {
			boardDTO.setFilename("");
			boardDTO.setFilepath("");
		}
		boardMapper.boardWrite(boardDTO);

		return "redirect:/board/list/{boardId}/{categoryId}";// 게시글 리스트로 리다이렉트
	}

//---------------------------------------------------------------------------------------------------
//게시글 수정
	
	@GetMapping("/modify/{postId}/{boardId}/{categoryId}")//게시물 상세보기에서 수정 버튼을 누르면 게시글 수정 페이지로 이동 시켜주는 메서드
	public String boardModify(@PathVariable("postId") int postId, @PathVariable("boardId") int boardId, @PathVariable("categoryId") int categoryId, Model model, Authentication authentication) {//게시글 수정 화면 호출
		
		model.addAttribute("boardId", boardId);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("postId", postId);
		
		MemberDTO userDetails = (MemberDTO) authentication.getPrincipal();
		model.addAttribute("boardname", boardMapper.getBoardName(boardId));
		model.addAttribute("categoryname", boardMapper.getCatName(categoryId));
		
		
		String nickname = userDetails.getNickname();
		System.out.println("게시물 수정 페이지로 이동!");
		model.addAttribute("nick", nickname);

		model.addAttribute("boardDTO", boardMapper.getpostDetail(postId)); //기존에 있던 게시글 끌어오기 -> 수정 페이지에서 출력용
		return "board/boardmodify";
	}


	@PostMapping("/update/{postId}/{boardId}/{categoryId}")
	public String boardUpdate(@PathVariable("postId") int postId, @PathVariable("boardId") int boardId, @PathVariable("categoryId") int categoryId, Model model, BoardDTO boardDTO,Authentication authentication, MultipartFile file) throws IllegalStateException, IOException {// 여기 boardDTO에 새로 입력한 내용을 받아옴.
		
		
		if(file.isEmpty()==false) {
		// 1. 실제 파일이 저장되는 경로 지정
		String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files";

		// 2. UUID로 식별자 랜덤으로 이름 만들어줌
		UUID uuid = UUID.randomUUID();

		// 3. uuid+원래 파일이름 = 새로운 파일이름 // 같은 이름의 파일을 업로드 시 기존의 파일 덮어쓰기 방지를 위함.
		String fileName = uuid + "_" + file.getOriginalFilename();

		// 4. 파일 넣어주는 껍데기 : 파일 생성해주되 경로 설정하고 파일 이름도 받겠다.
		File saveFile = new File(projectPath, fileName);

		// 5. 업로드된 파일 저장
		file.transferTo(saveFile); // exception 경고 뜸. throws 해준다.

		// 6. db에 파일명, 파일 경로 저장
		boardDTO.setFilename(fileName);
		boardDTO.setFilepath("/files/" + fileName);
		}else {
			boardDTO.setFilename("");
			boardDTO.setFilepath("");
		}
		
		// 기존의 boardDTO를 받아오도록 boardTemp 객체를 만든다.
		//BoardDTO boardTemp = boardMapper.getpostDetail(postId);// 기존에 있던 게시물
		//boardTemp.setTitle(boardDTO.getTitle());// 위 매개변수 boardTemp로 새롭게 받아온 내용을 기존의 내용에 덮어씌운다.
		//boardTemp.setContent(boardDTO.getContent());
		
		boardMapper.boardUpdate(boardDTO);//디비에 수정된 내용 업데이트
		//return "redirect:/board/goDetail/{postId}";
		return "redirect:/board/{postId}";
		
	}

	
//-------------------------------------------------------
	@GetMapping("/list/{boardId}/{categoryId}")
	public String getAllLists(Model model, @PathVariable("boardId") int boardId,
			@PathVariable("categoryId") int categoryId, String pageNo) {
			
		int totalPostCount = boardMapper.getCategoryCount(boardId, categoryId);
		PagingBean pagingBean = null;

		if (pageNo == null) {
			// 현재 페이지가 1page로 할당되어 있음
			pagingBean = new PagingBean(totalPostCount);
		} else {
			// client에서 보낸 page번호로 할당한다
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}

		model.addAttribute("pagingBean", pagingBean);

		System.out.println(boardMapper.getBoardName(boardId));
		model.addAttribute("boardId", boardId);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("boardname", boardMapper.getBoardName(boardId));
		model.addAttribute("categoryname", boardMapper.getCatName(categoryId));
		model.addAttribute("list", boardMapper.getAllLists(boardId, categoryId, pagingBean.getStartRowNumber(),
				pagingBean.getEndRowNumber()));

		return "board/board-list.tiles2";
	}

	@RequestMapping(value = "/{postId}")
	public String getPostDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Authentication authentication, Model model, @PathVariable int postId) {

		Cookie cookie = new Cookie("postId", Integer.toString(postId));
		response.addCookie(cookie);
		Cookie[] cookies = request.getCookies();
		int visitor = 0;// 쿠키들을 불러오고 쿠키가 있는지 변수확인

		System.out.println(cookies);

		for (Cookie cookie1 : cookies) {
			System.out.println(cookie.getName());
			if (cookie1.getName().equals("visit")) {// 쿠키들 중에 visit이름이 있는지 확인
				visitor = 1;
				System.out.println("visit통과");
				if (cookie1.getValue().contains(Integer.toString(postId))) {
					// visit 안에 접속한 페이지 번호가 있는지 확인
					System.out.println(cookies);

					System.out.println("visitif통과");
				} else {
					cookie1.setValue(cookie1.getValue() + "_" + Integer.toString(postId));
					response.addCookie(cookie1);
					boardMapper.hitsUpdate(postId);
					System.out.println(cookies);

				} // 쿠키에 페이지번호가없다면 추가해주고 카운트 늘리기

			}
		}

		if (visitor == 0) {
			Cookie cookie1 = new Cookie("visit", request.getParameter(Integer.toString(postId)));
			response.addCookie(cookie1);
			boardMapper.hitsUpdate(postId);
		} // 쿠키가 없다면 쿠키를 만들어주고 카운트 늘림

		model.addAttribute("list", boardMapper.getpostDetail(postId));
		model.addAttribute("comment", commentBoardMapper.findByComment(postId));
		MemberDTO userDetails = (MemberDTO) authentication.getPrincipal();
		System.out.println(userDetails);
		String nickname = userDetails.getNickname();
		int memberId=userDetails.getMemberId();
		model.addAttribute("nick", nickname);
		model.addAttribute("userMemberId", memberId);
		System.out.println(nickname);
		System.out.println(boardMapper.getpostDetail(postId).memberDTO.getNickname());
		model.addAttribute("commentsCount", commentBoardMapper.getCommentCount(postId));

		return "board/board-detail.tiles2";
	}

	@RequestMapping("/delete/{postId}/{boardId}/{categoryId}")
	public String deletePost(Model model, HttpServletRequest request, @PathVariable("postId") int postId,
			@PathVariable("boardId") int boardId, @PathVariable("categoryId") int categoryId) {
		boardMapper.deletePost(postId);
		model.addAttribute("board", boardMapper.getBoardName(boardId));
		model.addAttribute("category", boardMapper.getCatName(categoryId));
		model.addAttribute("list", boardMapper.getAllLists(boardId, categoryId, pagingBean.getStartRowNumber(),
				pagingBean.getEndRowNumber()));

		return "redirect:/board/list/{boardId}/{categoryId}";
	}

}
