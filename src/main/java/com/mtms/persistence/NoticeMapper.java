package com.mtms.persistence;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.NoticeVO;

public interface NoticeMapper {
public void insertSelectKey(NoticeVO notice); //등록
	
	public List<NoticeVO> getList(); //조회
	
	public NoticeVO read(int noticeNo); //상세보기
	
	public int update(NoticeVO notice); //수정
	
	public int delete(int noticeNo); //삭제
	
	public int getTotalCount(Criteria cri); //총 갯수
	
	public List<NoticeVO> getListWithPaging(Criteria cri); 
}
