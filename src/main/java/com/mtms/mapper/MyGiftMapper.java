package com.mtms.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;

public interface MyGiftMapper {
	
	//내 기프티콘 목록 생성
	public void myInsertSelectKey(MyGiftVO myGift); 															
	
	//내 기프티콘 조회
	public List<MyGiftVO> getListWithPaging(@Param("cri") Criteria cri, @Param("memberId") String memberId);	
	
	//내 기프티콘 상세보기
	public List<MyGiftVO> read(@Param("myGiftNo") int myGiftNo, @Param("memberId") String memberId); 			
	
	//내 기프티콘 기간연장
	public int extend(@Param("myGiftNo") int myGiftNo, @Param("expireDate") String expireDate, @Param("memberId") String memberId); 					
	
	//내 기프티콘 환불
	public int refund(@Param("myGift") MyGiftVO myGift, @Param("memberId") String memberId); 					
	
	//내 기프티콘 총 갯수
	public int getTotalCount(Criteria cri, @Param("memberId") String memberId); 								
	
	//내 기프티콘 만료 체크
	public void expireChk(@Param("expireDate") String expireDate);
	
}
