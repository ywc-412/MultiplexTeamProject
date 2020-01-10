package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;

public interface ReviewService {
	public int getTotalCount(Criteria cri);
	public List<ReviewVO> getList(Criteria cri);
	public List<ReviewVO> getList();
	public boolean modify(ReviewVO rvo);
	public boolean remove(int reviewNo);
	public ReviewVO get(int reviewNo,int reviewView);
	public void register(ReviewVO rvo);
	
}
