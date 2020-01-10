package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.CommentPageDTO;
import com.mtms.domain.CommentVO;
import com.mtms.domain.Criteria;
import com.mtms.mapper.CommentMapper;
import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.MovieMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CommentServiceImpl implements CommentService{
	
	private CommentMapper commentMapper;
	private MovieMapper movieMapper;
	private MemberMapper memberMapper;
	

	//한줄평 조회
	@Override
	public List<CommentVO> getList(Criteria cri, int movieNo){
		
		return null;
	}
	
	//내 한줄평 조회
	@Override
	public List<CommentVO> myList(Criteria cri, String memberId) {
		
		return null;
	}
	
	//한줄평 수정
	@Override
	public int modify(CommentVO comment) {
		
		return 0;
	}
	
	//한줄평 삭제
	@Override
	public int remove(int commentNo) {
		
		return commentNo;
	}
	
	//한줄평 등록
	@Override
	public int register(CommentVO comment) {
		
		return 0;
	}
	
	//한줄평 페이징
	@Override
	public CommentPageDTO getListPage(Criteria cri, int movieNo) {
		
		return null;
	}
	
	
	
}
