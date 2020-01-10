package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyReportVO;

public interface ReviewReplyReportMapper {
	public int getTotalCount(Criteria cri);
	public List<ReplyReportVO> getListWithPaging(Criteria cri);
	public void insertSelectKey( ReplyReportVO rpvo);							
	public void insert(ReplyReportVO rpvo);
	public int update(ReplyReportVO rpvo);
	public int delete(int replyNo);
	public ReplyReportVO read(int replyReportNo);
}
