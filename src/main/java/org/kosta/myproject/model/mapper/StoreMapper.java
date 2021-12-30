package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.domain.StoreDTO;

@Mapper
public interface StoreMapper {

	void storeWrite(StoreDTO storeDTO);

	StoreDTO getStoreDetail(int postId);

	List<StoreDTO> getAllList();

}
