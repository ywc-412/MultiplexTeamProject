package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;

public interface GiftService {
	
	//기프티콘 등록
	public void register(GiftVO gift); 						
	
	//기프티콘 조회
	public List<GiftVO> getList(); 									
	
	//기프티콘 상세보기
	public GiftVO get(int giftNo); 							
	
	//기프티콘 수정
	public boolean modify(GiftVO gift); 					
	
	//기프티콘 삭제
	public boolean deleteChk(GiftVO gift); 					
	
	//해당 기프티콘 사진 붙이기
	public List<GiftAttachVO> getAttachList(int giftNo);	
	
	//기프티콘 사진 목록
	public List<GiftAttachVO> giftPicList();	
	
	//기프티콘 결제완료
	public GiftVO pay(int giftNo, MyGiftVO myGift);	
}
