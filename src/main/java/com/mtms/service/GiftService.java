package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;

public interface GiftService {
public void register(GiftVO gift); //등록
	
	public List<GiftVO> getList(Criteria cri); //조회
	
	public GiftVO get(int giftNo); //상세보기
	
	public boolean modify(GiftVO gift); //수정
	
	public boolean remove(int giftNo); //삭제
	
	public int getTotalCount(Criteria cri); //총 갯수
	
	public List<GiftAttachVO> getAttachList(int giftNo);
}
