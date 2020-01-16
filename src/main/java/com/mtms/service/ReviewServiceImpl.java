package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;
import com.mtms.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private  ReviewMapper reviewMapper;
	
	@Override
	public boolean modify(ReviewVO rvo) {
		
		return reviewMapper.update(rvo) == 1;
	}

	@Override
	public boolean remove(int reviewNo) {
		// TODO Auto-generated method stub
		return reviewMapper.delete(reviewNo) == 1;
	}

	@Override
	@Transactional
	public ReviewVO get(int reviewNo) {
		// TODO Auto-generated method stub
		reviewMapper.updateView(reviewNo);
		return reviewMapper.read(reviewNo);
	}

//	@Override
//	public void register(ReviewVo rvo) {
//		// TODO Auto-generated method stub
//		reviewMapper.insert(rvo);
//		
//	}

@Override
public void register(ReviewVO rvo) {
	// TODO Auto-generated method stub
	
}

@Override
public List<ReviewVO> getList(Criteria cri) {
	
	return reviewMapper.getListWithPaging(cri);
}
}
