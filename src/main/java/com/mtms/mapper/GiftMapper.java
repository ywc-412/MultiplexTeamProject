package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;

public interface GiftMapper {
	
	//기프티콘 등록
	public void insertSelectKey(GiftVO gift); 
	
	//기프티콘 조회
	public List<GiftVO> getList(); 			  
	
	//기프티콘 상세보기
	public GiftVO read(int giftNo); 		  
	
	//기프티콘 수정
	public int update(GiftVO gift); 		  
	
	//기프티콘 목록 삭제
	public int deleteChk(GiftVO gift); 		  
	
	//기프티콘 결제완료	
	public GiftVO pay(int giftNo);
		 
}
