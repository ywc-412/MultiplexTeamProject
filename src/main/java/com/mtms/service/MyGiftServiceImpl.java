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
@AllArgsConstructor
@Log4j
public class MyGiftServiceImpl implements MyGiftService{

	private MyGiftMapper myGiftMapper;	
	private GiftAttachMapper giftAttachMapper;	
	private MemberMapper memberMapper;
	private GiftMapper giftMapper;
	

	
	@Override
	public List<MyGiftVO> getListWithPaging(Criteria cri) {	//내 기프티콘 조회
		log.info("MyGift ServiceImpl list()");
		return myGiftMapper.getListWithPaging(cri);
	}

	@Override
	//public MyGiftVO get() {			//내 기프티콘 상세보기
	public List<MyGiftVO> get(int myGiftNo) {			//내 기프티콘 상세보기
		log.info("MyGift ServiceImpl list()");
		return myGiftMapper.read(myGiftNo);
	}

	@Override
	public boolean extend(MyGiftVO myGift) {	//내 기프티콘 연장
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean refund(int myGiftNo) {		//내 기프티콘 환불
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotalCount(Criteria cri) {	//내 기프티콘 총 갯수
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void myInsertSelectKey(MyGiftVO myGift) {
		myGiftMapper.myInsertSelectKey(myGift);		
	}
}
