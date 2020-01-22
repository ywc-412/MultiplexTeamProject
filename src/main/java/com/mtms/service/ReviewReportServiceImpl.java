package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewReportVO;
import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.ReviewMapper;
import com.mtms.mapper.ReviewReportMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewReportServiceImpl implements ReviewReportService{
	@Setter(onMethod_ = @Autowired)
	private ReviewReportMapper reviewReportMapper;
	private ReviewMapper reviewMapper;
	private MemberMapper memberMapper;

	@Override
	public int getTotalCount(Criteria cri) {
		//전체 게시물의 수를 확인
		return reviewReportMapper.getTotalCount(cri);
	}

	@Override
	public List<ReviewReportVO> getList(Criteria cri) {
		//게시물 리스트 출력및 페이징을 위한 메소드
		return reviewReportMapper.getListWithPaging(cri);
	}

//	@Override
//	public List<ReviewReportVO> getList() {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public boolean modify(ReviewReportVO rrvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}

	@Override
	public boolean remove(Integer reviewNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ReviewReportVO get(int reportNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(ReviewReportVO rrvo) {
		reviewReportMapper.insert(rrvo);
		
	}
}
