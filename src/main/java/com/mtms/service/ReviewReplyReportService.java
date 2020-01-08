package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReplyReportVO;

public interface ReviewReplyReportService {
	public int getTotalCount(Criteria cri);
	public List<ReplyReportVO> getList(Criteria cri);
	public List<ReplyReportVO> getList();
	public boolean modify(ReplyReportVO rpvo);
	public boolean remove(long reportVo);
	public ReplyReportVO get(int reportNo);
	public void register(ReplyReportVO rpvo);
}
