package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.GiftAttachMapper;
import com.mtms.mapper.GiftMapper;
import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.MyGiftMapper;
import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
public class MyGiftServiceImpl implements MyGiftService{

	@Setter(onMethod_ = @Autowired)
	private MyGiftMapper myGiftMapper;	
	
	//내 기프티콘 목록 생성
	@Override
	public void myInsertSelectKey(MyGiftVO myGift) {
		myGiftMapper.myInsertSelectKey(myGift);		
	}
	
	//내 기프티콘 조회
	@Override
	public List<MyGiftVO> getListWithPaging(Criteria cri, String memberId) {	
		return myGiftMapper.getListWithPaging(cri, memberId);
	}
	
	//내 기프티콘 상세보기
	@Override
	public List<MyGiftVO> get(int myGiftNo, String memberId) {					
		return myGiftMapper.read(myGiftNo, memberId);
	}
	
	//내 기프티콘 연장
	@Override
	public boolean extend(MyGiftVO myGift, String memberId) {					
		return myGiftMapper.extend(myGift, memberId) == 1;
	}
	
	//내 기프티콘 환불
	@Override
	public boolean refund(MyGiftVO myGift, String memberId) {	
		return myGiftMapper.refund(myGift, memberId) == 1;
	}
	
	//내 기프티콘 총 갯수
	@Override
	public int getTotalCount(Criteria cri, String memberId) {	
		return myGiftMapper.getTotalCount(cri, memberId);
	}

}
