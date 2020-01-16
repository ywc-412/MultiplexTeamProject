package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.mapper.GiftAttachMapper;
import com.mtms.mapper.GiftMapper;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class GiftServiceImpl implements GiftService{
	@Setter(onMethod_ = @Autowired)
	private GiftMapper giftMapper;
	
	@Setter(onMethod_ = @Autowired)
	private GiftAttachMapper giftAttachMapper;
	
	@Transactional
	@Override
	public void register(GiftVO gift) {		//기프티콘 등록
		log.warn(gift);
		giftMapper.insertSelectKey(gift);				
		
		List<GiftAttachVO> attachList = gift.getAttachList();
		
		log.warn(attachList);
		
		//첨부파일이 없으면 중단
		if(attachList == null || attachList.size() <=0) {
			return;
		}
		
		
		//첨부파일이 있으면 giftAttach에 insert
		attachList.forEach(gvo -> {
			gvo.setGiftNo(gift.getGiftNo());
			System.out.println("giftNo");
			giftAttachMapper.insert(gvo);
		});
	}

	@Override
	public List<GiftVO> getList() {		//기프티콘 조회
		log.info("getList..........");
		return giftMapper.getList();
	}

	@Override
	public GiftVO pay(int giftNo) {		//기프티콘 결제완료
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public GiftVO get(int giftNo) {		//기프티콘 상세보기
		return giftMapper.read(giftNo);
	}

	@Override
	public boolean modify(GiftVO gift) {	//기프티콘 수정
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int giftNo) {		//기프티콘 삭제
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<GiftAttachVO> getAttachList(int giftNo) {	//기프티콘 사진 등록
		log.warn("getAttachList giftNo : " + giftNo);
		return giftAttachMapper.findBygiftNo(giftNo);
	}

}
