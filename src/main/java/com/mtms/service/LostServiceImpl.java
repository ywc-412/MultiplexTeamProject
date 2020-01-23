package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mtms.domain.Criteria;
import com.mtms.domain.LostVO;
import com.mtms.mapper.LostMapper;
import com.mtms.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public  class LostServiceImpl implements LostService{
	private LostMapper lostMapper;

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return lostMapper.getTotalCount(cri);
	}

	@Override
	public List<LostVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return lostMapper.getListWithPaging(cri);
	}

	@Override
	public boolean modify(LostVO lvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int lostNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public LostVO get(int lostNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(LostVO lvo) {
		// TODO Auto-generated method stub
		lostMapper.insert(lvo);
	}

}
