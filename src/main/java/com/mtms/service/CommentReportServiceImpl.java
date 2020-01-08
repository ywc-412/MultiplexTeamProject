package com.mtms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mtms.domain.CommentReportVO;
import com.mtms.domain.Criteria;
import com.mtms.persistence.CommentReportMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CommentReportServiceImpl implements CommentReportService{
	
	private CommentReportMapper commentReportMapper;
	
	//등록
	public void register(CommentReportVO ReportComment) {
		
	}
	
	//수정
	public boolean modify(CommentReportVO ReportComment) {
		
		return false;
	}
	
	//제거
	public boolean remove(int CommentReportNo) {
		
		return false;
	}
	
	//상세보기
	public CommentReportVO get(int CommentReportNo) {
		
		return null;
	}
	
	//전체 조회하기
	public List<CommentReportVO> getList(Criteria cri){
		
		return null;
	}
	
	//
	public int getTotal(Criteria cri) {
		
		return 0;
	}
	
}
