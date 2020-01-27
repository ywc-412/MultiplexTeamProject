package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.LostVO;

public interface LostService {
	public int getTotalCount(Criteria cri);
	public List<LostVO> getList(Criteria cri);
	public boolean modify(LostVO lvo);
	public boolean remove(int lostNo);
	public LostVO get(int lostNo);
	public void register(LostVO lvo);
}
