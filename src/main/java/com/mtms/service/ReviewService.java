package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;


public interface ReviewService {
	public boolean modify(ReviewVO rvo);
	public boolean remove(int reviewNo);
	public ReviewVO get(int reviewNo);
	public void register(ReviewVO rvo);
//	public List<ReviewVo> getList();
	public List<ReviewVO> getList(Criteria cri);
}
