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
		
		return commentMapper.getListWithPaging(cri, movieNo);
	}
	
	//한줄평 수정
	@Override
	public int modify(CommentVO comment) {
		
		return commentMapper.update(comment);
	}
	
	//한줄평 삭제
	@Override
	public int remove(int commentNo) {
		
		return commentMapper.delete(commentNo);
	}
	
	//한줄평 등록
	@Override
	public int register(CommentVO comment) {
		
		return commentMapper.insert(comment);
	}
	
	//한줄평 페이징
	@Override
	public CommentPageDTO getListPage(Criteria cri, int movieNo) {
			
		return new CommentPageDTO(commentMapper.getCountByBno(movieNo), commentMapper.getListWithPaging(cri, movieNo));
	}

	@Override
	public CommentVO get(int commentNo) {
		
		return commentMapper.read(commentNo);
	}

	@Override
	public CommentPageDTO getListCommentPage(Criteria cri) {
		
		return new CommentPageDTO(commentMapper.commentCount(cri), commentMapper.commentList());
	}

	@Override
	public List<CommentVO> getCommentList() {
		
		return commentMapper.commentList();
	}

	@Override
	public int registerComment(int movieNo, String memberId) {

		return commentMapper.insertComment(movieNo, memberId);
	}

	@Override
	public int registerReport(int commentNo, String memberId) {
		
		return commentMapper.insertReport(commentNo, memberId);
	}

	@Override
	public List<CommentVO> myGetList(Criteria cri, String memberId) {

		return commentMapper.myCommentListWithPaging(cri, memberId);
	}

	@Override
	public int myGetTotal(String memberId) {

		return commentMapper.myCommentTotal(memberId);
	}

	
	
	
}
