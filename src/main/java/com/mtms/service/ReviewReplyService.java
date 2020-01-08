package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyPageDTO;
import com.mtms.domain.ReplyVO;

public interface ReviewReplyService {
	public ReplyPageDTO getListPage(Criteria cri, int reviewNo);
	public List<ReplyVO> getList(Criteria cri, Long reviewNo);	//댓글 전체 조회
	public int modify(ReplyVO revo);	//댓글 수정
	public int remove(int replyNo);	//댓글 삭제
	public ReplyVO get(int replyNo);	//댓글 조회 
	public int register(ReplyVO revo);	//댓글 등록
}
