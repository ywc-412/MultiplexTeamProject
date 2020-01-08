package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewReportVO;

public interface ReviewReportMapper {
	public int getTotalCount(Criteria cri);
	public List<ReviewReportVO> getListWithPaging(Criteria cri);
	public void insertSelectKey(ReviewReportVO rrvo);							
	public void insert(ReviewReportVO rrvo);
	public int update(ReviewReportVO rrvo);
	public int delete(int reportNo);
	public ReviewReportVO read(int reportNo);
}
