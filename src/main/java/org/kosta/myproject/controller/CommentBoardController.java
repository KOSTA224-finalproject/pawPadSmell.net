package org.kosta.myproject.controller;

import org.kosta.myproject.model.domain.BoardDTO;
import org.kosta.myproject.model.domain.CommentBoardDTO;
import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.mapper.BoardMapper;
import org.kosta.myproject.model.mapper.CommentBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentBoardController {
		@Autowired
		CommentBoardMapper commentBoardMapper;
		@Autowired
		BoardMapper boardMapper;
	

		
		public CommentBoardController(CommentBoardMapper commentBoardMapper, BoardMapper boardMapper) {
			super();
			this.commentBoardMapper = commentBoardMapper;
			this.boardMapper = boardMapper;
		
		}
		@ResponseBody
		@PostMapping("/commentSave/{postId}")
		public void commentSave(@PathVariable int postId, @RequestBody CommentBoardDTO commentBoardDTO, Authentication authentication) {
//			int postId=2;
			int memberId=1;
			System.out.println(postId);
			MemberDTO memberDTO=new MemberDTO();
			memberDTO = (MemberDTO)authentication.getPrincipal(); 
			BoardDTO boardDTO=new BoardDTO();
			//memberDTO.setMemberId(memberId);
			boardDTO.setPostId(postId);
			commentBoardDTO.setBoardDTO(boardDTO);
			commentBoardDTO.setMemberDTO(memberDTO);
//			System.err.println("test");
			System.out.println(memberDTO.getMemberId());
			System.out.println(commentBoardDTO);
			boardMapper.commentUpdateUp(postId);
			
			commentBoardMapper.commentSave(commentBoardDTO);
			
			
		}
		@ResponseBody
		@DeleteMapping("/commentDelete/{postId}/{commentId}")
		public void commentDelete(@PathVariable int commentId,@PathVariable int postId) {
			System.out.println(commentId);
			commentBoardMapper.commentDelete(commentId);
			boardMapper.commentUpdateDown(postId);
		}
		
		@ResponseBody
		@PostMapping("/commentUpdate")
		public void commentUpdate(@RequestBody CommentBoardDTO commentBoardDTO) {
			System.out.println(commentBoardDTO);
			commentBoardMapper.commentUpdate(commentBoardDTO);
		}
}
