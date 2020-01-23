package com.mtms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;

public interface MyGiftMapper {
	public void myInsertSelectKey(MyGiftVO myGift); 		//내 기프티콘 등록
	
	public List<MyGiftVO> getListWithPaging(Criteria cri);	//내 기프티콘 조회
	
	public List<MyGiftVO> read(int myGiftNo); 				//내 기프티콘 상세보기
	
	public int extend(MyGiftVO myGift); 					//내 기프티콘 기간연장
	
	public int refund(MyGiftVO myGift); 					//내 기프티콘 환불
	//public int delete(int myGiftNo); 						//내 기프티콘 환불
	
	public int getTotalCount(Criteria cri); 				//내 기프티콘 총 갯수
	
	public void expireChk(@Param("expireDate") String expireDate);				//내 기프티콘 만료 체크
}
