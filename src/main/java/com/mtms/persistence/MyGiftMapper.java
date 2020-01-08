package com.mtms.persistence;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;

public interface MyGiftMapper {
public List<MyGiftVO> getList(Criteria cri); //조회
	
	public MyGiftVO read(int mygiftNo); //상세보기
	
	public int update(MyGiftVO myGift); //기간연장
	
	public int delete(int myGiftNo); //환불
}
