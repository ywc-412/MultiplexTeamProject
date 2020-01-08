package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyPageDTO;
import com.mtms.domain.ReplyVO;
import com.mtms.persistence.ReviewMapper;
import com.mtms.persistence.ReviewReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReviewReplyServiceImpl implements ReviewReplyService{
	@Setter(onMethod_ = @Autowired)
	private ReviewReplyMapper reviewReplyMapper;
	private ReviewMapper reviewMapper;

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int reviewNo) {
//		public ReplyPageDTO getListPage(Criteria cri, Long reviewNo)
		return null;
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int reviewNo) {
//		public List<ReplyVO> getList(Criteria cri, Long reviewNo) 
		return null;
	}

	@Override
	public int modify(ReplyVO revo) {
//		public int modify(ReplyVO revo)
		return 0;
	}

	@Override
	public int remove(int replyNo) {
//		public int remove(Long replyNo)
		return 0;
	}

	@Override
	public ReplyVO get(int replyNo) {
//		public ReplyVO get(Long replyNo)
		return null;
	}

	@Override
	public int register(ReplyVO revo) {
//		public int register(ReplyVO revo)
		return 0;
	}
}
