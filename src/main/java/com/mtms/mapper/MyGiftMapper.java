package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;
import com.mtms.domain.NoticeVO;

public interface MyGiftMapper {
	public void insertSelectKey(MyGiftVO myGift); 				//내 기프티콘 등록
	
	public List<MyGiftVO> getListWithPaging(Criteria cri);	//내 기프티콘 조회
	
	public MyGiftVO read(int mygiftNo); 					//내 기프티콘 상세보기
	
	public int update(MyGiftVO myGift); 					//내 기프티콘 기간연장
	
	public int delete(int myGiftNo); 						//내 기프티콘 환불
	
	public int getTotalCount(Criteria cri); 				//내 기프티콘 총 갯수
}
