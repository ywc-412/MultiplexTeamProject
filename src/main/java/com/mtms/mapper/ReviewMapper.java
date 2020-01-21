package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewReportVO;
import com.mtms.domain.ReviewVO;

public interface ReviewMapper {
	
	public void insertSelectKey(ReviewVO rvo);							
	public void updateReplyCnt(@Param("reviewNo") int reviewNo, @Param("amount") int amount); //댓글 총 갯수
	public int update(ReviewVO rvo);
	public int delete(int reviewNo);
	public ReviewVO read(int reviewNo);
	public List<ReviewVO> getList();
	public int updateView(int reviewNo);
	public List<ReviewVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
}
