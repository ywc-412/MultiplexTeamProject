package com.mtms.service;

import java.util.List;

import com.mtms.domain.CommentReportVO;
import com.mtms.domain.Criteria;

public interface CommentReportService {
	
	//삭제
	public boolean remove(int commentNo); 
	
	//상세보기
	public CommentReportVO get(int commentReportNo); 
	
	//등록
	public void register(CommentReportVO commentReport); 
	
	//전체목록 조회(페이징)
	public List<CommentReportVO> getList(Criteria cri); 
	
	//페이지 총 갯수
	public int getTotal(Criteria cri);
}
