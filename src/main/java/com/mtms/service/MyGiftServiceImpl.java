package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.MyGiftVO;
import com.mtms.persistence.MyGiftMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MyGiftServiceImpl implements MyGiftService{
	@Setter(onMethod_ = @Autowired)
	private MyGiftMapper myGiftMapper;

	@Override
	public List<MyGiftVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MyGiftVO get(int myGiftNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean extend(MyGiftVO myGift) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean refund(int myGiftNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
}
