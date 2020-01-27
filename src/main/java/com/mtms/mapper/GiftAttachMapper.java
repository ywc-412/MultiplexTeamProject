package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;

public interface GiftAttachMapper {
	public void insert(GiftAttachVO gvo);	
	
	public List<GiftAttachVO> findBygiftNo(int giftNo);
	
	public List<GiftAttachVO> giftPicList();
	
	public void delete(String giftUuid);
	
	public void deleteAll(int giftNo);
}
