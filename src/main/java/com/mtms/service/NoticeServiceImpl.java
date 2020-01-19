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
@Log4j
public class NoticeServiceImpl implements NoticeService{
	private NoticeMapper noticeMapper;
	
	//공지사항 등록
	@Override
	public void register(NoticeVO notice) {			
		log.info("Notice ServiceImpl register,,");
		noticeMapper.insertSelectKey(notice);
	}
	
	//공지사항 조회
	@Override
	public List<NoticeVO> getList(Criteria cri) {	
		log.info("Notice ServiceImpl List,,,");
		return noticeMapper.getListWithPaging(cri);
	}
	
	@Override
	public boolean viewUpdate(int noticeNo) {
		log.info("Notice ServiceImpl viewUpdate,,,");
		return noticeMapper.viewUpdate(noticeNo);
	}
	
	//공지사항 상세보기
	@Override
	public NoticeVO get(int noticeNo) {				
		log.info("Notice ServiceImpl Get,,,");
		return noticeMapper.read(noticeNo);
	}
	
	//공지사항 수정
	@Override
	public boolean modify(NoticeVO notice) {		
		log.info("Notice ServiceImpl Modify,,,");
		return noticeMapper.update(notice) == 1;
	}
	
	//공지사항 삭제
	@Override
	public boolean remove(int noticeNo) {	
		log.info("Notice ServiceImpl Remove,,,");
		return noticeMapper.delete(noticeNo) == 1;
	}
	
	//공지사항 총 갯수
	@Override
	public int getTotalCount(Criteria cri) {	
		log.info("Notice ServiceImpl TotalNotice,,,");
		return noticeMapper.getTotalCount(cri);
	}

	
}
