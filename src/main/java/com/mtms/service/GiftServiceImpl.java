package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.mapper.GiftAttachMapper;
import com.mtms.mapper.GiftMapper;
import com.mtms.mapper.MyGiftMapper;
import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.domain.MyGiftVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
public class GiftServiceImpl implements GiftService{
	
	@Setter(onMethod_ = @Autowired)
	private GiftMapper giftMapper;
	
	@Setter(onMethod_ = @Autowired)
	private GiftAttachMapper giftAttachMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MyGiftMapper mygiftMapper;
	
	//기프티콘 등록
	@Transactional
	@Override
	public void register(GiftVO gift) {		
		giftMapper.insertSelectKey(gift);			
		List<GiftAttachVO> attachList = gift.getAttachList();			
		//첨부파일이 없으면 중단
		if(attachList == null || attachList.size() <=0) {
			return;
		}		
		//첨부파일이 있으면 giftAttach에 insert
		attachList.forEach(gvo -> {
			gvo.setGiftNo(gift.getGiftNo());
			giftAttachMapper.insert(gvo);
		});
	}
	
	//기프티콘 조회
	@Override
	public List<GiftVO> getList() {		
		return giftMapper.getList();
	}
	
	//기프티콘 상세보기
	@Override
	public GiftVO get(int giftNo) {		
		return giftMapper.read(giftNo);
	}
	
	//기프티콘 수정
	@Transactional
	@Override
	public boolean modify(GiftVO gift) {	
		giftAttachMapper.deleteAll(gift.getGiftNo());
		boolean modifyResult = giftMapper.update(gift) == 1;
		if(modifyResult && gift.getAttachList() != null & gift.getAttachList().size() > 0) {
			gift.getAttachList().forEach(attach -> {
				attach.setGiftNo(gift.getGiftNo());
				giftAttachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	//기프티콘 삭제	
	@Transactional
	@Override
	public boolean deleteChk(GiftVO gift) {		
		return giftMapper.deleteChk(gift) == 1;
	}

	//해당 기프티콘 사진 붙이기
	@Override
	public List<GiftAttachVO> getAttachList(int giftNo) {	
		return giftAttachMapper.findBygiftNo(giftNo);
	}
	
	//기프티콘 사진 목록
	@Override
	public List<GiftAttachVO> giftPicList() {
		return giftAttachMapper.giftPicList();
	}
	
	//기프티콘 결제완료
	@Transactional
	@Override
	public GiftVO pay(int giftNo, MyGiftVO myGift) {
		return giftMapper.pay(giftNo);		
	}

}
