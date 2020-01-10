package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public void register(NoticeVO notice) {			//공지사항 등록
		// TODO Auto-generated method stub		
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {	//공지사항 조회
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public NoticeVO get(int noticeNo) {				//공지사항 상세보기
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(NoticeVO notice) {		//공지사항 수정
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int noticeNo) {			//공지사항 삭제	
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotalCount(Criteria cri) {	//공지사항 총 갯수
		// TODO Auto-generated method stub
		return 0;
	}
}
