package com.mtms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.CommentPageDTO;
import com.mtms.domain.CommentVO;
import com.mtms.domain.Criteria;
import com.mtms.domain.ReserveVO;

public interface CommentService {
	
	//한줄평 페이징
	public CommentPageDTO getListPage(Criteria cri, int no);
	
	//한줄평 조회
	public List<CommentVO> getList(@Param("cri") Criteria cri, @Param("movieNo") int movieNo);
	
	//회원별 한줄평 조회
	public List<CommentVO> getList(Criteria cri, String memberId);
	
	//한줄평 수정
	public int modify(CommentVO cvo);
	
	//한줄평 삭제
	public int remove(int CommentNo);
	
	//한줄평 등록
	public int register(CommentVO cvo);
	
}
