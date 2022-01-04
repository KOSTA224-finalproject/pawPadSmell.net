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
	
	BoardDTO storegetpostDetail(int postId);

	void deletePost(int postId);

	List<CategoryDTO> getCategoryList();

	List<BoardTypeDTO> getBoardType();

	BoardTypeDTO getBoardName (int boardId);

	CategoryDTO getCatName(int categoryId);

	int getCategoryCount(int boardId, int categoryId);

	void boardWrite(BoardDTO boardDTO); // 게시글 등록 + 파일 업로드
	
	void storeboardWrite(BoardDTO boardDTO); // 중고 거래 게시글 등록 + 파일 업로드

	void boardUpdate(BoardDTO boardDTO); // 게시글 수정

	int getMypageCount(int memberId);

	List<BoardDTO> getAllMypage(int memberId,int getStartRowNumber, int getEndRowNumber );

	void myPageWrite(MyPageDTO mypageDTO);

	MyPageDTO myPageProfile(MemberDTO memberDTO);
	
	MyPageDTO getMemberInfo(int memberId);//회원 정보 조회
	
	List<BoardDTO> getAllMemberInfo(int memberId,int getStartRowNumber, int getEndRowNumber );//회원 정보 조회 - 작성한 게시글 리스트
	
	int getMemberInfoCount(int memberId);//회원 정보 조회 - 회원이 작성한 게시물 수

	void commentUpdateUp(int postId);

	void commentUpdateDown(int postId);


	void updateProfile(MyPageDTO mypageDTO);

	List<BoardDTO> searchPost(int categoryId,int boardId,String search,int getStartRowNumber, int getEndRowNumber);

	int getSearchCount(int boardId, int categoryId,String search);

	void myPageWrite1(MyPageDTO mypageDTO);

	
}
