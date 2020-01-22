package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyReportVO;
import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.ReviewReplyMapper;
import com.mtms.mapper.ReviewReplyReportMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewReplyReportServiceImpl implements ReviewReplyReportService{
	@Setter(onMethod_ = @Autowired)
	private ReviewReplyReportMapper reviewReplyReportMapper;
	private ReviewReplyMapper reviewReplyMapper;
	private MemberMapper memberMapper;

	@Override
	public int getTotalCount(Criteria cri) {
		//전체 게시물의 수를 확인
		return reviewReplyReportMapper.getTotalCount(cri);
	}

	@Override
	public List<ReplyReportVO> getList(Criteria cri) {
		//게시물 리스트 출력및 페이징을 위한 메소드
		return reviewReplyReportMapper.getListWithPaging(cri);
	}

//	@Override
//	public List<ReplyReportVO> getList() {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public boolean modify(ReplyReportVO rpvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}

	@Override
	public boolean remove(int replyNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ReplyReportVO get(int replyReportNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(ReplyReportVO rpvo) {
		reviewReplyReportMapper.insert(rpvo);
		
	}
}
