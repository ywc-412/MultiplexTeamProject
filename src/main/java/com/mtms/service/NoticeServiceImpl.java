package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.mapper.NoticeMapper;
import com.mtms.domain.Criteria;
import com.mtms.domain.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private NoticeMapper noticeMapper;
	
	//공지사항 등록
	@Override
	public void register(NoticeVO notice) {			
		noticeMapper.insertSelectKey(notice);
	}
	
	//공지사항 조회
	@Override
	public List<NoticeVO> getList(Criteria cri) {	
		return noticeMapper.getListWithPaging(cri);
	}
	
	//공지사항 상세보기
	@Override
	public NoticeVO get(int noticeNo) {				
		return noticeMapper.read(noticeNo);
	}
	
	//공지사항 수정
	@Override
	public boolean modify(NoticeVO notice) {		
		return noticeMapper.update(notice) == 1;
	}
	
	//공지사항 삭제
	@Override
	public boolean remove(int noticeNo) {	
		return noticeMapper.delete(noticeNo) == 1;
	}
	
	//공지사항 총 갯수
	@Override
	public int getTotalCount(Criteria cri) {	
		return noticeMapper.getTotalCount(cri);
	}
	
	//공지사항 조회수
	@Override
	public boolean viewUpdate(int noticeNo) {
		return noticeMapper.viewUpdate(noticeNo);
	}
	
}
