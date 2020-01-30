package com.mtms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;

public interface MyGiftService {
	
	//내 기프티콘 목록 생성
	public void myInsertSelectKey(MyGiftVO myGift); 						 
	
	//내 기프티콘 조회
	public List<MyGiftVO> getListWithPaging(Criteria cri, String memberId);  
	
	//내 기프티콘 상세보기
	public List<MyGiftVO> get(int myGiftNo, String memberId); 				 
	
	//내 기프티콘 기간연장
	public boolean extend (int myGiftNo, String expireDate, String memberId); 				 
	
	//내 기프티콘 환불
	public boolean refund(MyGiftVO myGift, String memberId); 				 
	
	//내 기프티콘 총 갯수
	public int getTotalCount(Criteria cri, String memberId); 	
	
}
