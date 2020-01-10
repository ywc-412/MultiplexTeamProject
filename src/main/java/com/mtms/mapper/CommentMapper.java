  package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.CommentVO;
import com.mtms.domain.Criteria;

public interface CommentMapper {
	
	//총페이지 갯수
	public int getCountByBno(int movieNo);
	
	//한줄평 조회(페이징)
	public List<CommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("movieNo") int movieNo);
	
	//내 한줄평 조회
	public List<CommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("memberId") String memberId);
	
	//한줄평 수정
	public int update(CommentVO comment);
	
	//한줄평 삭제
	public int delete(int commentNo);
	
	//한줄평 등록
	public int insert(CommentVO comment);
	
}
