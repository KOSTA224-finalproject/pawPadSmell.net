package org.kosta.myproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.catalina.StoreManager;
import org.kosta.myproject.model.domain.BoardDTO;
import org.kosta.myproject.model.domain.BoardTypeDTO;
import org.kosta.myproject.model.domain.CategoryDTO;
import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.domain.PagingBean;
import org.kosta.myproject.model.domain.StoreDTO;
import org.kosta.myproject.model.mapper.BoardMapper;
import org.kosta.myproject.model.mapper.CommentBoardMapper;
import org.kosta.myproject.model.mapper.StoreMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class StoreBoardController {
	@Resource
	private BoardMapper boardMapper;
	@Resource
	private StoreMapper storeMapper;
	@Resource
	private PagingBean pagingBean;

	@Autowired
	public StoreBoardController(BoardMapper boardMapper, PagingBean pagingBean) {
		super();
		this.boardMapper = boardMapper;
		this.pagingBean = pagingBean;
	}

	@RequestMapping("/storewrite/{boardId}/{categoryId}") // 게시글 작성화면 호출
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
		return "board/storeboard-write";
	}

	// ----------여기서 부터 ----------
	@PostMapping("/storewritepro/{boardId}/{categoryId}")
	public String storeboardWrite(Authentication authentication, BoardDTO boardDTO, StoreDTO storeDTO, Model model,
			MultipartFile file, @PathVariable("boardId") int boardId, @PathVariable("categoryId") int categoryId)
			throws IllegalStateException, IOException {// 작성한 글 및 파일 업로드 처리
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) authentication.getPrincipal();
		CategoryDTO categoryDTO = new CategoryDTO();
		BoardTypeDTO boardTypeDTO = new BoardTypeDTO();
		categoryDTO.setCategoryId(categoryId);
		boardTypeDTO.setBoardId(boardId);
		boardDTO.setBoardTypeDTO(boardTypeDTO);
		boardDTO.setCategoryDTO(categoryDTO);
		boardDTO.setMemberDTO(memberDTO);
		
		System.out.println(memberDTO);
		System.out.println(boardDTO);
		System.out.println(storeDTO);

		String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files";

		// 2. UUID로 식별자 랜덤으로 이름 만들어줌
		// UUID : 네트워크 상에서 고유성이 보장되는 id를 만들기 위한 표준 규약
		// 랜덤으로 파일 이름 생성
		UUID uuid = UUID.randomUUID();
		// String uuid = UUID.randomUUID().toString();

		// 3. uuid+원래 파일이름 = 새로운 파일이름 // 같은 이름의 파일을 업로드 시 기존의 파일 덮어쓰기 방지를 위함.
		// System.out.println("uuid 는 !! : " + uuid);
		// if(uuid != null){ System.out.println("uuid 생성됨!"); }
		System.out.println(file.getOriginalFilename());
		String fileName = uuid + "_" + file.getOriginalFilename();
		// System.out.println(fileName);
		// if(fileName == null){ System.out.println("파일 이름 못 받아옴 ㅠㅜ"); }

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
		System.out.println(boardDTO);
		boardMapper.boardWrite(boardDTO);
		//int postid= boardDTO.getPostId();
		storeDTO.setBoardDTO(boardDTO);
		storeMapper.storeWrite(storeDTO);
				

		return "redirect:/board/list/{boardId}/{categoryId}";// 게시글 리스트로 리다이렉트
	}
}
