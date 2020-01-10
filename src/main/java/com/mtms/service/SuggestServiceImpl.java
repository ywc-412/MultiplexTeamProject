package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.domain.Criteria;
import com.mtms.domain.SuggestVO;
import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.SuggestMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SuggestServiceImpl implements SuggestService{

	private SuggestMapper suggestMapper;
	private MemberMapper memberMapper;

	@Override
	public void registerSuggest(SuggestVO svo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SuggestVO getSuggest(int suggestNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeSuggest(int suggestNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifySuggest(SuggestVO svo) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public List<SuggestVO> getSuggestList(Criteria cri) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<SuggestVO> getSuggestListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
}
