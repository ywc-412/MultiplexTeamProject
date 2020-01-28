package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;

public interface GiftAttachMapper {
	//사진 파일 삽입
	public void insert(GiftAttachVO gvo);	
	
	//giftNo에 맞는 사진 get
	public List<GiftAttachVO> findBygiftNo(int giftNo);
	
	//내 기프티콘에 뿌릴 사진 list
	public List<GiftAttachVO> giftPicList();
	
	//사진 하나 삭제
	public void delete(String giftUuid);
	
	//글 삭제될 때 사진도 모두 삭제
	public void deleteAll(int giftNo);
}
