package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.domain.BoardDTO;
import org.kosta.myproject.model.domain.BoardTypeDTO;
import org.kosta.myproject.model.domain.CategoryDTO;
import org.kosta.myproject.model.domain.MemberDTO;
import org.kosta.myproject.model.domain.MyPageDTO;

@Mapper
public interface BoardMapper {

	List<BoardDTO> getBoardList();

	int hitsUpdate(int postId);

	BoardTypeDTO getSecId();

	BoardTypeDTO getComId();

	MemberDTO findTestById(int memberId);

	List<BoardDTO> getAllLists(int boardId, int categoryId, int getStartRowNumber, int getEndRowNumber);

	BoardDTO getpostDetail(int postId);

	void deletePost(int postId);

	List<CategoryDTO> getCategoryList();

	List<BoardTypeDTO> getBoardType();

	BoardTypeDTO getBoardName(int boardId);

	CategoryDTO getCatName(int categoryId);

	int getCategoryCount(int boardId, int categoryId);

	void boardWrite(BoardDTO boardDTO); // 게시글 등록 + 파일 업로드

	BoardDTO boardUpdate(BoardDTO boardDTO); // 게시글 수정

	int getMypageCount(int memberId);

	List<BoardDTO> getAllMypage(int memberId,int getStartRowNumber, int getEndRowNumber );

	void myPageWrite(MyPageDTO mypageDTO);

	MyPageDTO myPageProfile(MemberDTO memberDTO);
}
