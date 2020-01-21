package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void registerSuggest(SuggestVO suggestVO) {
		suggestMapper.insertSuggestSelectKey(suggestVO);
	}

	@Override
	@Transactional
	public SuggestVO getSuggest(int suggestNo) {
		suggestMapper.updateViewCount(suggestNo);
		return suggestMapper.getSuggest(suggestNo);
	}

	@Override
	public int removeSuggest(int suggestNo) {
		
		return suggestMapper.deleteSuggest(suggestNo);
	}

	@Override
	public int modifySuggest(SuggestVO suggestVO) {
		
		return suggestMapper.updateSuggest(suggestVO);
	}

	@Override
	public List<SuggestVO> getSuggestListWithPaging(Criteria cri) {
		
		return suggestMapper.getSuggestList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return suggestMapper.getTotalCount(cri);
	}
}
