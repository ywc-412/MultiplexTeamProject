package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.ReviewMapper;
import com.mtms.mapper.ReviewReplyMapper;
import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyPageDTO;
import com.mtms.domain.ReplyVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReviewReplyServiceImpl implements ReviewReplyService{
	@Setter(onMethod_ = @Autowired)
	private ReviewReplyMapper reviewReplyMapper;
	private ReviewMapper reviewMapper;
	private MemberMapper memberMapper;

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int reviewNo) {
		return new ReplyPageDTO(reviewReplyMapper.getCountByReplyNo(reviewNo), reviewReplyMapper.getListWithPaging(cri, reviewNo));
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int reviewNo) {
//		public List<ReplyVO> getList(Criteria cri, Long reviewNo) 
		return reviewReplyMapper.getListWithPaging(cri, reviewNo);
	}

	@Override
	public int modify(ReplyVO revo) {
//		public int modify(ReplyVO revo)
		return reviewReplyMapper.update(revo);
	}

	@Override
	public int remove(int replyNo) {
//		public int remove(Long replyNo)
		return reviewReplyMapper.delete(replyNo);
	}

	@Override
	public ReplyVO get(int replyNo) {
//		public ReplyVO get(Long replyNo)
		return reviewReplyMapper.read(replyNo);
	}

	@Override
	public int register(ReplyVO revo) {
//		public int register(ReplyVO revo)
		return reviewReplyMapper.insert(revo);
	}
}
