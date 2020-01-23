package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.CommentReportVO;
import com.mtms.domain.Criteria;
import com.mtms.mapper.CommentMapper;
import com.mtms.mapper.CommentReportMapper;
import com.mtms.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommentReportServiceImpl implements CommentReportService{
	
	private CommentReportMapper commentReportMapper;
	private CommentMapper commentMapper;
	private MemberMapper memberMapper;
	
	//등록
	@Override
	public void register(CommentReportVO commentReport) {
		
		commentReportMapper.insert(commentReport);
	}
	
	//제거
	@Override
	public boolean remove(int commentNo) {
		
		return false;
	}
	
	//상세보기
	@Override
	public CommentReportVO get(int commentReportNo) {
		CommentReportVO cvo = commentReportMapper.read(commentReportNo);
		return cvo;
	}
	
	//전체목록 조회(페이징)
	@Override
	public List<CommentReportVO> getList(Criteria cri){
		
		return commentReportMapper.getListWithPaging(cri);
	}
	
	//페이지 총 갯수
	@Override
	public int getTotal(Criteria cri) {
		
		return commentReportMapper.getTotalCount(cri);
	}
	
}
