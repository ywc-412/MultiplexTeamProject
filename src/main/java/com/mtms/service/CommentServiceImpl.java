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
	public List<CommentVO> getList(Criteria cri, int movieNo){
		
		return null;
	}
	
	//한줄평 수정
	public int modify(CommentVO cvo) {
		
		return 0;
	}
	
	//한줄평 삭제
	public int remove(int CommentNo) {
		
		return CommentNo;
	}
	
	//한줄평 등록
	public int register(CommentVO cvo) {
		
		return 0;
	}
	
	//한줄평 페이징
	public CommentPageDTO getListPage(Criteria cri, int movieNo) {
		
		return null;
	}
	
}
