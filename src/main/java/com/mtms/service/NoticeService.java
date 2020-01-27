package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.NoticeVO;

public interface NoticeService {
	
	//공지사항 등록
	public void register(NoticeVO notice); 		 
	
	//공지사항 조회
	public List<NoticeVO> getList(Criteria cri); 
	
	//공지사항 상세보기
	public NoticeVO get(int noticeNo); 			 
	
	//공지사항 수정
	public boolean modify(NoticeVO notice); 	 
	
	//공지사항 삭제
	public boolean remove(int noticeNo); 		 
	
	//공지사항 총 갯수
	public int getTotalCount(Criteria cri); 	 
	
	//공지사항 조회수
	public boolean viewUpdate(int noticeNo);	
	
}
