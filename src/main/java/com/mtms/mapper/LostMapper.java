package com.mtms.mapper;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.LostVO;

public interface LostMapper {
	public int getTotalCount(Criteria cri);
	public List<LostVO> getListWithPaging(Criteria cri);
//	public void insertSelectKey(LostVO lvo);							
	public void insert(LostVO lvo);
	public int update(LostVO lvo);
	public int delete(int lostNo);
	public LostVO read(int lostNo);
	public int updateView(int lostNo);
}
