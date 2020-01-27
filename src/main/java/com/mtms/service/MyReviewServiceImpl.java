package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;
import com.mtms.mapper.MyReviewMapper;
import com.mtms.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MyReviewServiceImpl implements MyReviewService {
	private MyReviewMapper mapper;
	@Override
	public List<ReviewVO> getList(Criteria cri,String memberId) {
		return mapper.getListWithPaging(cri,memberId);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
