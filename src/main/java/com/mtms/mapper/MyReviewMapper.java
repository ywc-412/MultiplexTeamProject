package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;

public interface MyReviewMapper {
	public int getTotalCount(Criteria cri);
	public List<ReviewVO> getListWithPaging(@Param("cri") Criteria cri,@Param("memberId")String memberId);
}
