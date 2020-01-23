package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;

public interface MyReviewService {
	public List<ReviewVO> getList(Criteria cri,String memberId );
	public int getTotalCount(Criteria cri);
}
