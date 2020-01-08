package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.GiftAttachVO;

public interface GiftAttachMapper {
	public void insert(GiftAttachVO gvo);	
	
	public List<GiftAttachVO> findBygiftNo(int giftNo);
	
	public void delete(String uuid);
	
	public void deleteAll(int giftNo);
	
	public List<GiftAttachVO> getOldFiles();
}
