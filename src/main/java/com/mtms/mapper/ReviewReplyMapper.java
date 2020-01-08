package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyVO;

public interface ReviewReplyMapper {
	public int getCountByReplyNo(int reviewNo);
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,  @Param("reviewNo") int reviewNo);	//댓글 전체 조회
	public int update(ReplyVO revo);	//댓글 수정
	public int delete(int replyNo);	//댓글 삭제
	public ReplyVO read(int replyNo);	//댓글 조회 
	public int insert(ReplyVO revo);	//댓글 등록

}
