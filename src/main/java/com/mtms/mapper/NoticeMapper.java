package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.NoticeVO;

public interface NoticeMapper {
	public void insertSelectKey(NoticeVO notice); 			//공지사항 등록
	
	public List<NoticeVO> getListWithPaging(Criteria cri);	//공지사항 조회
	
	public NoticeVO read(int noticeNo); 					//공지사항 상세보기
	
	public int update(NoticeVO notice); 					//공지사항 수정
	
	public int delete(int noticeNo); 						//공지사항 삭제
	
	public int getTotalCount(Criteria cri); 				//공지사항 총 갯수
	
	public int viewUpdate(int noitceNo);					//공지사항 조회수
}
