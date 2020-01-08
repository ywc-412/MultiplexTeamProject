package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.NoticeVO;

public interface NoticeService {
	public void register(NoticeVO notice); //등록
	
	public List<NoticeVO> getList(Criteria cri); //조회
	
	public NoticeVO get(int noticeNo); //상세보기
	
	public boolean modify(NoticeVO notice); //수정
	
	public boolean remove(int noticeNo); //삭제
	
	public int getTotalCount(Criteria cri); //총 갯수
}
