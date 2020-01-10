package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.GiftAttachMapper;
import com.mtms.mapper.GiftMapper;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class GiftServiceImpl implements GiftService{
	private GiftMapper giftMapper;
	private GiftAttachMapper giftAttachMapper;
	
	@Override
	public void register(GiftVO gift) {		//기프티콘 등록
		// TODO Auto-generated method stub	
	}

	@Override
	public List<GiftVO> getList() {		//기프티콘 조회
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GiftVO pay(int giftNo) {		//기프티콘 결제완료
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public GiftVO get(int giftNo) {		//기프티콘 상세보기
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}


}
