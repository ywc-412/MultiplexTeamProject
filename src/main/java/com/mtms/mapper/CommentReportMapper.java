package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.CommentReportVO;
import com.mtms.domain.Criteria;

public interface CommentReportMapper {
	
	//한줄평 신고 총페이지
	public int getTotalCount(Criteria cri);
	
	//한줄평 신고 전체 조회 페이징
	public List<CommentReportVO> getListWithPaging(Criteria cri);
	
	//한줄평 신고 삭제
	public int delete(int CommentReportNo);
	
	//한줄평 신고 상세보기
	public CommentReportVO read(int CommentReportNo);
	
	//한줄평 신고 등록
	public void insert(CommentReportVO ReportComment);
	
	
}
