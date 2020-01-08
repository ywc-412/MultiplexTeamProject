package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewReportVO;
import com.mtms.persistence.ReviewReportMapper;
=======
import com.mtms.mapper.ReviewReportMapper;
>>>>>>> 73ca32040d3a453aedf362b28c130b17afc58b54

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewReportServiceImpl implements ReviewReportService{
	@Setter(onMethod_ = @Autowired)
	private ReviewReportMapper reviewReportMapper;

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewReportVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewReportVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(ReviewReportVO rrvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int lostNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ReviewReportVO get(long reportNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(ReviewReportVO rrvo) {
		// TODO Auto-generated method stub
		
	}
}
