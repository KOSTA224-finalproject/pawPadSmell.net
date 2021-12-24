package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.domain.CommentBoardDTO;

@Mapper
public interface CommentBoardMapper {

	List<CommentBoardDTO> findByComment(int postId);

	void commentSave(CommentBoardDTO commentBoardDTO);

	

}
