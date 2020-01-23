package com.mtms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.CommentPageDTO;
import com.mtms.domain.CommentVO;
import com.mtms.domain.Criteria;

public interface CommentService {
	
	//한줄평 페이징
	public CommentPageDTO getListPage(Criteria cri, int movieNo);
	
	//한줄평 조회
	public List<CommentVO> getList(@Param("cri") Criteria cri, @Param("movieNo") int movieNo);
	
	
	//전체목록 조회(페이징)
	public List<CommentVO> myGetList(Criteria cri, String memberId); 
	
	//페이지 총 갯수
	public int myGetTotal(String memberId);
	
	
	//한줄평 수정
	public int modify(CommentVO comment);
	
	//한줄평 삭제
	public int remove(int commentNo);
	
	
	//한줄평 등록
	public int register(CommentVO comment);
	
	//한줄평 조회
	public CommentVO get(int commentNo);	 //댓글 하나 조회
	
	
	//한줄평 페이징
	public CommentPageDTO getListCommentPage(Criteria cri);
	
	
	//한줄평 조회
	public List<CommentVO> getCommentList();
	
	
	//이미 작성한사람
	public int registerComment(int movieNo, String memberId);
	
	
	public int registerReport(int commentNo, String memberId);

}
