package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;

public interface MyGiftService {
	public void register(MyGiftVO myGift);					//내 기프티콘 등록
	
	public List<MyGiftVO> getListWithPaging(Criteria cri);  //내 기프티콘 조회
	
	public MyGiftVO get(int myGiftNo); 						//내 기프티콘 상세보기
	
	public boolean extend(MyGiftVO myGift); 				//내 기프티콘 기간연장
	
	public boolean refund(int myGiftNo); 					//내 기프티콘 환불

	public int getTotalCount(Criteria cri); 				//내 기프티콘 총 갯수
}
