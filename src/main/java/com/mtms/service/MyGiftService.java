package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;

public interface MyGiftService {
public List<MyGiftVO> getList(); //조회
	
	public MyGiftVO get(int myGiftNo); //상세보기
	
	public boolean extend(MyGiftVO myGift); //기간연장
	
	public boolean refund(int myGiftNo); //환불

	public int getTotalCount(Criteria cri); //총 갯수
}
