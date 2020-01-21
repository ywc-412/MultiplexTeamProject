package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;

public interface GiftService {
	public void register(GiftVO gift); 						//기프티콘 등록
	
	public List<GiftVO> getList(); 							//기프티콘 조회
	
	public GiftVO pay(int giftNo, MyGiftVO myGift);			//기프티콘 결제완료
	
	public GiftVO get(int giftNo); 							//기프티콘 상세보기
	
	public boolean modify(GiftVO gift); 					//기프티콘 수정
	
	public boolean remove(int giftNo); 						//기프티콘 삭제
	
	public List<GiftAttachVO> getAttachList(int giftNo);	//기프티콘 사진 붙이기
	
	public List<GiftAttachVO> giftPicList();				//기프티콘 사진 목록
}
