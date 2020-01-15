package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.ReviewMapper;
import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewServiceImpl implements ReviewService{
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
//	private MemberMapper memberMapper;

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("SerImpl getTotalCount.....");
		return reviewMapper.getTotalCount(cri);
	}

	@Override
	public List<ReviewVO> getList(Criteria cri) {
		log.info("SerImpl getList.....");
		return reviewMapper.getListWithPaging(cri);
	}

	@Override
	public boolean modify(ReviewVO rvo) {
		log.info("SerImpl modify.....");
		return reviewMapper.update(rvo) == 1;
	}

	@Override
	public boolean remove(int reviewNo) {
		log.info("SerImpl remove.....");
		return reviewMapper.delete(reviewNo) == 1;
	}

	@Override
	@Transactional
	public ReviewVO get(int reviewNo) {
		log.info("SerImpl viewUpdate + get.....");
		reviewMapper.updateView(reviewNo);
		return reviewMapper.read(reviewNo);
		
	}

	@Override
	public void register(ReviewVO rvo) {
		log.info("SerImpl register.....");
		reviewMapper.insertSelectKey(rvo);
	}

	








}
