package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;

public interface ReviewMapper {
<<<<<<< HEAD
=======
	public void updateReplyCnt(@Param("reviewNo ") int ReviewNo,@Param("amount") int amount);
	public int getTotalCount(Criteria cri);
	public List<ReviewVO> getListWithPaging(Criteria cri);
>>>>>>> master
	public void insertSelectKey(ReviewVO rvo);							
	public void insert(ReviewVO rvo);
	public int update(ReviewVO rvo);
	public int delete(int reviewNo);
	public ReviewVO read(int reviewNo);
//	public List<ReviewVO> getList();
	public int updateView(int reviewNo);
	public List<ReviewVO> getListWithPaging(Criteria cri);
}
