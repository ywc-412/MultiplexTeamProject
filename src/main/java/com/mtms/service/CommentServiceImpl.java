package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.CommentVO;
import com.mtms.domain.Criteria;
import com.mtms.domain.PageDTO;
import com.mtms.mapper.CommentMapper;
import com.mtms.mapper.MovieMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CommentServiceImpl implements CommentService{
	
	private CommentMapper commentMapper;
	private MovieMapper movieMapper;
	
	public List<CommentVO> getList(Criteria cri, int movieNo){
		
		return null;
	}
	public int modify(CommentVO cvo) {
		
		return 0;
	}
	public int remove(int CommentNo) {
		
		return CommentNo;
	}
	public CommentVO get(int CommentNo) {
		
		return null;
	}
	public int register(CommentVO cvo) {
		
		return 0;
	}
	public PageDTO getListPage(Criteria cri, int movieNo) {
		
		return null;
	}
}
