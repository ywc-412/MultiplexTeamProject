package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.mtms.mapper.ReviewMapper;
=======
import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewVO;
import com.mtms.persistence.ReviewMapper;
>>>>>>> d47745afa78514a48ab8d8d27ff650741a180262

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewServiceImpl implements ReviewService{
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;

	@Override
	public int getTotalCount(Criteria cri) {
//		public int getTotalCount(Criteria cri) {}
		return 0;
	}

	@Override
	public List<ReviewVO> getList(Criteria cri) {
//		public List<Review> getList(Criteria cri)
		return null;
	}

	@Override
	public List<ReviewVO> getList() {
//		public List<Review> getList() 
		return null;
	}

	@Override
	public boolean modify(ReviewVO rvo) {
 
		return false;
	}

	@Override
	public boolean remove(int reviewNo) {
//		public boolean modify(Review rvo)
		return false;
	}

	@Override
	public ReviewVO get(int reviewNo) {
//		public boolean remove(Review rvo) 
		return null;
	}

	@Override
	public void register(ReviewVO rvo) {
//		public void register(ReviewVo rvo)
		
	}
	








}
