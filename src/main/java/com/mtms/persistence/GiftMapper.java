package com.mtms.persistence;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftVO;

public interface GiftMapper {
public void insertSelectKey(GiftVO gift); //등록
	
	public List<GiftVO> getList(); //조회
	
	public GiftVO read(int giftNo); //상세보기
	
	public int update(GiftVO gift); //수정
	
	public int delete(int giftNo); //삭제
	
	public int getTotalCount(Criteria cri); //총 갯수
	
	public List<GiftVO> getListWithPaging(Criteria cri); 
}
