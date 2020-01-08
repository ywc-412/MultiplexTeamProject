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
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper noticeMapper;

	@Override
	public void register(NoticeVO notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeVO get(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(NoticeVO notice) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int noticeNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
}
