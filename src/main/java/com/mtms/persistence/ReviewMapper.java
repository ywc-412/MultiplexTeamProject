package com.mtms.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;

public interface ReviewMapper {
	public void updateReplyCnt(@Param("reviewNo ") long ReviewNo,@Param("amount") int amount);
	public int getTotalCount(Criteria cri);
	public List<ReviewVO> getListWithPaging(Criteria cri);
	public void insertSelectKey(ReviewVO rvo);							
	public void insert(ReviewVO rvo);
	public int update(ReviewVO rvo);
	public int delete(Long reviewNo);
	public ReviewVO read(Long reviewNo);

}
